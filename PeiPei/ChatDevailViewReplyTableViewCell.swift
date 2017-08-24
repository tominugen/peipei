//
//  ChatDevailViewReplyTableViewCell.swift
//  PeiPei
//
//  Created by My Mac on 9/14/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class ChatDevailViewReplyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var chatDetailBG: UIImageView!
    @IBOutlet weak var chatDetailReply: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}