//
//  BMDetailViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMPopUpBaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var topic: Factory.BMTopic!
    var imageShape: Factory.BMImageShape!

    var cellFrame: CGRect!

    var delegate:popUpViewDelegate!


    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        var frame = self.view.frame
        self.view.backgroundColor = Factory.colorForTopic(topic)
        self.view.layer.cornerRadius = cellFrame.width / 2
        self.view.layer.masksToBounds = true

        self.tableView = UITableView(frame: CGRectMake(0, 0, kPopUpFrame.width, kPopUpFrame.height), style: .Plain)
        self.tableView.backgroundColor = .clearColor()
        self.tableView.separatorStyle = .None
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "BMPictureTableViewCell", bundle: nil), forCellReuseIdentifier: "pictureCell")
        self.tableView.registerNib(UINib(nibName: "BMTextTableViewCell", bundle: nil), forCellReuseIdentifier: "textCell")
        println("popUpFrame: \(self.view.frame)")
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup(){
        // Add close-Button
        var closeButton = BMButton(type: .Close)
        self.view.addSubview(closeButton)
        closeButton.position()
        closeButton.addTarget(self, action: "closePressed", forControlEvents: .TouchUpInside)
    }


    func closePressed(){
        self.delegate.popUpViewDismissed()
        UIView.animateWithDuration(kAnimationDuration, animations: { () -> Void in
            self.view.frame =   self.cellFrame
            self.tableView.layer.anchorPoint = CGPointMake(0.4, 0.6)

           // self.tableView.contentInset = UIEdgeInsetsMake(-self.cellFrame.origin.y, -self.cellFrame.origin.x, 0, 0)
            }, completion: { (Bool) -> Void in
                self.view.removeFromSuperview()
                let parentVC = self.parentViewController as! BMCollectionVC
                parentVC.collectionView?.scrollEnabled = true
                self.removeFromParentViewController()
        })

    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return UIScreen.mainScreen().bounds.width/2 + 100
        case 1:
            return Factory.heightForString(Factory.descriptionStringForTopic(self.topic))
        default:
            return 100
        }
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("pictureCell") as! BMPictureTableViewCell
            cell.imageShape = self.imageShape
            cell.configureWithGeneralTopic(self.topic)
            return cell
        case 1:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("textCell") as! BMTextTableViewCell
            cell.configureWithGeneralTopic(self.topic)

            return cell
        default:
            return self.tableView.dequeueReusableCellWithIdentifier("textCell") as! UITableViewCell
        }
    }

    
}
