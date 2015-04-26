//
//  BMPageViewController.swift
//  Bastian Morath
//
//  Created by Bastian Morath on 24/04/15.
//  Copyright (c) 2015 Bastian Morath. All rights reserved.
//

import UIKit

class BMCodingViewController: BMPopUpBaseViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {


    var page : Int = 0

    private var cache = NSCache()

    var pageViewController: UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        pageViewController.setViewControllers([viewControllerForPage(0)!], direction: .Forward, animated: true, completion: nil)
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        self.addChildViewController(pageViewController)
        self.view.addSubview(self.pageViewController.view)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        page++
        return viewControllerForPage(page)

    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        page--
        return viewControllerForPage(page)
    }

    private func viewControllerForPage(page: Int) -> UIViewController? {

        if page >= 0 && page < Factory.BMCodingProject.count-1{
            if let controller = cache.objectForKey(page) as? UIViewController {
                //return controller
            }
            println("Page: \(self.page % 5)")
            var controller = BMCodingTopicViewController()
            controller.project = Factory.BMCodingProject(rawValue: (self.page % 5))
            cache.setObject(controller, forKey: page)
            return controller
        }
        
        return nil
    }

    
    
    
}
