//
//  StockDetailViewController.swift
//  FinalStock
//
//  Created by 冯哲宁 on 12/13/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class StockDetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var symbol = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/getstock?symbol="
        url += symbol
        
        print(url)
        // Do any additional setup after loading the view.
        
        AF.request(url).responseJSON{ response in
            if(response.error != nil) {
                print(response.error!)
                return
            }
            
            let stock = JSON(response.data)
            print(stock)
            
            let name = stock["CompanyName"].stringValue
            let symbol = stock["Symbol"].stringValue
            let price = stock["Price"].floatValue
            self.lblName.text = "Name: \(name)"
            self.lblLabel.text = "Symbol: \(symbol)"
            self.lblPrice.text = "Price: \(price)" 
            
        }
    }
    



}
