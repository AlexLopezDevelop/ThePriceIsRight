//
//  PageViewController.swift
//  ThePriceIsRight
//
//  Created by Alex Lopez on 14/12/2018.
//  Copyright © 2018 Alex Lopez. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var pageViewControllers: [UIViewController] = {
        return [self.createNewViewController(name: "RoomsVC"), self.createNewViewController(name: "BathsVC"), self.createNewViewController(name: "CarsVC"), self.createNewViewController(name: "YearVC"), self.createNewViewController(name: "SizeVC"), self.createNewViewController(name: "ConditionVC"), self.createNewViewController(name: "SizeVC"), self.createNewViewController(name: "ResultVC")]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        if let firstVC = self.pageViewControllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        configurePageControl()
    }
    
    // MARK: - Data Source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = self.pageViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        if previousIndex >= 0 {
            return self.pageViewControllers[previousIndex]
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = self.pageViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        if nextIndex < self.pageViewControllers.count {
            return self.pageViewControllers[nextIndex]
        }
        
        return nil
    }
    
    // MARK: - Automatic method
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let currentVC = pageViewController.viewControllers![0]
        self.pageControl.currentPage = self.pageViewControllers.index(of: currentVC)!
    }
    
    // MARK: - Custom Functions
    func createNewViewController (name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func configurePageControl() {
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = self.pageViewControllers.count
        self.pageControl.currentPage = 0
        //self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(self.pageControl)
    }
}
