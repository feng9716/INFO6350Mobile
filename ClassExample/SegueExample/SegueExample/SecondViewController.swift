//
//  SecondViewController.swift
//  SegueExample
//
//  Created by 冯哲宁 on 10/8/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    var welcomeStr = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = welcomeStr
    }

}
