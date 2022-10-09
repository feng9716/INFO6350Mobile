//
//  SecondViewController.swift
//  ProtocolsAndDelegate
//
//  Created by 冯哲宁 on 10/8/22.
//

import UIKit

class SecondViewController: UIViewController {

    var sendNameDelegate: SendNameDelegate?
    
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setName(_ sender: Any) {
        guard let name = txtName.text else {return}
        sendNameDelegate?.sendName(name: name)
        
        self.navigationController?.popViewController(animated: true)
    }
}
