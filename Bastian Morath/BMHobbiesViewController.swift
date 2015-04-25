//
//  BMGolfingVC.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 24/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMHobbiesViewController: BMPopUpBaseViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       return 200
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("pictureCell") as! BMPictureTableViewCell
            cell.imageShape = .angular
            cell.configureWithTopic(self.topic)
            return cell
        case 1:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("textCell") as! BMTextTableViewCell
            cell.label.text =  Factory.descriptionStringForTopic(self.topic)
           //println(Factory.descriptionStringForTopic(self.topic))

            return cell
        default:
           return UITableViewCell()
        }
    }
}
