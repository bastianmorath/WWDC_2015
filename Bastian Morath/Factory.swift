//
//  Colors.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 22/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

let kAnimationDuration = 0.2
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

    class func descriptionStringForTopic(topic: BMTopic) -> String{
        switch topic{
        case .About:
            return BMStrings.aboutMyselfString
        case .coding:
            return BMStrings.codingString
        case .education:
            return BMStrings.educationString
        case .golfing:
            return BMStrings.golfingString
        case .guitar:
            return BMStrings.guitarString
        case .handball:
            return BMStrings.handballString
        case .traveling:
            return BMStrings.travelingString
        default:
            return ""
        }
    }

    class func imageForTopic(topic: BMTopic) -> UIImage{
        var image: UIImage!

        switch topic{
        case .About:
            image = UIImage(named: "profileImage.jpg")
        case .education:
            image = UIImage(named: "educationx2")
            image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .coding:
            image = UIImage(named: "codingx2")
            image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .traveling:
            image = UIImage(named: "travelingx2.png")
            image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .handball:
            image = UIImage(named: "handballx2")
            image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .guitar:
            image = UIImage(named: "guitarx2")
            image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        case .golfing:
            image = UIImage(named: "golfingx2")
            image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        default:
            image = UIImage()
        }
image = UIImage(named: "profileImage.jpg")
    return image
    }

    class func RBResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    enum BMImageShape: Int {
        case Round
        case angular
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

    class func systemFontWithSize(size: CGFloat) -> UIFont{
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }

}
