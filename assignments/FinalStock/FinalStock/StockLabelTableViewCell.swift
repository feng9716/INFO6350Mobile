//
//  StockLabelTableViewCell.swift
//  FinalStock
//
//  Created by 冯哲宁 on 12/13/22.
//

import UIKit

class StockLabelTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgStock: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
