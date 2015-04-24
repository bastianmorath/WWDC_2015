//
//  BMButton.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

let kSize = 25 as CGFloat

class BMButton: UIButton {


    enum BMButtonType {
        case Close

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(type: BMButtonType){
        self.init(frame: CGRectMake(0,0,kSize,kSize))
        self.layer.cornerRadius = CGFloat(kSize / 2)
        self.setTranslatesAutoresizingMaskIntoConstraints( false )
        self.showsTouchWhenHighlighted = false
        var imageView = UIImageView(frame: CGRectMake(0, 0, kSize, kSize))
        switch type {
        case .Close:
            imageView.image = UIImage(named: "cross.png")
        default:
            imageView.image = UIImage()
        }
        self.addSubview(imageView)

    }

    // Takes the current location and position it to the view
    func position(){

        let superView = self.superview


        let views = ["button" : self]
        /// margin: Abstand der Buttons zum Rand
        /// topSpace: Abstand des shareLocationButtons zum oberen Rand -> floated zwischen TableView und Map
        let metrics = ["margin": kMargin+10]

        //Höhe und Breite des Buttons
        var heightConstraint = "V:[button(\(kSize))]"
        var widthConstraint = "H:[button(\(kSize))]"

        superView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(heightConstraint, options: nil, metrics: nil, views: views))
        superView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(widthConstraint, options: nil, metrics: nil, views: views))

        var horizontalConstraint = "H:[button]-margin-|"
        var verticalConstraint =   "V:|-margin-[button]"

            superView!.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat(horizontalConstraint, options: nil, metrics: metrics, views: views ) )
            superView!.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat(verticalConstraint, options: nil, metrics: metrics, views: views ) )



    }
}
