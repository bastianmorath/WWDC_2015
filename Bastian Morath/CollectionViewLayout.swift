//
//  BMCollectionViewLayout.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit



let array = ["Three", "Four", "One", "Two" , "Three", "Four", "One"]
let itemSize: CGFloat = UIScreen.mainScreen().bounds.width / 2.6

class CollectionViewLayout: UICollectionViewLayout {

    
    let interimSpace: CGFloat = 0.0

    var center: CGPoint {
        return CGPoint(x: (self.cViewSize.width) / 2.0,
            y: (self.cViewSize.height) / 2.0)
    }

    var cellCount: Int {
        return array.count * array.count
    }

    var cViewSize: CGSize {
        return self.collectionView!.frame.size
    }

    var a: CGFloat {
        return 2.5 * self.cViewSize.width
    }

    var b: CGFloat {
        return 2.5 * self.cViewSize.height
    }

    let c: CGFloat = 20

    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake(itemSize * CGFloat(array.count),
            itemSize * CGFloat(array.count))
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attributes = [AnyObject]()
        for i in 0 ..< cellCount {
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            attributes.append(self.layoutAttributesForItemAtIndexPath(indexPath))
        }
        return attributes
    }

    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes!
    {
        var attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)

        let oIndex = indexPath.item % array.count
        let vIndex = (indexPath.item - oIndex) / array.count

        // TODO: itemSize geändert
        var x = CGFloat(oIndex) * itemSize + itemSize/2
        var y = CGFloat(vIndex) * itemSize + itemSize/2

        if vIndex % 2 != 0 {
            //x += itemSize / 2.0
        }

        attributes.center = CGPoint(x: x, y: y)

        let offset = self.collectionView!.contentOffset
        x -= (self.center.x + CGFloat(offset.x))
        y -= (self.center.y + CGFloat(offset.y))

        x = -x*x/(a*a)
        y = -y*y/(b*b)
        var z = c * (x+y) + 1.0
        z = z < 0.0 ? 0.0 : z

        attributes.transform = CGAffineTransformMakeScale(z, z)
        attributes.size = CGSize(width: itemSize, height: itemSize)
        
        return attributes
    }

}
