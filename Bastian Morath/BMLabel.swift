//
//  BMLabel.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.setup()
    }

    override init(frame:CGRect) {
        super.init(frame:frame)
        self.setup()
    }

    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    func positionLabel(){
        
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: self.superview, attribute: .CenterX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: self.superview, attribute: .CenterY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
        
    }
    func setup(){
        self.backgroundColor = .clearColor()
        self.numberOfLines = 0
        self.textColor = .whiteColor()
        self.font = Factory.systemFontWithSize(15)

        self.frame = kPopUpFrame
    }
}
