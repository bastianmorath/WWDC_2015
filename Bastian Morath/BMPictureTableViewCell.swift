//
//  BMPictureTableViewCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 25/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMPictureTableViewCell: UITableViewCell {

    var imageShape: Factory.BMImageShape!

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var pictureView: UIView!
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
        //if imageShape?.rawValue == Factory.BMImageShape.Round.rawValue{
        iconView.layer.cornerRadius = iconView.frame.width / 2
        iconView.clipsToBounds = true
        //}
    }

    func configureWithTopic(topic: Factory.BMTopic){
        var image = Factory.imageForTopic(topic)
        iconView.image = image
        //iconView.layer.backgroundColor = UIColor.greenColor().CGColor
        iconView.setTranslatesAutoresizingMaskIntoConstraints( false )
       // pictureView.addSubview(pictureImageView)
    }
}
