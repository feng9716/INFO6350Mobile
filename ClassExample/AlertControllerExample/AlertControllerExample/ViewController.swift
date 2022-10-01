//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by 冯哲宁 on 10/1/22.
//

import UIKit

class ViewController: UIViewController {

    var textField : UITextField?
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet var btnShowAlert: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func showAlert(_ sender:Any){
        let alertController = UIAlertController(title:"Alert Controller Example", message: "Alert Message", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default){
            action in
            print("OK Button Pressed")
            self.lblText.text = self.textField?.text
        }
        
        let cancleButton = UIAlertAction(title: "Cancle", style: .cancel){action in
            print("Cancle Button Pressed")
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancleButton)
        
        alertController.addTextField(){ lblTextField in
            self.textField = lblTextField
            lblTextField.placeholder = "placeholder"
        }
        
        self.present(alertController, animated: true)
    }
}

