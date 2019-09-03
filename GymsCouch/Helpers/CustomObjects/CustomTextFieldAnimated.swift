//
//  CustomTextFieldAnimated.swift
//  Fatorty
//
//  Created by Esraa Ragab on 8/1/19.
//  Copyright © 2019 Esraa Mohamed Ragab. All rights reserved.
//

import UIKit

protocol CustomTextFieldAnimatedDelegate {
    func selectOrDeselectFunc(id: Int)
}

@IBDesignable class CustomTextFieldAnimated: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var animatedLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var magicButton: UIButton!
    
    // MARK: - Properities
    var datePicker: UIDatePicker!
    var pickerView = UIPickerView()
    var dataOfPicker: [InvoiceProducts] = []
    var delegate: CustomTextFieldAnimatedDelegate?
    var product: InvoiceProducts?
    
    // MARK: - init
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    // MARK: - IBInspectables
    @IBInspectable var placeHolderText: String = "" {
        didSet {
            self.animatedLabel.text = placeHolderText
        }
    }
    
    @IBInspectable var magicButtonEnabled: Bool = false {
        didSet {
            self.magicButton?.isEnabled = magicButtonEnabled
        }
    }
    
    @IBInspectable var HiddeMagicButton: Bool = true {
        didSet {
            self.magicButton.isHidden = HiddeMagicButton
        }
    }
    
    @IBInspectable var textFieldText: String {
        get {
            return textField.text ?? ""
        }
        
    }
    
    @IBInspectable var setTextFieldText: String = "" {
        didSet {
            self.textField.text = setTextFieldText
            product = nil
            textFieldShouldBeginEditing(textField)
        }
    }
    
    @IBInspectable var keyboardType: String = "" {
        didSet {
            if keyboardType == "EMAIL" {
                self.textField.keyboardType = UIKeyboardType.emailAddress
            } else if keyboardType == "NUMBER" {
                self.textField.keyboardType = UIKeyboardType.numberPad
            } else {
                
            }
            
        }
    }
    
    @IBInspectable var inputType: String = "" {
        didSet {
            if inputType == "DATE" {
                datePicker = UIDatePicker.init()
                datePicker.datePickerMode = UIDatePicker.Mode.date
                datePicker.maximumDate = Date()
                datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
                datePicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                textField.inputView = datePicker
            } else if inputType == "PICKER" {
                pickerView.delegate = self
                pickerView.dataSource = self
                pickerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                textField.inputView = pickerView
                magicButton.setImage(UIImage(named: "DownArrow"), for: .normal)
                magicButton.setImage(UIImage(named: "DownArrow"), for: .disabled)
            } else {
               textField.inputView = nil
                magicButton.setImage(UIImage(named: "magic-wand"), for: .normal)
                magicButton.setImage(UIImage(named: "magicDeselect"), for: .disabled)
            }
        }
    }
    
    @IBAction func magicButtonAction(_ sender: Any) {
        delegate?.selectOrDeselectFunc(id: self.tag)
    }
    
}

// MARK: - TxtFieldDelegate
extension CustomTextFieldAnimated: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        UIView.animate(withDuration: 0.1) {
            self.topConstraint.constant = 0
            self.leftConstraint.constant = 10
            let font = UIFont(name: "Montserrat-Regular", size: 10)
            self.animatedLabel.font = font
            self.layoutIfNeeded()
        }
        self.animatedLabel.textColor = UIColor.backgroundBlue
    
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text == "" {
            UIView.animate(withDuration: 0.1) {
                self.topConstraint.constant = 10
                self.leftConstraint.constant = 20
                let font = UIFont(name: "Montserrat-Regular", size: 16)
                self.animatedLabel.font = font
                self.layoutIfNeeded()
            }
        }
        
        return true
    }
}

// MARK: - UIPickerViewDelegate
extension CustomTextFieldAnimated: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        product = dataOfPicker[row]
        textField.text = dataOfPicker[row].name
    }
}

// MARK: - UIPickerViewDataSource
extension CustomTextFieldAnimated: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataOfPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dataOfPicker[row].name
    }
}

// MARK: - public Functions
extension CustomTextFieldAnimated{
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        textField.text = dateFormatter.string(from: sender.date)
    }
    
    
    func NotEmptyField() -> Bool {
        if self.textField.text == "" {
            animatedLabel.textColor = UIColor.errorRed
            return false
        }
        return true
    }
    
}

// MARK: - private functions
extension CustomTextFieldAnimated {
    
    private func commonInit() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed("CustomTextFieldAnimated", owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        frame = view.bounds
        
        self.addSubview(view)
        
        let clickViewGesture = UITapGestureRecognizer(target: self, action: "clickView:")
        textView.addGestureRecognizer(clickViewGesture)
        textField.delegate = self
    }
    
    @objc private func clickView(_ sender:UITapGestureRecognizer){
        textField.becomeFirstResponder()
    }
    
}
