//
//  BMCollectionViewCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    var imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = frame.width / 2.0
        self.backgroundColor = UIColor.clearColor()
        self.alpha = 0.5
        self.imageView = UIImageView()
        imageView.tintColor = UIColor.whiteColor()
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureWithTopic(topic: Factory.BMTopic){
        self.contentView.layer.backgroundColor = Factory.colorForTopic(topic).CGColor
        imageView.removeFromSuperview()
        var image: UIImage?
        switch topic{
        case .About:
            image = UIImage(named: "about")
        case .education:
            image = UIImage(named: "education")
        case .coding:
            image = UIImage(named: "coding")
        case .traveling:
            image = UIImage(named: "traveling")
        case .handball:
            image = UIImage(named: "handball")
        case .guitar:
            image = UIImage(named: "guitar")
        case .golfing:
            image = UIImage(named: "golfing")
        default:
            image = nil
    }
        if let image = image{
            imageView.image = image
            imageView.image = imageView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.addSubview(imageView)
            self.positionImageView()

        }
}

    func positionImageView(){
        let views = ["button" : imageView]
        let metrics = ["margin": kMargin]

        let xCenterConstraint = NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)

    }
}
