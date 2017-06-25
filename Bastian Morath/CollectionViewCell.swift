//
//  BMCollectionViewCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//


// Cell that defines the collection view cells
import UIKit

class CollectionViewCell: UICollectionViewCell {

    // imageView for the icon
    var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Set rounded corners
        self.contentView.layer.cornerRadius = frame.width / 2.0
        imageView.tintColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.alpha = 0.8
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureWithTopic(_ topic: Factory.BMTopic){
        self.contentView.layer.backgroundColor = Factory.colorForTopic(topic).cgColor
        imageView.removeFromSuperview()
        var image: UIImage?
        switch topic{
        case .about:
            image = UIImage(named: "aboutIcon")
        case .education:
            image = UIImage(named: "educationIcon")
        case .coding:
            image = UIImage(named: "codingIcon")
        case .traveling:
            image = UIImage(named: "travelingIcon")
        case .sports:
            image = UIImage(named: "handballIcon")
        case .guitar:
            image = UIImage(named: "guitarIcon")
        case .photography:
            image = UIImage(named: "photographyIcon")
        default:
            image = nil
        }
        if let image = image{
            imageView.image = image
            imageView.image = imageView.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.addSubview(imageView)
            self.positionImageView()

        }
    }

    //  Positions imageView to the center
    func positionImageView(){
        let views = ["button" : imageView]
        let metrics = ["margin": kMargin]

        let xCenterConstraint = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
        
    }
}
