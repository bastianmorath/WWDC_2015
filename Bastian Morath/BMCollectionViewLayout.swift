//
//  BMCollectionViewLayout.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 14/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// This class sets the layout of the ColelctionView. Is it based on the equation -c((x/a)^2 + (y/a)^2) + 1.0, which represents a elliptic paraboloid

class BMCollectionViewLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    

    let interimSpace: CGFloat = 0.0
    var indexPathForPressedCell: (Bool, IndexPath?) = (false,nil)

    var defaultSize: CGFloat = UIScreen.main.bounds.width / 2.6
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

    let c: CGFloat = 23

    override init() {
        super.init()
    }
    convenience init(bool: Bool, indexPath: IndexPath?){
        self.init()
        indexPathForPressedCell = (bool, indexPath)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override var collectionViewContentSize : CGSize {
        if indexPathForPressedCell.0 == true {
            return CGSize(width: defaultSize * CGFloat(array.count-1) + enlargedSize ,
                height: defaultSize * CGFloat(array.count-1) + enlargedSize)

        }
        return CGSize(width: defaultSize * CGFloat(array.count),
            height: defaultSize * CGFloat(array.count))

    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        for i in 0 ..< cellCount {
            let indexPath = IndexPath(item: i, section: 0)
            attributes.append(self.layoutAttributesForItem(at: indexPath))
        }
        return attributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes!
    {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)

        let oIndex = indexPath.item % array.count
        let vIndex = (indexPath.item - oIndex) / array.count

        var x = 0 as CGFloat
        var y = 0 as CGFloat
        let size: CGFloat = defaultSize

        x = CGFloat(oIndex) * size + size/2
        y = CGFloat(vIndex) * size + size/2


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

        attributes.transform = CGAffineTransform(scaleX: z, y: z)
        attributes.size = CGSize(width: size, height: size)
        return attributes
    }
}
