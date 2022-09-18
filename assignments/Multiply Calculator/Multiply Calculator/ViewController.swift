//
//  ViewController.swift
//  Multiply Calculator
//
//  Created by 冯哲宁 on 9/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    
    @IBOutlet weak var txtRes: UILabel!
    
    @IBAction func multiplyAction(_ sender: Any) {
        let num1 = Int(txtNum1.text ?? "0") ?? 0
        let num2 = Int(txtNum2.text ?? "0") ?? 0
        
        let product = num1 * num2
        
        txtRes.text = String(product)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

