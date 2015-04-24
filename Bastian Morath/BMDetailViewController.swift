//
//  BMDetailViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMDetailViewController: UIViewController {

    var topic: Factory.BMTopic!
    var cellFrame: CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UIView(frame: cellFrame)
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

        let textView = UITextView(frame: self.view.bounds)
        textView.text = "aklsjhfkjlhaksdjlfhkjhasdkfkjlhalkdsjfhlkjhasdkjlfhkjahsdkjlfhkjlasdlfkjbajsbdfjkkasdbfasdufhialuhsdfiuhaiusdhfliuasdf"
        //self.view.addSubview(textView)

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
}
