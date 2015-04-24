//
//  ViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var backgroundLayer: CAGradientLayer!

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupBackground()
        self.setupCollectionViewController()
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .None)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    func setupBackground(){
        // Gradient
        backgroundLayer = Factory.colorGradient()
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)

        // Blur
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        visualEffectView.frame = view.bounds
        view.insertSubview(visualEffectView, atIndex: 0)
    }

    func setupCollectionViewController(){
        var collectionViewController = BMCollectionVC()

        collectionViewController.collectionView = UICollectionView(frame:self.view.frame , collectionViewLayout: BMCollectionViewLayout())
        collectionViewController.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionViewController.setup()

        self.addChildViewController(collectionViewController)
        self.view.addSubview(collectionViewController.view)

        collectionViewController.didMoveToParentViewController(self)
    }

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        backgroundLayer.frame = view.frame

    }

}


