//
//  PerformMaintainanceViewController.swift
//  EquipmentMaintainance
//
//  Created by 冯哲宁 on 10/29/22.
//

import UIKit
import FirebaseDatabase

class PerformMaintainanceViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var txtActivity: UITextField!
    @IBOutlet weak var txtRemark: UITextField!
    @IBOutlet weak var txtRectification: UITextField!
    @IBOutlet weak var txtProblem: UITextField!
    
    var serialNumber: String = ""
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func submitAction(_ sender: Any) {
        let date = datePicker.date
        
        let problem = txtProblem.text!
        let rectification = txtRectification.text!
        let remark = txtRemark.text!
        let activity = txtRemark.text!
        
        guard let key = ref.child("Equipment/\(serialNumber)/maintainanceHistory").childByAutoId().key else {return}
        
        let maintainance = ["date":date, "NatureOfProblem":problem,
                            "RectificationWork": rectification,
                            "Remarks": remark,
                            "Acrivity":activity] as [String : Any]
        
        let childUpdates = ["Equipment/\(serialNumber)/maintainanceHistory/\(key)": maintainance ]
        
        ref.updateChildValues(childUpdates)
        
        txtProblem.text = ""
        txtRectification.text = ""
        txtRemark.text = ""
        txtRemark.text = ""
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
