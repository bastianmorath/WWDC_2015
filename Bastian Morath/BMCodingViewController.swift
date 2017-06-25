//
//  BMPageViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 24/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

// This Class manages a pageViewController that shows all the coding projects I've worked on

class BMCodingViewController: BMPopUpBaseViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {


    // Stores already instanciated controllers
    fileprivate var cache = NSCache<AnyObject, AnyObject>()

    var pageViewController: UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        pageViewController.setViewControllers([viewControllerForPage(0)!], direction: .forward, animated: true, completion: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        self.addChildViewController(pageViewController)
        self.view.addSubview(self.pageViewController.view)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! BMCodingTopicViewController).pageIndex!
        index += 1
        if(index >= 5){
            return nil
        }
        return viewControllerForPage(index)

    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! BMCodingTopicViewController).pageIndex!
        if(index <= 0){
            return nil
        }
        index -= 1
        return viewControllerForPage(index)
    }

    fileprivate func viewControllerForPage(_ page: Int) -> UIViewController? {
        if(page >= 5) {
            return nil
        }
        if let controller = cache.object(forKey: page as AnyObject) as? UIViewController {
            return controller
        }
        let controller = BMCodingTopicViewController()
        controller.project = Factory.BMCodingProject(rawValue: (page % 5))
        controller.pageIndex = page
        cache.setObject(controller, forKey: page as AnyObject)
        return controller
    }
}
