//
//  BMPictureTableViewCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 25/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit
import MediaPlayer

// This UITableViewCell subclass displays an image with either rounded corners or angular

class BMPictureTableViewCell: UITableViewCell {

    var imageShape: Factory.BMImageShape!

    @IBOutlet weak var iconView: UIImageView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureWithGeneralTopic(_ topic: Factory.BMTopic){
        if imageShape?.rawValue == Factory.BMImageShape.round.rawValue{
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

        let image = Factory.imageForGeneralTopic(topic)
        iconView.image = image
    }
    
}
