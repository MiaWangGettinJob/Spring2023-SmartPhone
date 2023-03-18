//
//  TableViewCell.swift
//  Question1
//
//  Created by Simiao Wang on 3/18/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var ImageViewContainer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func gotodetails(_ sender: Any) {
        
    }
}
