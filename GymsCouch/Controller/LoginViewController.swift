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
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignIn(_ sender: Any) {
        if IsValidEmail(textField: emailTextField.textField) && passwordTextField.textFieldText != "" {
            UserDefaults.standard.set(true, forKey: "Login")
            AppDelegate.shared.rootViewController.switchToMainScreen()
        } else {
            errorLabel.text = "Please Insert Correct Email and Don't let the Password Field Empty."
        }
    }
    

}

