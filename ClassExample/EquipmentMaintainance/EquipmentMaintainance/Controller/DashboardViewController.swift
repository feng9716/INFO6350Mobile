//
//  DashboardViewController.swift
//  EquipmentMaintainance
//
//  Created by 冯哲宁 on 10/29/22.
//

import UIKit
import FirebaseDatabase

class DashboardViewController: UIViewController {

    @IBOutlet weak var lblEquipment: UILabel!
    @IBOutlet weak var lblModel: UILabel!
    @IBOutlet weak var txtSerialNum: UITextField!
    @IBOutlet weak var lblMake: UILabel!
    
    
    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func ScanQRCodeAction(_ sender: Any) {
    }
    
    @IBAction func SubmitAction(_ sender: Any) {
        guard let serialNum = txtSerialNum.text else {return}
        
        ref.child("Equipment/\(serialNum)").getData(completion: {error, snapshot in
             
            
        })
    }
    @IBAction func ViewHistoryAction(_ sender: Any) {
    }
    @IBAction func PerformMaintainanceAction(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueMaintainance"{
            let secondVC = segue.destination as! PerformMaintainanceViewController
            guard let serialNumber = txtSerialNum.text else {return}
            
            secondVC.serialNumber = serialNumber;
        }
    }
}
