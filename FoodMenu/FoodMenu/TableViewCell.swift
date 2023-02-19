//
//  TableViewCell.swift
//  FoodMenu
//
//  Created by Simiao Wang on 2/18/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ImageContainer: UIImageView!
    
    @IBOutlet weak var Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //hfhg
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
