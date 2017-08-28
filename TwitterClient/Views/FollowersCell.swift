//
//  FollowersCell.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import UIKit

class FollowersCell: UITableViewCell {
    
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var shadowView: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        self.shadowView.layer.shadowOpacity = 1
        self.shadowView.layer.shadowOffset = CGSize.zero
        self.shadowView.layer.shadowRadius = 3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
