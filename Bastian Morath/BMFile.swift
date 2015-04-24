//
//  BMFile.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 23/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMFile {

    class func exists (path: String) -> Bool {
        return NSFileManager().fileExistsAtPath(path)
    }

    class func read (path: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        if BMFile.exists(path) {
            return String(contentsOfFile: "/usr/temp.txt", encoding:NSUTF8StringEncoding, error: nil)
        }

        return nil
    }

    class func write (path: String, content: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> Bool {
        return content.writeToFile(path, atomically: true, encoding: encoding, error: nil)
    }
}