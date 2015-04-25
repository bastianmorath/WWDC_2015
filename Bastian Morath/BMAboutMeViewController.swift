//
//  BMAboutMeViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 24/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMAboutMeViewController: BMPopUpBaseViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0,2:
            return UIScreen.mainScreen().bounds.width/2 + 100
        case 1:
            return 200
        default:
            return 100
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("pictureCell") as! BMPictureTableViewCell
            cell.imageShape = .Round
            cell.configureWithTopic(self.topic)
            return cell
        case 1:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("textCell") as! BMTextTableViewCell
            cell.label.text =  BMStrings.aboutMyselfString

            return cell
        default:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("pictureCell") as! BMPictureTableViewCell
            cell.imageShape = .Round
            cell.configureWithTopic(self.topic)
        return cell
        }
    }

}
