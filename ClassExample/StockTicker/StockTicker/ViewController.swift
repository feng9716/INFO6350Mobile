//
//  ViewController.swift
//  StockTicker
//
//  Created by 冯哲宁 on 10/1/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    @IBOutlet weak var btnGetPrice: UIButton!
    @IBOutlet weak var lblStock: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockPrice(_ sender:Any){
        let apiKey = "b772c775d43a4cadd0dbafebef63f8fd"
        var url = "https://financialmodelingprep.com/api/v3/quote/"
        url += txtStockSymbol.text!
        url += "?apikey="
        url += apiKey
        
        SwiftSpinner.show("Fetching stock values")
        
        // url https://financialmodelingprep.com/api/v3/quote/AAPL?apikey=b772c775d43a4cadd0dbafebef63f8fd
        AF.request(url).responseJSON { response in
//            print(response)
            
            SwiftSpinner.hide()
            if(response.error != nil){
                print(response.error!)
                return
            }
            
            guard let stock = JSON(response.data!).array?.first else {return}
            
            print(stock["name"].stringValue)
            print(stock["price"].stringValue)
        }
        print(url)
    }
}

