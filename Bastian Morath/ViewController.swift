//
//  ViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit
// TODO: Rotate Device backgroundlayer animieren

class ViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var backgroundLayer: CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.collectionView.collectionViewLayout = CollectionViewLayout()
        self.collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.backgroundColor = UIColor.whiteColor()
        self.collectionView.alpha = 0.7

        let colors = Colors()
        backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
        //self.view.backgroundColor = UIColor(red:12/255.0, green:58/255.0, blue:97/255.0, alpha:1)


        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        visualEffectView.frame = view.bounds
        view.insertSubview(visualEffectView, atIndex: 0)
        //self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forRow: 1, inSection: 0), atScrollPosition: .Left, animated: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count * array.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell

        var color:CGFloat!

        if indexPath.row % 7 == 0{
            color = 0.6
        }
        if indexPath.row % 7 == 1{
            color = 0.8
        }
        if indexPath.row % 7 == 2{
            color = 0.2
        }
        if indexPath.row % 7 == 3{
            color = 0.4
        }
        if indexPath.row % 7 == 4{
            color = 0.6
        }
        if indexPath.row % 7 == 5{
            color = 0.8
        }
        if indexPath.row % 7 == 6{
            color = 0.2
        }
        cell.contentView.layer.backgroundColor = UIColor(red: color+0.3, green: color-0.2, blue: color-0.3, alpha: 1).CGColor


        return cell
    }


    var lastContentOffsetX = CGFloat(FLT_MIN)
    var lastContentOffsetY = CGFloat(FLT_MIN)

    func scrollViewDidScroll(scrollView: UIScrollView) {

        let currentOffSetX = scrollView.contentOffset.x + 20;
        let currentOffSetY = scrollView.contentOffset.y;
        let contentWidth = scrollView.contentSize.width;

        if (currentOffSetX < (contentWidth / CGFloat(array.count))) {
            //scrollView.contentOffset = CGPointMake(currentOffSetX + (contentWidth * CGFloat(array.count)/CGFloat(array.count - 1) / 2),(currentOffSetY ));
        }
        if (currentOffSetX > (contentWidth / CGFloat(array.count) * 4)) {
            scrollView.contentOffset = CGPointMake(currentOffSetX - (contentWidth * CGFloat(array.count)/CGFloat(array.count - 1) / 2),(currentOffSetY ));
        }
        //
        //        if (CGFloat(FLT_MIN) == lastContentOffsetX) {
        //            lastContentOffsetX = scrollView.contentOffset.x;
        //            lastContentOffsetY = scrollView.contentOffset.y;
        //
        //            return;
        //        }
        //
        //        let currentOffsetX = scrollView.contentOffset.x
        //        let currentOffsetY = scrollView.contentOffset.y
        //
        //        let pageWidth = scrollView.frame.size.width
        //        let verticalOffset = pageWidth * CGFloat(array.count - 2)
        //
        //        if (currentOffsetX < pageWidth && lastContentOffsetX  > currentOffsetX) {
        //            lastContentOffsetX = currentOffsetX + verticalOffset;
        //            scrollView.contentOffset = CGPoint(x: lastContentOffsetX, y: currentOffsetY)
        //        }
        //            // the last page (showing the first item) is visible and the user is still scrolling to the right
        //        else if (currentOffsetX > verticalOffset && lastContentOffsetX < currentOffsetX) {
        //            lastContentOffsetX = currentOffsetX - verticalOffset ;
        //            scrollView.contentOffset = CGPoint(x: lastContentOffsetX, y: currentOffsetY)
        //        } else {
        //            lastContentOffsetX = currentOffsetX;
        //        }


        //
        //            // Calculate where the collection view should be at the right-hand end item
        //            let contentOffsetWhenFullyScrolledRight = self.collectionView.frame.size.width * CGFloat(array.count - 1);
        //
        //            if (scrollView.contentOffset.x == contentOffsetWhenFullyScrolledRight) {
        //
        //                // user is scrolling to the right from the last item to the 'fake' item 1.
        //                // reposition offset to show the 'real' item 1 at the left-hand end of the collection view
        //
        //                let newIndexPath = NSIndexPath(forRow: 1, inSection: 0)
        //
        //                self.collectionView.scrollToItemAtIndexPath(newIndexPath, atScrollPosition: .Left, animated: false)
        //
        //
        //            } else if (scrollView.contentOffset.x == 0)  {
        //
        //                // user is scrolling to the left from the first item to the fake 'item N'.
        //                // reposition offset to show the 'real' item N at the right end end of the collection view
        //
        //                let newIndexPath = NSIndexPath(forRow: array.count-2, inSection: 0)
        //
        //                self.collectionView.scrollToItemAtIndexPath(newIndexPath, atScrollPosition: .Left, animated: false)
        //            }

    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let collectionViewHeight = CGRectGetHeight(self.collectionView.frame);
        //collectionView.contentInset = UIEdgeInsetsMake(collectionViewHeight / 2, 0, collectionViewHeight / 2, 0)

        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        let offset = CGPointMake(0,  cell!.center.y - collectionViewHeight / 2);
        collectionView.setContentOffset(offset, animated: true)
        println(cell?.frame)
        println(cell?.bounds)
    }

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        backgroundLayer.frame = view.frame

    }


}


class Colors {
    let colorTop =    UIColor(red:12/255.0, green:58/255.0, blue:97/255.0, alpha:1).CGColor
    let colorBottom = UIColor(red:165/255.0, green:51/255.0, blue:20/255.0, alpha:1).CGColor
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 0.7,0.8,1.0]
    }
}
