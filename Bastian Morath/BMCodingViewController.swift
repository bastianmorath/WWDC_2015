//
//  BMPageViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 24/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMCodingViewController: BMPopUpBaseViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    private let identifiers = ["Mymarks", "Antum", "MINT", "Loci"]  // the storyboard ids for the four child view controllers

    var page : Int!

    private var cache = NSCache()

    var pageViewController: UIPageViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //pageViewController.setViewControllers([viewControllerForPage(0)!], direction: .Forward, animated: false, completion: nil)
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return viewControllerForPage(page)

    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        return viewControllerForPage(page)
    }

    private func viewControllerForPage(page: Int) -> UIViewController? {
        if page >= 0 && page < identifiers.count {
            if let controller = cache.objectForKey(page) as? UIViewController {
                return controller
            }
            let controller = storyboard?.instantiateViewControllerWithIdentifier(identifiers[page]) as? UIViewController
//            (controller as! PageDelegate).pageNumber = page
            cache.setObject(controller!, forKey: page)
            return controller
        }

        return nil
    }


}
