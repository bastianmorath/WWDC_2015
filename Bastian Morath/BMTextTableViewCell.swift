//
//  BmTextTableViewCell.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 25/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// This UITableViewCell displays string in a label

class BMTextTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.font = Factory.systemFontWithSize(kDefaultFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
    }

    func configureWithGeneralTopic(_ topic: Factory.BMTopic){
        self.label.text = Factory.descriptionStringForTopic(topic)
    }

    func configureWithCodingTopic(_ topic: Factory.BMCodingProject){
        self.label.text = Factory.descriptionStringForCodingTopic(topic)

    }

}
