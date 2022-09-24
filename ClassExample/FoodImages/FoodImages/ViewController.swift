//
//  ViewController.swift
//  FoodImages
//
//  Created by 冯哲宁 on 9/24/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let foodNames = ["burger" , "fried-chicken", "pho", "taco"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! FoodTableViewCell
        
        cell.imgFood.image = UIImage(named: foodNames[indexPath.row])
        cell.lblFood.text = foodNames[indexPath.row]
        return cell
    }


}

