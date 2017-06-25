//
//  BMCollectionVC.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 22/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// array defines number of rows in CollectionView
let array = [6,7,1,2,3,4,5,6,7,1,2]

class BMCollectionVC: UICollectionViewController {

    var delegate:popUpViewDelegate!

    func setup(){
        //Set alpha of colelctionView -> Subviews aren't affected!
        let color = self.collectionView!.backgroundColor
        let myCIColor = CIColor(color: color!)
        let redComp = myCIColor.red
        let greenComp = myCIColor.green  
        let blueComp = myCIColor.blue
        self.collectionView!.backgroundColor = UIColor(red:  redComp, green: greenComp, blue:blueComp, alpha: 0.5)

        // Setup CollectionView
        self.collectionView?.delegate = nil
        self.collectionView!.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        self.collectionView!.scrollToItem(at: IndexPath(row: 2, section: 0), at: .centeredHorizontally, animated: false)
        self.collectionView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count * array.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.configureWithTopic(Factory.BMTopic(rawValue: (indexPath.row%7))!)
        return cell
    }

    // Infinite scrolling in horizontally direction! 
    // Idea: If the user has scrolled to the second last row, just set the currentOffset to the second row with no animation. The user won't realize this skip!
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffSetX = scrollView.contentOffset.x;
        let currentOffSetY = scrollView.contentOffset.y;
        let contentWidth = scrollView.contentSize.width;

        if (currentOffSetX < (contentWidth / CGFloat(array.count))-41) {
            scrollView.contentOffset = CGPoint(x: currentOffSetX + 40 + (contentWidth * CGFloat(array.count)/CGFloat(array.count-2) / 2),y: (currentOffSetY ));
        }
        if (currentOffSetX > (contentWidth / CGFloat(array.count) * 7.5)+81)  {
            scrollView.contentOffset = CGPoint(x: currentOffSetX + 80 - (contentWidth * CGFloat(array.count)/CGFloat(array.count-3) / 2),y: (currentOffSetY ));
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.isScrollEnabled = false
        delegate.popUpViewAdded()

        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        let kMargin: CGFloat = 10

        var controller: BMPopUpBaseViewController!
        let topic =  Factory.BMTopic(rawValue: (indexPath.row%7))
        if  !(topic == .coding){
            controller = BMHobbiesViewController()
        } else if topic == .coding {
            controller = BMCodingViewController()
        }

        controller.cellFrame = cell.frame
        controller.topic = topic
        controller.delegate = self.delegate!
        controller.view.frame = cell.frame

        self.addChildViewController(controller)
        collectionView.addSubview(controller.view)
        controller.didMove(toParentViewController: self)

        let endFrame = collectionView.convert(kPopUpFrame, from: self.view)

        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 4, options: UIViewAnimationOptions(), animations: { () -> Void in
            controller.view.frame = endFrame
            controller.setup()
        }) { (Bool) -> Void in
        }
    }
}
