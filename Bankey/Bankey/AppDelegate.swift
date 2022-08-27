//
//  AppDelegate.swift
//  Bankey
//
//  Created by Lucas Lacerda on 12/06/22.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

 
    var window: UIWindow?
    let mainViewController = MainViewController()
    var loginViewController = LoginViewController()
    var onboardingContainerViewController = OnboardingContainerViewController()
    var dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.delegate = self
        //window?.rootViewController = mainViewController
        window?.rootViewController = AccountSummaryViewController()
        return true
    }
    
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
        
    }
}

extension AppDelegate: LoginViewControllerDelegate, OnboardingContainerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyViewController)
        }else{
            setRootViewController(onboardingContainerViewController)
        }
    }
    
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyViewController)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
    
   
}


