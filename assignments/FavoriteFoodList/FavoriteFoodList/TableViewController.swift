//
//  TableViewController.swift
//  FavoriteFoodList
//
//  Created by 冯哲宁 on 9/18/22.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var tblView: UITableView!
    
    let favorite = ["Apple", "Banana", "Chocolate", "Burgers", "Ice Cream", "Sparkling Water", "Beer", "Sushi", "Poke Bowl", "Pho"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorite.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = favorite[indexPath.row]
        return cell
    }
}
