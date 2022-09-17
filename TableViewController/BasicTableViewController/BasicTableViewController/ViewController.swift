//
//  ViewController.swift
//  BasicTableViewController
//
//  Created by 冯哲宁 on 9/17/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    // 1. add Tableview to controller
    // 2. Stretch TableView
    // 3. add a table view Cell
    // 4. add cell identifer in
    // 5 Drag and drop and outlet and name it
    // 6. add UITableViewDelegate, UITableViewDataSource as the protocols to the ViewController Class
    // 7. Add the function stubs based on the compiler
    // 8. Create an array for data
    // 9. In viewDidload add tableView.delegate = self and tableView.dataSource = self
    //10. Return contacts.count for tableView function with numberOfRowsInSection
    //11.
    //12.
    //13. Return Cell
    
    let contacts = ["Amy", "Bob", "Carol", "David" ,"Eric" , "Irvine" ,"Harry"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView:UITableView , numberOfRowsInSection section : Int) -> Int{
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
    

}

