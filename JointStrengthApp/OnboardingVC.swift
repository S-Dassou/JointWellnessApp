//
//  OnboardingVC.swift
//  JointStrengthApp
//
//  Created by shafique dassu on 02/08/2023.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var nextButtonTapped: UIButton!
    @IBOutlet weak var skipButtonTapped: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    weak var onboardingPageViewController: OnboardingPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        onboardingPageViewController?.turnPage(to: pageControl.currentPage + 1)
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let onboardingViewController = segue.destination as? OnboardingPageViewController {
            onboardingViewController.pageViewControllerDelegate = self
            onboardingPageViewController = onboardingViewController
        }
    }
}

extension OnboardingVC: onboardingPageViewControllerDelegate {
    func setupPageController(numberOfPage: Int) {
        pageControl.numberOfPages = numberOfPage
    }
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
    
    
}
