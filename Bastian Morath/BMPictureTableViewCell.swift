//
//  BMPictureTableViewCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 25/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit
import MediaPlayer
class BMPictureTableViewCell: UITableViewCell {

    var imageShape: Factory.BMImageShape!

    @IBOutlet weak var iconView: UIImageView!
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
            }

    func configureWithGeneralTopic(topic: Factory.BMTopic){
        if imageShape?.rawValue == Factory.BMImageShape.Round.rawValue{
            iconView.layer.cornerRadius = iconView.frame.width / 2
            iconView.setTranslatesAutoresizingMaskIntoConstraints( false )
            iconView.clipsToBounds = true
        }

        var image = Factory.imageForGeneralTopic(topic)
        iconView.image = image
        iconView.layer.cornerRadius = (iconView.layer.frame.width + 100 ) / 2

//        let filePath = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("guitarPlaying", ofType: "mp4")!)
//        var moviePlayerController = MPMoviePlayerController(contentURL: filePath!)
//        moviePlayerController.repeatMode = .One
//        moviePlayerController.view.frame = self.contentView.frame
//        moviePlayerController.prepareToPlay()
//        moviePlayerController.scalingMode = .AspectFill
//
//        self.contentView.addSubview(moviePlayerController.view)
    }

    func configureWithCodingTopic(topic: Factory.BMCodingProject){
        if imageShape?.rawValue == Factory.BMImageShape.Round.rawValue{
            iconView.layer.cornerRadius = iconView.frame.width / 2
            iconView.setTranslatesAutoresizingMaskIntoConstraints( false )
            iconView.clipsToBounds = true
        }

        var image = Factory.imageForCodingTopic(topic)
        iconView.image = image
        iconView.layer.cornerRadius = (iconView.layer.frame.width + 100 ) / 2
    }
}
