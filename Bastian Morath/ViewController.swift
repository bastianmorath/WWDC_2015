//
//  ViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// Protocol to receive notifications a cell is pressed or dismissed in order to adjust the nameLabel
protocol popUpViewDelegate {
    func popUpViewAdded()
    func popUpViewDismissed()
}

class ViewController: UIViewController, popUpViewDelegate {

    var backgroundLayer: CAGradientLayer!

    // label with my name
    var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel = BMLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        nameLabel.center = CGPoint(x: self.view.frame.width / 2, y: 50)
        nameLabel.text = "Bastian Morath"
        self.view.addSubview(self.nameLabel)

        self.setupBackground()
        self.setupCollectionViewController()
        UIApplication.shared.setStatusBarHidden(true, with: .none)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    func setupBackground(){
        // Add Gradient
        backgroundLayer = Factory.colorGradient()
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)

        // Add Blur
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light)) as UIVisualEffectView
        visualEffectView.frame = view.bounds
        view.insertSubview(visualEffectView, at: 0)
    }


    func setupCollectionViewController(){
        let collectionViewController = BMCollectionVC()

        collectionViewController.collectionView = UICollectionView(frame:self.view.frame , collectionViewLayout: BMCollectionViewLayout())
        collectionViewController.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionViewController.setup()
        collectionViewController.delegate = self
        self.addChildViewController(collectionViewController)
        self.view.addSubview(collectionViewController.view)

        collectionViewController.didMove(toParentViewController: self)

    }

    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        backgroundLayer.frame = view.frame

    }

    // remove nameLabel
    func popUpViewAdded() {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            var frame = self.nameLabel.frame
            frame.origin.y -= 100
            self.nameLabel.frame = frame

        })
    }

    // Add nameLabel
    func popUpViewDismissed() {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.nameLabel.center = CGPoint(x: self.view.frame.width / 2, y: 50)
        })

    }
    
}


