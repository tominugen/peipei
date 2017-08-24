//
//  ActivityCustomCell.swift
//  PeiPei
//
//  Created by My Mac on 8/18/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class ActivityCustomCell: UITableViewCell {

    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityDescription: UILabel!
    
    @IBOutlet weak var activityDuration: UILabel!
    
    @IBOutlet weak var activityCommentCount: UILabel!
    @IBOutlet weak var activityLikeMessage: UILabel!
    
    @IBOutlet weak var activityCommentBtn: UIButton!
    @IBOutlet weak var activityLikeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
