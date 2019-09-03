//
//  uiViewExtention.swift
//  Core
//
//  Created by Esraa Mohamed Ragab on 5/26/19.
//  Copyright © 2019 Ibrahim. All rights reserved.
//


import UIKit
@IBDesignable
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
                layer.masksToBounds = false
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGPoint {
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        
    }
    
    @IBInspectable var shadowBlur: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue / 2.0
        }
    }
    
//    func specificRadiusBottomCorners(cornerRadius: Double) {
//        self.layer.cornerRadius = CGFloat(cornerRadius)
//        self.clipsToBounds = true
//        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//    }
    
//    @IBInspectable var shadowSpread: CGFloat = 0 {
//        didSet {
//            if shadowSpread == 0 {
//                layer.shadowPath = nil
//            } else {
//                let dx = -shadowSpread
//                let rect = bounds.insetBy(dx: dx, dy: dx)
//                layer.shadowPath = UIBezierPath(rect: rect).cgPath
//            }
//        }
//    }
}
