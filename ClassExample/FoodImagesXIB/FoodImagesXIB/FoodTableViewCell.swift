//
//  FoodTableViewCell.swift
//  FoodImagesXIB
//
//  Created by 冯哲宁 on 9/24/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFood: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
