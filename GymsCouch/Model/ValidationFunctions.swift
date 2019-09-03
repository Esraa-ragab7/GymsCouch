//
//  ValidationFunctions.swift
//  GymsCouch
//
//  Created by Esraa Mohamed Ragab on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import UIKit

func IsValidEmail (textField: UITextField) -> Bool{
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9]+\\.[A-Za-z]{3,6}"
    let index = textField.text?.index(of: "@")
    if index?.hashValue == 0 {
        return false
    }
    let index1 = textField.text?.index(of: ".")
    if index1?.hashValue == 0 {
        return false
    }
    if (textField.text?.hasSuffix(".com"))!{
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with:textField.text)
    }
    return false
}

func IsValidPassword (textField: UITextField) -> Bool{
    let pass = textField.text
    if (pass?.count)! >= 8{
        let letters = CharacterSet.letters
        let range = pass?.rangeOfCharacter(from: letters)
        if let test = range {
            let decimalCharacters = CharacterSet.decimalDigits
            let decimalRange = pass?.rangeOfCharacter(from: decimalCharacters)
            if decimalRange != nil {
                return true
            }
        }
    }
    return false
}
