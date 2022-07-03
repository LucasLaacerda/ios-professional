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
    
    let imageNameOnboarding: String
    let textOnboarding: String

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    init(imageNameOnboarding: String, textOnboarding: String){
        self.imageNameOnboarding = imageNameOnboarding
        self.textOnboarding = textOnboarding
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension OnboardingViewController {
    
    private func style() {
        view.backgroundColor = .systemBackground
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // ImageView
        imageViewOnboarding.translatesAutoresizingMaskIntoConstraints = false
        imageViewOnboarding.contentMode = .scaleAspectFit
        imageViewOnboarding.image = UIImage(named: imageNameOnboarding)
        
        // Label
        labelOnboarding.translatesAutoresizingMaskIntoConstraints = false
        labelOnboarding.textAlignment = .center
        labelOnboarding.font = UIFont.preferredFont(forTextStyle: .title3)
        labelOnboarding.adjustsFontForContentSizeCategory = true
        labelOnboarding.numberOfLines = 0
        labelOnboarding.text = textOnboarding
        
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
