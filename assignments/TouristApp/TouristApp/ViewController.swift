//
//  ViewController.swift
//  TouristApp
//
//  Created by 冯哲宁 on 9/30/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let touristLocation = ["EiffelTower", "GreatWall", "Himalayas", "JesusStatue","PisaTower", "Pyramid"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return touristLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TouristTableViewCell", owner: self)?.first as! TouristTableViewCell
        cell.imgTourist.image = UIImage(named: touristLocation[indexPath.row])
        cell.lblTourist.text = touristLocation[indexPath.row]
        return cell
    }
}

