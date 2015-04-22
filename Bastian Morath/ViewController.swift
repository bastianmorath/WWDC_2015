//
//  ViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit
// TODO: Rotate Device backgroundlayer animieren

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var backgroundLayer: CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.collectionView.collectionViewLayout = CollectionViewLayout()
        self.collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.backgroundColor = UIColor.whiteColor()
        self.collectionView.alpha = 0.6
        self.collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)

        let colors = Colors()
        backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
        //self.view.backgroundColor = UIColor(red:12/255.0, green:58/255.0, blue:97/255.0, alpha:1)


        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        visualEffectView.frame = view.bounds
        view.insertSubview(visualEffectView, atIndex: 0)
        self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forRow: 2, inSection: 0), atScrollPosition: .CenteredHorizontally, animated: false)

        var image = UIImage(named: "profileImage.jpg")

        imageView = UIImageView(image: image )


        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count * array.count
    }


    var imageView:UIImageView!

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell

        var color:CGFloat = 0.0
        if indexPath.row % 4 == 0{
            color = 0.6
        }
        if indexPath.row % 4 == 1{
            color = 0.8
        }
        if indexPath.row % 4 == 2{
            color = 0.2
        }
        if indexPath.row % 4 == 3{
            color = 0.4
        }
        if indexPath.row % 4 == 4{
            color = 0.6
        }
        if indexPath.row % 4 == 5{
            color = 0.8
            imageView.frame = cell.contentView.frame

            cell.contentView.addSubview(imageView)

        }


        cell.contentView.layer.backgroundColor = UIColor(red: color+0.3, green: color-0.2, blue: color-0.3, alpha: 1).CGColor
        imageView.removeFromSuperview()
        if indexPath.row % 7 == 1{
            color = 0.8
            imageView.frame = cell.contentView.frame
            cell.contentView.addSubview(imageView)
        }
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
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        if let savedIndexPath = (collectionView.collectionViewLayout as! CollectionViewLayout).indexPathForPressedCell.1{
            (collectionView.collectionViewLayout as! CollectionViewLayout).indexPathForPressedCell = (true, indexPath)

            collectionView.reloadItemsAtIndexPaths([indexPath,savedIndexPath ])
            return
        }
        (collectionView.collectionViewLayout as! CollectionViewLayout).indexPathForPressedCell = (true, indexPath)
        (collectionView.collectionViewLayout as! CollectionViewLayout).itemSize = 300
        collectionView.reloadItemsAtIndexPaths([indexPath])

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
