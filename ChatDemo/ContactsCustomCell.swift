//
//  ContactsCustomCell.swift
//  ChatDemo
//
//  Created by hema on 3/5/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit
import Kingfisher

class ContactsCustomCell: UITableViewCell {
    
    @IBOutlet weak var contact_img: UIImageView!
    
    
    @IBOutlet weak var contact_lbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
