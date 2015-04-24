//
//  BMCollectionViewLayout.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit


class BMCollectionViewLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(200, 200)
    }
    

    let interimSpace: CGFloat = 0.0
    var indexPathForPressedCell: (Bool, NSIndexPath?) = (false,nil)

    var defaultSize: CGFloat = UIScreen.mainScreen().bounds.width / 2.6
    var enlargedSize: CGFloat = 300

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

    override init() {
        super.init()
    }
    convenience init(bool: Bool, indexPath: NSIndexPath?){
        self.init()
        indexPathForPressedCell = (bool, indexPath)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

    override func collectionViewContentSize() -> CGSize {
        if indexPathForPressedCell.0 == true {
            return CGSizeMake(defaultSize * CGFloat(array.count-1) + enlargedSize ,
                defaultSize * CGFloat(array.count-1) + enlargedSize)

        }
        return CGSizeMake(defaultSize * CGFloat(array.count),
            defaultSize * CGFloat(array.count))

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

        var x = 0 as CGFloat
        var y = 0 as CGFloat
        var size: CGFloat = defaultSize
//        if (indexPathForPressedCell.0 == true && indexPathForPressedCell.1 == indexPath){
//            size = enlargedSize
//        }
        // TODO: itemSize geändert

        x = CGFloat(oIndex) * size + size/2
        y = CGFloat(vIndex) * size + size/2

//        if indexPathForPressedCell.0 == true && indexPathForPressedCell.1!.item % array.count > oIndex{
//            x += enlargedSize - defaultSize
//        }
//        if indexPathForPressedCell.0 == true && (indexPath.item - (indexPathForPressedCell.1!.item % array.count)) / array.count > oIndex{
//            y += enlargedSize - defaultSize
//        }
        if vIndex % 2 != 0 {
            x += defaultSize / 2.0
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
        attributes.size = CGSize(width: size, height: size)
        return attributes
    }
}
