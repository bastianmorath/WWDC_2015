//
//  BMCollectionVC.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 22/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"
let array = [6,7,1,2,3,4,5,6,7,1,2]

class BMCollectionVC: UICollectionViewController {

    var cellTapped = false
    var expandingViewController = BMDetailViewController()

    func setup(){
        self.collectionView!.alpha = 0.5
        self.collectionView?.delegate = nil

        self.collectionView!.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        self.collectionView!.scrollToItemAtIndexPath(NSIndexPath(forRow: 2, inSection: 0), atScrollPosition: .CenteredHorizontally, animated: false)
        self.collectionView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count * array.count
    }


    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.configureWithTopic(Factory.BMTopic(rawValue: (indexPath.row%7))!)
        return cell
    }

    var lastContentOffsetX = CGFloat(FLT_MIN)
    var lastContentOffsetY = CGFloat(FLT_MIN)

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentOffSetX = scrollView.contentOffset.x + 70;
        let currentOffSetY = scrollView.contentOffset.y;
        let contentWidth = scrollView.contentSize.width;

        if (currentOffSetX < (contentWidth / CGFloat(array.count))) {
            //scrollView.contentOffset = CGPointMake(currentOffSetX + (contentWidth * CGFloat(array.count)/CGFloat(array.count - 1) / 2),(currentOffSetY ));
        }
        if (currentOffSetX > (contentWidth / CGFloat(array.count) * 7.5)) {
            scrollView.contentOffset = CGPointMake(currentOffSetX - (contentWidth * CGFloat(array.count)/CGFloat(array.count-3) / 2),(currentOffSetY ));
        }
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.scrollEnabled = false
        let cell = collectionView.cellForItemAtIndexPath(indexPath)


        let kMargin: CGFloat = 10
        var endFrame = self.view.convertRect(self.view.frame, toView: self.collectionView)
        endFrame.origin.x += kMargin
        endFrame.origin.y += kMargin
        endFrame.size.width -= 2 * kMargin
        endFrame.size.height -= 2 * kMargin
        self.expandingViewController = BMDetailViewController()
        self.expandingViewController.topic = Factory.BMTopic(rawValue: (indexPath.row%7))
        self.expandingViewController.cellFrame = cell!.frame

        collectionView.addSubview(expandingViewController.view)
        self.addChildViewController(expandingViewController)


        UIView.animateWithDuration(kAnimationDuration, animations: { () -> Void in
            self.expandingViewController.view.frame = endFrame
            }, completion: { (Bool) -> Void in
                self.expandingViewController.setup()
        })

    }
}
