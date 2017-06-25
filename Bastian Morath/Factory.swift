//
//  Colors.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 22/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit


// This Factory class provides some useful methods and enums to lay out some code from the 

// Defines the frame of the PopUpBaseView that pops up when a cell is pressed
let kPopUpFrame: CGRect = CGRect(x: kMargin, y: kMargin, width: UIScreen.main.bounds.width - 2 * kMargin, height: UIScreen.main.bounds.height - 2 * kMargin)
// Default margin
let kMargin = 10 as CGFloat
let kDefaultFontSize = 15 as CGFloat
let kIPhone5CornerRadius = 100 as CGFloat
let kIPhone6CornerRadius = 115 as CGFloat

class Factory{

    /// Returns a background gradient
    class func colorGradient() -> CAGradientLayer {
        let colorTop =    UIColor(red:12/255.0, green:58/255.0, blue:97/255.0, alpha:1).cgColor
        let colorBottom = UIColor(red:165/255.0, green:51/255.0, blue:20/255.0, alpha:1).cgColor
        
        let gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.locations = [ 0.0, 0.7,0.8,1.0]
        return gl
    }


    // Every cell is assigned to a BMTopic
    enum BMTopic: Int {
        case about
        case education
        case coding
        case traveling
        case sports
        case guitar
        case photography
    }

    // An Image is either round or Angular
    enum BMImageShape: Int {
        case round
        case angular
    }

    // Every coding view in the BMCodingViewController is assigned to a BMCodingProject
    enum BMCodingProject: Int {
        case general
        case myMarks
        case antum
        case mint
        case loci

        static var count: Int { return BMCodingProject.loci.hashValue + 1}
    }

    // Returns the description for the different Topics
    class func descriptionStringForTopic(_ topic: BMTopic) -> String{
        switch topic{
        case .about:
            return BMStrings.aboutMyselfString
        case .coding:
            return BMStrings.codingString
        case .education:
            return BMStrings.educationString
        case .sports:
            return BMStrings.sportsString
        case .guitar:
            return BMStrings.guitarString
        case .photography:
            return BMStrings.photographyString
        case .traveling:
            return BMStrings.travelingString
        default:
            return ""
        }
    }

    // Returns the description for the different Coding topics
    class func descriptionStringForCodingTopic(_ topic: BMCodingProject) -> String{
        switch topic{
        case .general:
            return BMStrings.codingString
        case .myMarks:
            return BMStrings.myMarksString
        case .antum:
            return BMStrings.antumString
        case .loci:
            return BMStrings.lociString
        case .mint:
            return BMStrings.mintString
        default:
            return ""
        }
    }

    // This method calculates the color for the white textColor based on the background (The eye perceives the same color on different backgrounds differently!)
    class func whiteColorForTopic(_ topic: Factory.BMTopic)-> UIColor{

        var d = 0 as CGFloat

        let color = Factory.colorForTopic(topic)
        let myCIColor = CIColor(color: color)
        let redComp = myCIColor.red
        let greenComp = myCIColor.green
        let blueComp = myCIColor.blue

            // Counting the perceptive luminance - human eye favors green color...
            let a = 1 - ( 0.299 * redComp + 0.587 * greenComp + 0.114 * blueComp)/255;

        if (a < 0.5){
            d = 0; // bright colors - black font

        } else {
            d = 255; // dark colors - white font

        }
        return UIColor(red: d, green: d, blue: d, alpha: 1)
    }
    
    // Returns the height for a given string
    class func heightForString(_ string: String)-> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth - 87, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = systemFontWithSize(kDefaultFontSize)
        label.text = string
        label.sizeToFit()
        return label.frame.height + 50
    }

    // return an image for a given BMTopic
    class func imageForGeneralTopic(_ topic: BMTopic) -> UIImage{
        var image: UIImage!
        switch topic{
        case .about:
            image = UIImage(named: "profileImage.jpg")
        case .education:
            image = UIImage(named: "education.jpeg")
        case .coding:
            image = UIImage(named: "coding.png")
        case .traveling:
            image = UIImage(named: "traveling.jpg")
        case .sports:
            image = UIImage(named: "handball.jpg")
        case .guitar:
            image = UIImage(named: "guitar.png")
        case .photography:
            image = UIImage(named: "photography.JPG")
        default:
            image = UIImage()
        }
    return image
    }

    // Returns an image for a coding topic
    class func imageForCodingTopic(_ topic: BMCodingProject) -> UIImage{
        var image: UIImage!
        switch topic{
        case .general:
            image = UIImage(named: "coding.png")
        case .myMarks:
            image = UIImage(named: "mymarks.png")
        case .antum:
            image = UIImage(named: "antum.png")
        case .loci:
            image = UIImage(named: "loci.jpg")
        case .mint:
            image = UIImage(named: "mint.jpeg")
        default:
            image = UIImage()
        }

        if topic == .general{
            image = RBResizeImage(image, targetSize: CGSize(width: 200, height: 200))
        } else if topic == .mint{
            image = RBResizeImage(image, targetSize: CGSize(width: 1.893 * 130, height: 130))
        } else {
            image = RBResizeImage(image, targetSize: CGSize(width: 150, height: 150 * 1.775))

        }
        return image
    }

    class func cellHeightForTopic(_ topic: BMCodingProject) -> CGFloat{
        return imageForCodingTopic(topic).size.height + 56
    }

    class func RBResizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let hasAlpha = false
        let scale: CGFloat = 0.0

        UIGraphicsBeginImageContextWithOptions(targetSize, !hasAlpha, scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: targetSize))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage!
    }



    class func colorForTopic(_ topic: BMTopic) -> UIColor{
        switch topic {
        case .about:
            return UIColor(red: 0.1+0.3, green: 0.1-0.2, blue: 0.1-0.3, alpha: 1)
        case .education:
            return UIColor(red: 0.2+0.3, green: 0.2-0.2, blue: 0.2-0.3, alpha: 1)
        case .coding:
            return UIColor(red: 0.3+0.3, green: 0.3-0.2, blue: 0.3-0.3, alpha: 1)
        case .traveling:
            return UIColor(red: 0.4+0.3, green: 0.4-0.2, blue: 0.4-0.3, alpha: 1)
        case .sports:
            return UIColor(red: 0.5+0.3, green: 0.5-0.2, blue: 0.5-0.3, alpha: 1)
        case .guitar:
            return UIColor(red: 0.6+0.3, green: 0.6-0.2, blue: 0.6-0.3, alpha: 1)
        case .photography:
            return UIColor(red: 0.7+0.3, green: 0.7-0.2, blue: 0.7-0.3, alpha: 1)
        default:
            return UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 1)
        }
    }

    class func systemFontWithSize(_ size: CGFloat) -> UIFont{
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }


    static  var screenHeight:CGFloat {
        get{
            return UIScreen.main.bounds.height
        }
    }

    static  var screenWidth:CGFloat {
        get{
            return UIScreen.main.bounds.width
        }
    }

}
