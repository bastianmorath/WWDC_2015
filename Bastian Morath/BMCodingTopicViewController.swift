//
//  BMCodingTopicViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 25/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// This class shows a Coding Project with an Image and a text
class BMCodingTopicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var project: Factory.BMCodingProject!
    var pageIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        var frame = self.view.frame
        self.view.backgroundColor = Factory.colorForTopic(Factory.BMTopic.coding)

        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kPopUpFrame.width, height: kPopUpFrame.height), style: .plain)
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "BMCodingPictureTableViewCell", bundle: nil), forCellReuseIdentifier: "codingCell")
        self.tableView.register(UINib(nibName: "BMTextTableViewCell", bundle: nil), forCellReuseIdentifier: "textCell")
        self.view.addSubview(self.tableView)

        // Add a arrow image on the right side if the user is onthe first controller (BMCodingTopic.general)
        if self.project == Factory.BMCodingProject.general {
            let arrowView = UIImageView(image: UIImage(named: "rightArrow.png"))
            arrowView.image = arrowView.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            arrowView.tintColor = .white
            arrowView.frame = CGRect(x: kPopUpFrame.width - 25, y: kPopUpFrame.height / 2 - 15, width: 25, height: 40)
            self.view.addSubview(arrowView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return Factory.cellHeightForTopic(self.project)
        case 1:
            return Factory.heightForString(Factory.descriptionStringForCodingTopic(self.project))
        default:
            return 100
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "codingCell") as! BMCodingPictureTableViewCell
            cell.configureWithCodingTopic(self.project)
            return cell
        case 1:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "textCell") as! BMTextTableViewCell
            cell.configureWithCodingTopic(self.project)

            return cell
        default:
            return self.tableView.dequeueReusableCell(withIdentifier: "textCell")!
        }
    }

}
