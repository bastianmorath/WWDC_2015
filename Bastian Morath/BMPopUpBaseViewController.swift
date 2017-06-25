//
//  BMDetailViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// This controller pops up when the user presses a cell in the collectionView and displays an image with a text

class BMPopUpBaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var topic: Factory.BMTopic!

    var imageShape: Factory.BMImageShape!

    // Frame of the pressed cell is stored in order to dismiss the view properly when the user presses the close-Button
    var cellFrame: CGRect!

    var delegate:popUpViewDelegate!

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        var frame = self.view.frame
        self.view.backgroundColor = Factory.colorForTopic(topic)
        self.view.layer.cornerRadius = cellFrame.width / 2
        self.view.layer.masksToBounds = true

        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kPopUpFrame.width, height: kPopUpFrame.height), style: .plain)
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "BMPictureTableViewCell", bundle: nil), forCellReuseIdentifier: "pictureCell")
        self.tableView.register(UINib(nibName: "BMTextTableViewCell", bundle: nil), forCellReuseIdentifier: "textCell")
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup(){
        // Add close-Button
        let closeButton = BMButton(type: .close)
        self.view.addSubview(closeButton)
        closeButton.position()
        closeButton.addTarget(self, action: "closePressed", for: .touchUpInside)
    }


    func closePressed(){
        self.delegate.popUpViewDismissed()
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame =   self.cellFrame
            self.tableView.layer.anchorPoint = CGPoint(x: 0.4, y: 0.6)
            }, completion: { (Bool) -> Void in
                self.view.removeFromSuperview()
                let parentVC = self.parent as! BMCollectionVC
                parentVC.collectionView?.isScrollEnabled = true
                self.removeFromParentViewController()
        })

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return UIScreen.main.bounds.width/2 + 100
        case 1:
            return Factory.heightForString(Factory.descriptionStringForTopic(self.topic))
        default:
            return 100
        }
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "pictureCell") as! BMPictureTableViewCell
            cell.imageShape = self.imageShape
            cell.configureWithGeneralTopic(self.topic)
            return cell
        case 1:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "textCell") as! BMTextTableViewCell
            cell.configureWithGeneralTopic(self.topic)

            return cell
        default:
            return self.tableView.dequeueReusableCell(withIdentifier: "textCell")!
        }
    }

    
}
