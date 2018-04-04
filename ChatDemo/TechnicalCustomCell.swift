//
//  TechnicalCustomCell.swift
//  ChatDemo
//
//  Created by hema on 2/13/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit

class TechnicalCustomCell: UITableViewCell {
    
    @IBOutlet weak var TechnicalIMG: UIImageView!
    
    @IBOutlet weak var TechnicalLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
