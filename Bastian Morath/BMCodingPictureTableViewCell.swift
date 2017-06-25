//
//  BMCodingPictureTableViewCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 26/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// This UITableViewCell subclass displays an image in an angular imageView

class BMCodingPictureTableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureWithCodingTopic(_ topic: Factory.BMCodingProject){
        if topic == .general{
            if UIDevice.current.isIPhone5(){
                iconView.layer.cornerRadius =  kIPhone5CornerRadius
            } else if UIDevice.current.isIPhone6(){
                iconView.layer.cornerRadius = kIPhone6CornerRadius
            } else {
                iconView.layer.cornerRadius = 125
            }
            iconView.translatesAutoresizingMaskIntoConstraints = false
            iconView.clipsToBounds = true
        }

        let image = Factory.imageForCodingTopic(topic)
        iconView.image = image
    }


}
