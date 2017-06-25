//
//  BMLabel.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// Custom UILabel subclass
class BMLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
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



    func setup(){
        self.backgroundColor = .clear
        self.numberOfLines = 0
        self.textColor = .white

        self.textAlignment = .center
        self.font = Factory.systemFontWithSize(25)
    }
}
