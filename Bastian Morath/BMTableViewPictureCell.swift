//
//  BMTableViewPictureCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMTableViewPictureCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

           }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pictureImageView.layer.cornerRadius = 90
        pictureImageView.clipsToBounds = true
        pictureImageView.setTranslatesAutoresizingMaskIntoConstraints( false )
    }

    

    func configureWithTopic(topic: Factory.BMTopic){
        var image: UIImage?

        switch topic{
        case .About:
            image = UIImage(named: "profileImage.jpg")
        case .education:
            image = UIImage(named: "education")
            image = image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .coding:
            image = UIImage(named: "coding")
            image = image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .traveling:
            image = UIImage(named: "travelingx3.png")
            image = image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)

        case .handball:
            image = UIImage(named: "handball")
            image = image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .guitar:
            image = UIImage(named: "guitar")
            image = image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .golfing:
            image = UIImage(named: "golfing")
            image = image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        default:
            image = nil
        }
        pictureImageView.tintColor = .whiteColor()
        pictureImageView?.image = image
     

    }


}
