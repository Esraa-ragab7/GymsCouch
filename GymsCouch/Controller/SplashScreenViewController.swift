//
//  SplashScreenViewController.swift
//  GymsCouch
//
//  Created by Esraa Ragab on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    // MARK: - Properties
    private let splashScreenTimerLenght: Int = 3
    
    // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        counter()
    }
    
}

extension SplashScreenViewController {
    
    private func counter() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(splashScreenTimerLenght)) {
            if (AppDelegate.shared.rootViewController.current as? SplashScreenViewController) != nil {
                if UserDefaults.standard.bool(forKey: "Login") {
                    AppDelegate.shared.rootViewController.switchToMainScreen()
                } else {
                    AppDelegate.shared.rootViewController.switchToLogout()
                }
            }
        }
    }
}
