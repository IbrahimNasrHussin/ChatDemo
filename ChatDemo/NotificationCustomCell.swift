//
//  NotificationCustomCell.swift
//  ChatDemo
//
//  Created by hema on 2/13/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit

class NotificationCustomCell: UITableViewCell {
    

    @IBOutlet weak var notification_image: UIImageView!

    @IBOutlet weak var notification_label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
