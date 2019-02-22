//
//  ContentCell.swift
//  Yoga
//
//  Created by Даниил on 16/01/2019.
//  Copyright © 2019 SFB Tech. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var girlImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    static var identifier = "ContentCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        actionButton.layer.cornerRadius = actionButton.frame.height / 2
        actionButton.dropShadow(color: .darkGray, opacity: 0.2, offSet: CGSize(width: 0, height: 2), radius: actionButton.frame.height / 2 + 10, scale: true)
    }
}
