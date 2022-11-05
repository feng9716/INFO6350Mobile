//
//  ViewController.swift
//  EquipmentMaintainance
//
//  Created by 冯哲宁 on 10/22/22.
//

import UIKit
import FirebaseAuth
import SwiftKeychain
import FirebaseCore


class ViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.isHidden=true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated:Bool){
        let keychain = KeychainService().keyChain
        if(keychain.get("uid") != nil){
            
        }
    }

    func addUIDToKeychain(uid: String){
        let keyChain = KeychainService().keyChain
        keyChain.set(uid, forKey: "uid")
    }
    
    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        if(email.isEmail == false){
            lblStatus.text = "Please Enter valid email"
            lblStatus.isHidden = false
            return;
        }
        
        if(password.isPasswordStrong == false){
            lblStatus.text = "password < 6"
            lblStatus.isHidden = false
            return;
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          
            if error != nil{
                strongSelf.lblStatus.text = error?.localizedDescription
                print(error?.localizedDescription)
                strongSelf.lblStatus.isHidden = false
                return
            }
            
//            strongSelf.addUIDToKeychain(uid: Auth.auth().currentUser)
            strongSelf.txtPassword.text = ""
            strongSelf.lblStatus.text=""
            strongSelf.lblStatus.isHidden=true
            strongSelf.performSegue(withIdentifier: "segueLogIn", sender: self)
        }
    }
    

}

