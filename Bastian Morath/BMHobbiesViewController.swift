//
//  BMGolfingVC.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 24/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// This class manages the controller for all BMTopic's except BMTopic.coding
class BMHobbiesViewController: BMPopUpBaseViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "pictureCell") as! BMPictureTableViewCell

            cell.imageShape = .round
            cell.configureWithGeneralTopic(self.topic)
            return cell
        case 1:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "textCell") as! BMTextTableViewCell
            cell.configureWithGeneralTopic(self.topic)
cell.label.textColor = Factory.whiteColorForTopic(self.topic)
            return cell
        default:
           return UITableViewCell()
        }
    }
}
