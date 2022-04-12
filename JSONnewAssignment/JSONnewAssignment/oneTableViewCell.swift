//
//  oneTableViewCell.swift
//  JSONnewAssignment
//
//  Created by Coditas on 13/04/22.
//

import UIKit

class oneTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var loginlbl: UILabel!
    
    
    @IBOutlet weak var scorelbl: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.image1.layer.cornerRadius = image1.frame.size.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
