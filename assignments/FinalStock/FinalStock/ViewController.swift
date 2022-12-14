//
//  ViewController.swift
//  FinalStock
//
//  Created by 冯哲宁 on 12/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var stockList = [] as [String]
    var symbolList = [] as [String]
    
    var selectName = ""
    var selectSymbol = ""
    @IBOutlet weak var stockTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stockTbl.dataSource = self
        stockTbl.delegate = self
        
        let url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/allstocks"
        
        AF.request(url).responseJSON{ response in
            if(response.error != nil) {
                print(response.error!)
                return
            }
            
            guard let stocks = JSON(response.data!).array else {return}
            
            for stock in stocks {
                let name = stock["CompanyName"].stringValue
                let symbol = stock["Symbol"].stringValue
                self.stockList.append(name)
                self.symbolList.append(symbol)
                print(self.symbolList)
            }
            
            self.stockTbl.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! StockLabelTableViewCell
        
        
        cell.lblName.text = stockList[indexPath.row]
        cell.imgStock.image = UIImage(named: stockList[indexPath.row])
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailSegue") {
            let secondVC = segue.destination as! StockDetailViewController
            secondVC.symbol = self.selectSymbol
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let currentCell = tableView.cellForRow(at: indexPath) as! StockLabelTableViewCell

        selectSymbol = symbolList[indexPath.row]
        print(selectSymbol)
        
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
}

