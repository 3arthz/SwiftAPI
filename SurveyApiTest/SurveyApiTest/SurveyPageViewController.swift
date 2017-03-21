//
//  SurveyPageViewController.swift
//  SurveyApiTest
//
//  Created by Methus Narksenee on 3/21/2560 BE.
//  Copyright © 2560 nimbl3test. All rights reserved.
//

import UIKit

class SurveyPageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate{
    
    var dataObjects = NSArray()
    let dataController = ItemAPI()
    var pageviewcontroller: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.dataSource = self
        self.delegate = self
        //Fetch Data when Opening Application
        dataController.getFeedItems { (error) in
            if let firstVC = self.viewControllerAtIndex(0) {
                let viewControllers = [firstVC]
                self.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
            }
        }
    }
    //Config Pagecontrol
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for x in self.view.subviews {
            if x is UIScrollView {
                x.frame = UIScreen.main.bounds
            } else if x is UIPageControl {
                view.translatesAutoresizingMaskIntoConstraints = false
                x.backgroundColor = UIColor.clear
                x.frame = CGRect(x: view.frame.width - 20, y: view.frame.height/2, width: 10, height: 10)
                let angle = CGFloat(M_PI_2)
                x.transform = CGAffineTransform(rotationAngle: angle)
            }
        }
    }

    @IBAction func Reload(_ sender: Any) {
        dataController.getFeedItems { (error) in
            self.setViewControllers([self.viewControllerAtIndex(0)!], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //Set Previous Page
        if let pageContent: PageContentViewController = viewController as! PageContentViewController{
            var index = pageContent.pageIndex
            
            if ((index == 0) || (index == NSNotFound))
            {
                return nil
            }
            
            index -= 1;
            return viewControllerAtIndex(index)
        }
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //Set Next Page
        if let pageContent: PageContentViewController = viewController as! PageContentViewController{
            var index = pageContent.pageIndex
            
            if (index == NSNotFound)
            {
                return nil;
            }
            
            index += 1;
            if (index == dataController.Name.count)
            {
                return nil;
            }
            return viewControllerAtIndex(index)
        }
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
       return dataController.Name.count
    }
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        // TODO: implement
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController
        //Send value to PageContentVC
        vc.name = dataController.Name[index]
        vc.imgUrl = dataController.ImageURL[index]
        vc.descriptions = dataController.Description[index]
        vc.pageIndex = index
        return vc
    }
}
