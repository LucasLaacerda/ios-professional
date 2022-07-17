//
//  ViewController.swift
//  Bankey
//
//  Created by Lucas Lacerda on 12/06/22.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {

    typealias CompletionHandler = () -> Void
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    let titleLoginLabel = UILabel()
    let subTitleLoginLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?

    
    var username: String?{
        loginView.userNameTextField.text
    }
    
    var password: String?{
        loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }


}


extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.isHidden = true
        
        titleLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLoginLabel.textAlignment = .center
        titleLoginLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLoginLabel.adjustsFontForContentSizeCategory = true
        titleLoginLabel.text = "Bankey"

        subTitleLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLoginLabel.textAlignment = .center
        subTitleLoginLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subTitleLoginLabel.adjustsFontForContentSizeCategory = true
        subTitleLoginLabel.numberOfLines = 0
        subTitleLoginLabel.text = "Your premium source for all things banking!!"

    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(titleLoginLabel)
        view.addSubview(subTitleLoginLabel)
        
        //Title
        NSLayoutConstraint.activate([
            subTitleLoginLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLoginLabel.bottomAnchor, multiplier: 3),
            titleLoginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLoginLabel.bottomAnchor, multiplier: 3),
            subTitleLoginLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleLoginLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        
        //Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        
        //Sign In Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Error Message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
            
        ])
        
        
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){

        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        
        
        authenticateUser()
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
    private func authenticateUser(){
                
        if username == "Lucas" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }else {
            configureView(withMessage: "Incorret username / password")
        }
        
        return
    }
}
