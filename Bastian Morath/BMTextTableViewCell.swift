//
//  BmTextTableViewCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 25/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMTextTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!

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

        self.backgroundColor = .clearColor()
        //label = UILabel(frame: CGRectMake(0, 0, 100, 100))
        label.font = Factory.systemFontWithSize(15)
        label.setTranslatesAutoresizingMaskIntoConstraints( false )
        
    }

    
}