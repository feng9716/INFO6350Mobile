//
//  DashboardViewController.swift
//  PatientHealthChart
//
//  Created by 冯哲宁 on 11/5/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class DashboardViewController: UIViewController {

    @IBOutlet weak var txtWeightLbs: UITextField!
    @IBOutlet weak var txtHeightInches: UITextField!
    @IBOutlet weak var txtHeightFT: UITextField!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtFirstname: UITextField!
    
    var db : Firestore?
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutAction(_ sender: Any) {
        let keychain = KeyChainService().keyChain
                keychain.clear()

                do {
                    try Auth.auth().signOut()
                }
                catch{
                    print("Unable to logout")
                }

                self.navigationController?.popViewController(animated: true)
    }
    @IBAction func saveAction(_ sender: Any) {
        //First name
        // Last name
        // DOB
        // Height Ft
        // Height In
        // Weight
        // UID

        
        guard let uid = Auth.auth().currentUser?.uid else{return}
        
        guard let firstname = txtFirstname.text else {return}
        guard let lastname = txtLastname.text else{return}
        guard let firstname = txtFirstname.text else{return}
        guard let heightFt = txtHeightFT.text else{return}
        guard let heightIn = txtHeightInches.text else{return}
        guard let weight = txtWeightLbs.text else {return}
        let dob = dateOfBirth.date
        
        
        // Add a new document with a generated ID
        guard let db = db else {return}
        
       db.collection("patients").document(uid).setData([
            "FirstName": firstname,
            "LastName": lastname,
            "HeightFeet": Int(heightFt) ?? 5,
            "HeightInches" : Int(heightIn) ?? 10,
            "WeightLbs": Int(weight) ?? 150,
//            "DOB": dob
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            }
        }
    }
}
