//
//  ViewController.swift
//  GymsCouch
//
//  Created by Abdelrahman Abu Sharkh on 9/2/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: CustomTextFieldAnimated!
    @IBOutlet weak var passwordTextField: CustomTextFieldAnimated!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignIn(_ sender: Any) {
        if emailTextField.textFieldText != "" && passwordTextField.textFieldText != "" {
            AppDelegate.shared.rootViewController.switchToMainScreen()
        }
    }
    

}

