//
//  WelcomeCell.swift
//  Yoga
//
//  Created by Даниил on 16/01/2019.
//  Copyright © 2019 SFB Tech. All rights reserved.
//

import UIKit

class WelcomeCell: UITableViewCell {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var arcView: TopCurvedView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    static var identifier = "WelcomeCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
