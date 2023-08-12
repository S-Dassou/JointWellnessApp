//
//  OnboardingPageViewController.swift
//  JointStrengthApp
//
//  Created by shafique dassu on 10/08/2023.
//

import UIKit

protocol onboardingPageViewControllerDelegate: AnyObject {
    func setupPageController(numberOfPage: Int)
    func turnPageController(to index: Int)
}

class OnboardingPageViewController: UIPageViewController {

    weak var pageViewControllerDelegate: onboardingPageViewControllerDelegate?
    
    var pageTitle = ["First Page", "Second Page", "Third Page"]
    var pageDescriptionText = [
        "This is first page stating what this app is about",
        "A second page stating more app info incase you need them",
        "The very last page with yet more info for our esteem users"
    ]
    var backgroundColor: [UIColor] = [.blue, .green, .red]
    var pageImages: [UIImage] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        if let firstViewController = contentViewController(at: 0) {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    func turnPage(to index: Int) {
        currentIndex = index
        if let currentController = contentViewController(at: index) {
            setViewControllers([currentController], direction: .forward, animated: true)
            self.pageViewControllerDelegate?.turnPageController(to: currentIndex)
        }
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if var index = (viewController as? OnboardingContentViewController)?.index {
        index -= 1
        return contentViewController(at: index)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if var index = (viewController as? OnboardingContentViewController)?.index {
            index += 1
            index += 1
            return contentViewController(at: index)
        }
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if let pageContentViewController = pageViewController.viewControllers?.first as? OnboardingContentViewController {
            currentIndex = pageContentViewController.index
            self.pageViewControllerDelegate?.turnPageController(to: currentIndex)
        }
    }
    
    func contentViewController(at index: Int) -> OnboardingContentViewController? {
        if index < 0 || index >= pageTitle.count {
            return nil
        }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewController = storyBoard.instantiateViewController(withIdentifier: "OnboardingContentViewController") as? OnboardingContentViewController {
            pageContentViewController.image = pageImages[index]
            pageContentViewController.subHeading = pageDescriptionText[index]
            pageContentViewController.heading = pageTitle[index]
            pageContentViewController.bgColor = backgroundColor[index]
            pageContentViewController.index = index
            self.pageViewControllerDelegate?.setupPageController(numberOfPage: 3)
            return pageContentViewController
        }
        return nil
    }
}

