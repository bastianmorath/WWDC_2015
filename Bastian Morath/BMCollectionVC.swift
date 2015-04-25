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
        let currentOffSetX = scrollView.contentOffset.x;
        let currentOffSetY = scrollView.contentOffset.y;
        let contentWidth = scrollView.contentSize.width;

        if (currentOffSetX < (contentWidth / CGFloat(array.count))-41) {
            scrollView.contentOffset = CGPointMake(currentOffSetX + 40 + (contentWidth * CGFloat(array.count)/CGFloat(array.count-2) / 2),(currentOffSetY ));
        }
        if (currentOffSetX > (contentWidth / CGFloat(array.count) * 7.5)+81)  {
            scrollView.contentOffset = CGPointMake(currentOffSetX + 80 - (contentWidth * CGFloat(array.count)/CGFloat(array.count-3) / 2),(currentOffSetY ));
        }
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.scrollEnabled = false
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell


        let kMargin: CGFloat = 10
        var endFrame = collectionView.convertRect(kPopUpFrame, fromView: self.view)

        var controller: BMPopUpBaseViewController!
        let topic =  Factory.BMTopic(rawValue: (indexPath.row%7))
        if !(topic == .About) && !(topic == .coding){

            controller = BMHobbiesViewController()
        } else if topic == .About{
            controller = BMAboutMeViewController()


        } else if topic == .coding {
            controller = BMCodingViewController()
        }
        controller.cellFrame = cell.frame
        controller.topic = topic

        controller.view.frame = cell.frame
        self.addChildViewController(controller)

        collectionView.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
        UIView.animateWithDuration(kAnimationDuration, animations: { () -> Void in
            controller.view.frame = endFrame
            }, completion: { (Bool) -> Void in
                controller.setup()
        })

    }
}
