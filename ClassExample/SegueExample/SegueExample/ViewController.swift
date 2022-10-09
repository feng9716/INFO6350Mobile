//
//  ViewController.swift
//  SegueExample
//
//  Created by 冯哲宁 on 10/8/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendName(_ sender: Any) {
        performSegue(withIdentifier: "secondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "secondVC"){
            let secondVC = segue.destination as! SecondViewController
            guard let welcomeStr = txtName.text else {return}
            secondVC.welcomeStr = "Welcome \(welcomeStr)"
        }
    }
    
}

