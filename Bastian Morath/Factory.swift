//
//  Colors.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 22/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

let kAnimationDuration = 0.5
let kPopUpFrame: CGRect = CGRectMake(kMargin, kMargin, UIScreen.mainScreen().bounds.width - 2 * kMargin, UIScreen.mainScreen().bounds.height - 2 * kMargin)
let kMargin = 10 as CGFloat
class Factory{


    /// Creates a background gradient

    class func colorGradient() -> CAGradientLayer {
        let colorTop =    UIColor(red:12/255.0, green:58/255.0, blue:97/255.0, alpha:1).CGColor
        let colorBottom = UIColor(red:165/255.0, green:51/255.0, blue:20/255.0, alpha:1).CGColor
        
        var gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.locations = [ 0.0, 0.7,0.8,1.0]
        return gl
    }

    /**
    */
    enum BMTopic: Int {
        case About
        case education
        case coding
        case traveling
        case handball
        case guitar
        case golfing
    }

    class func colorForTopic(topic: BMTopic) -> UIColor{
        switch topic {
        case .About:
            return UIColor(red: 0.1+0.3, green: 0.1-0.2, blue: 0.1-0.3, alpha: 1)
        case .education:
            return UIColor(red: 0.2+0.3, green: 0.2-0.2, blue: 0.2-0.3, alpha: 1)
        case .coding:
            return UIColor(red: 0.3+0.3, green: 0.3-0.2, blue: 0.3-0.3, alpha: 1)
        case .traveling:
            return UIColor(red: 0.4+0.3, green: 0.4-0.2, blue: 0.4-0.3, alpha: 1)
        case .handball:
            return UIColor(red: 0.5+0.3, green: 0.5-0.2, blue: 0.5-0.3, alpha: 1)
        case .guitar:
            return UIColor(red: 0.6+0.3, green: 0.6-0.2, blue: 0.6-0.3, alpha: 1)
        case .golfing:
            return UIColor(red: 0.7+0.3, green: 0.7-0.2, blue: 0.7-0.3, alpha: 1)
        default:
            return UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 1)
        }
    }

    class func colorForIndexPath(indexPath: NSIndexPath) -> UIColor{
        let modIndex = indexPath.row % 4
        println(modIndex)
        switch modIndex {
        case 0:
            return UIColor(red: 0.6+0.3, green: 0.6-0.2, blue: 0.6-0.3, alpha: 1)
        case 1:
            return UIColor(red: 0.2+0.3, green: 0.2-0.2, blue: 0.2-0.3, alpha: 1)
        case 2:
            return UIColor(red: 0.8+0.3, green: 0.8-0.2, blue: 0.8-0.3, alpha: 1)
        case 3:
            return UIColor(red: 0.4+0.3, green: 0.4-0.2, blue: 0.4-0.3, alpha: 1)
        default:
            return UIColor(red: 0.4+0.3, green: 0.4-0.2, blue: 0.4-0.3, alpha: 1)
        }
    }

    class func systemFOntWithSize(size: CGFloat) -> UIFont{
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }

}
