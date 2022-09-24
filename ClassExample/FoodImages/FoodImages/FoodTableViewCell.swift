//
//  FoodTableViewCell.swift
//  FoodImages
//
//  Created by 冯哲宁 on 9/24/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFood: UILabel!
    @IBOutlet weak var imgFood: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
