//
//  BMCodingTopicViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 25/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMCodingTopicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var project: Factory.BMCodingProject!

    override func viewDidLoad() {
        super.viewDidLoad()
        var frame = self.view.frame
        self.view.backgroundColor = Factory.colorForTopic(Factory.BMTopic.coding)

        self.tableView = UITableView(frame: CGRectMake(0, 0, kPopUpFrame.width, kPopUpFrame.height), style: .Plain)
        self.tableView.backgroundColor = .clearColor()
        //self.tableView.separatorStyle = .None
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "BMPictureTableViewCell", bundle: nil), forCellReuseIdentifier: "pictureCell")
        self.tableView.registerNib(UINib(nibName: "BMTextTableViewCell", bundle: nil), forCellReuseIdentifier: "textCell")
        self.view.addSubview(self.tableView)

        if self.project == Factory.BMCodingProject.General {
            let arrowView = UIImageView(image: UIImage(named: "rightArrow.png"))
            arrowView.image = arrowView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            arrowView.tintColor = .whiteColor()
            arrowView.frame = CGRectMake(kPopUpFrame.width - 25, kPopUpFrame.height / 2 - 15, 25, 40)
            self.view.addSubview(arrowView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return UIScreen.mainScreen().bounds.width/2 + 100
        case 1:
            return Factory.heightForString(Factory.descriptionStringForCodingTopic(self.project))
        default:
            return 100
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("pictureCell") as! BMPictureTableViewCell
            cell.imageShape = .Angular
            cell.configureWithCodingTopic(self.project)
            return cell
        case 1:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("textCell") as! BMTextTableViewCell
            cell.configureWithCodingTopic(self.project)

            return cell
        default:
            return self.tableView.dequeueReusableCellWithIdentifier("textCell") as! UITableViewCell
        }
    }

}
