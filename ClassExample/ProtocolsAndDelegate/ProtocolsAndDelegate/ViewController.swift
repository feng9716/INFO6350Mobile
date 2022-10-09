//
//  ViewController.swift
//  ProtocolsAndDelegate
//
//  Created by 冯哲宁 on 10/8/22.
//

import UIKit

class ViewController: UIViewController, SendNameDelegate{
    @IBOutlet weak var lblWelcome: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goTo2ndVC(_ sender: Any) {
        performSegue(withIdentifier: "secondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "secondVC") {
            let secondVC = segue.destination as! SecondViewController
            secondVC.sendNameDelegate = self
        }
    }
    
    func sendName(name: String) {
        lblWelcome.text = "Welcome \(name) !!!"
    }
    
}

