//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Lucas Lacerda on 03/07/22.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let imageViewOnboarding = UIImageView()
    let labelOnboarding = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    
}


extension OnboardingViewController {
    
    private func style() {
        view.backgroundColor = .white
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // ImageView
        imageViewOnboarding.translatesAutoresizingMaskIntoConstraints = false
        imageViewOnboarding.contentMode = .scaleAspectFit
        imageViewOnboarding.image = UIImage(named: "delorean")
        
        // Label
        labelOnboarding.translatesAutoresizingMaskIntoConstraints = false
        labelOnboarding.textAlignment = .center
        labelOnboarding.font = UIFont.preferredFont(forTextStyle: .title3)
        labelOnboarding.adjustsFontForContentSizeCategory = true
        labelOnboarding.numberOfLines = 0
        labelOnboarding.text = "Bankey is faster, easier to use, and has a brandnew look and feel that will make you feel like you are back in 1989."
        
    }
    
    private func layout() {
        stackView.addArrangedSubview(imageViewOnboarding)
        stackView.addArrangedSubview(labelOnboarding)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
    }
}
