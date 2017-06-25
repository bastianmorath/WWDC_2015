//
//  BMButton.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit


// Custom UIButton subclass

// Size of the button
let kSize = 25 as CGFloat

// Margin of the button
let margin = 30 as CGFloat

class BMButton: UIButton {

    enum BMButtonType {
        case close
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(type: BMButtonType){
        self.init(frame: CGRect(x: 0,y: 0,width: kSize + margin,height: kSize + margin))

        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsTouchWhenHighlighted = false

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kSize, height: kSize))
        imageView.tintColor = UIColor.white
        switch type {
        case .close:
            imageView.image = UIImage(named: "crossIcon.png")
        default:
            imageView.image = UIImage()
        }
        imageView.image = imageView.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.addSubview(imageView)
    }

    // Takes the current location and position it to the view
    func position(){
        let superView = self.superview


        let views = ["button" : self]
        /// margin: Distance from edge to button
        let metrics = ["margin": kMargin+10]

        
        let heightConstraint = "V:[button(\(kSize))]"
        let widthConstraint = "H:[button(\(kSize))]"

        superView!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: heightConstraint, options: [], metrics: nil, views: views))
        superView!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: widthConstraint, options: [], metrics: nil, views: views))

        let horizontalConstraint = "H:[button]-margin-|"
        let verticalConstraint =   "V:|-margin-[button]"

            superView!.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraint, options: [], metrics: metrics, views: views ) )
            superView!.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: verticalConstraint, options: [], metrics: metrics, views: views ) )
    }
}
