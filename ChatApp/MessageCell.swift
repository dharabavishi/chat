//
//  MessageCell.swift
//  ChatApp
//
//  Created by Ruchit Mehta on 10/26/16.
//  Copyright © 2016 Dhara Bavishi. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
