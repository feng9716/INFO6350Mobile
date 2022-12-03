//
//  ViewController.swift
//  UILoginTest
//
//  Created by 冯哲宁 on 12/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.text = ""
        txtEmail.placeholder = strEmail
        txtPassword.placeholder = strPassword
        btnLogin.setTitle(strLogin, for: .normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        let email = txtEmail.text;
        let password = txtPassword.text;
        
        if(email == "test@test.com" && password == "test"){
            lblStatus.text = ""
            performSegue(withIdentifier: "segueDashboard", sender: self)
        }
        else{
            lblStatus.text = strError
        }
    }
    
}

