//
//  OContentViewController.swift
//  JointStrengthApp
//
//  Created by shafique dassu on 10/08/2023.
//

import UIKit

class OnboardingContentViewController: UIViewController {
    
    @IBOutlet weak var onboardingImage: UIImageView!
    @IBOutlet weak var onboardingTitle: UILabel! {
        didSet {
            onboardingTitle.numberOfLines = 0
        }
    }
    @IBOutlet weak var onboardingDescription: UILabel! {
        didSet {
            onboardingDescription.numberOfLines = 0
        }
    }
    
    var index = 0
    var heading = ""
    var subHeading = ""
    var image = UIImage()
    var bgColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextLabel()
        onboardingImage.image = image
        view.backgroundColor = bgColor
        
    }
    
    func setupTextLabel() {
        let attributedText = NSMutableAttributedString(string: heading, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "\n\n\(subHeading)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        onboardingTitle.attributedText = attributedText
        onboardingTitle.textAlignment = .center
        
    }
}
