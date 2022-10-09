//
//  ViewController.swift
//  PromiseExample
//
//  Created by 冯哲宁 on 10/8/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit

class ViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getStockPrice(_ sender: Any) {
        let apiKey = "b772c775d43a4cadd0dbafebef63f8fd"
        var url = "https://financialmodelingprep.com/api/v3/quote/"
        url += txtStockSymbol.text!
        url += "?apikey="
        url += apiKey
                
        getStockQuote(url: url)
            .done{
                companyQuote in
                    print("\(companyQuote)\n Name: \(companyQuote.name)\n Symbol: \(companyQuote.symbol)\n Price: \(companyQuote.price)")
                
            }
            .catch{error in print(error)}
//                SwiftSpinner.show("Fetching stock values")
    }
    
    func getStockQuote(url: String) -> Promise<CompanyQuote> {
        return Promise<CompanyQuote> { seal -> Void in
            AF.request(url).responseJSON { response in
                print("Response")
                
//                SwiftSpinner.hide()
                if(response.error != nil){
                    seal.reject(response.error!)
//                    print(response.error!)
//                    return
                }
                
                guard let stock = JSON(response.data!).array?.first else {return}
                
                let quote = CompanyQuote()
                
                quote.symbol = stock["symbol"].stringValue
                quote.name = stock["name"].stringValue
                quote.price = stock["price"].floatValue
                
                seal.fulfill(quote)
            }
        }
    }
}

