//
//  BMDetailViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var topic: Factory.BMTopic!
    var cellFrame: CGRect!


    @IBOutlet weak var tableView: UITableView!
    //var tableView: UITableView!

    var label :BMLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var frame = self.view.frame
        self.view.backgroundColor = Factory.colorForTopic(topic)
        self.view.layer.cornerRadius = cellFrame.width / 2
        self.view.layer.masksToBounds = true
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
        UIView.animateWithDuration(kAnimationDuration, animations: { () -> Void in
            self.view.frame =   self.cellFrame
            }, completion: { (Bool) -> Void in
                self.view.removeFromSuperview()
                let parentVC = self.parentViewController as! BMCollectionVC
                parentVC.cellTapped = false
                parentVC.collectionView?.scrollEnabled = true
                self.removeFromParentViewController()
        })

    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         var cell:BMTableViewTextCell = self.tableView.dequeueReusableCellWithIdentifier("textCell") as! BMTableViewTextCell
        cell.testLabel.text = "test"
        return cell

    }

    
}
