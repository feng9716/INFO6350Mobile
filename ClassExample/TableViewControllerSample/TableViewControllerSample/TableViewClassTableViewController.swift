//
//  TableViewClassTableViewController.swift
//  TableViewControllerSample
//
//  Created by 冯哲宁 on 9/17/22.
//

import UIKit

class TableViewClassTableViewController: UITableViewController {

    let contacts = ["Contact1" , "Contact2" ,"Contact3" ,"Contact4" ,"Contact5" ,"Contact6" ,"Contact7" ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = contacts[indexPath.row]

        return cell
    }

    
}
