//
//  RootViewController.swift
//  GymsCouch
//
//  Created by Esraa Ragab on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: - Proerties
    
    var current: UIViewController
    
    // MARK: - Init
    
    init() {
        self.current = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashScreenViewController") as! SplashScreenViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.current = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashScreenViewController") as! SplashScreenViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
    
}

// MARK: - private functions

extension RootViewController {
    
    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }
    
    func switchToMainScreen() {
         let mainViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let mainScreen = UINavigationController(rootViewController: mainViewController)
        mainScreen.isNavigationBarHidden = true
        animateDismissTransition(to: mainScreen)
    }
    
    func switchToLogout() {
        let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let logoutScreen = UINavigationController(rootViewController: loginViewController)
        logoutScreen.isNavigationBarHidden = true
        animateDismissTransition(to: logoutScreen)
    }
    
}

