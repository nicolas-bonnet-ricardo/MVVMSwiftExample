//
//  UIButtonStyle.swift
//  Autoricardo
//
//  Created by Nicolas Bonnet on 5/2/17.
//  Copyright © 2017 Ricardo.ch. All rights reserved.
//

import Foundation
import UIKit


enum ButtonStyle : Int
{
    case main = 0
    case large = 1
    case flat = 2
    case icon = 3
}

@IBDesignable
extension UIButton: Styleable
{
    @IBInspectable var buttonStyle:Int? {
        set {
            let buttonStyle: ButtonStyle = ButtonStyle(rawValue: newValue!)!
            switch buttonStyle
            {
            case .main:
                self.setTitleColor(Colors.white.value, for: .normal)
                self.tintColor = Colors.white.value
                self.titleLabel?.font = Fonts.button.value
                self.backgroundColor = Colors.primary.value
                self.layer.cornerRadius = 2
                
            case .large:
                self.setTitleColor(Colors.white.value, for: .normal)
                self.tintColor = Colors.white.value
                self.titleLabel?.font = Fonts.buttonLarge.value
                self.backgroundColor = Colors.primary.value
                self.layer.cornerRadius = 2
                
            case .flat:
                self.setTitleColor(Colors.primary.value, for: .normal)
                self.tintColor = Colors.primary.value
                self.titleLabel?.font = Fonts.button.value
                self.backgroundColor = Colors.transparent.value
                
            case .icon:
                self.tintColor = Colors.primary.value
                self.backgroundColor = Colors.transparent.value
                
            }
        }
        get {
            return ButtonStyle.main.rawValue
        }
    }
    
    func setStyle(with style: Int)
    {
        let buttonStyle: ButtonStyle = ButtonStyle(rawValue: style)!
        switch buttonStyle
        {
        case .main:
            self.setTitleColor(Colors.white.value, for: .normal)
            self.tintColor = Colors.white.value
            self.titleLabel?.font = Fonts.button.value
            self.backgroundColor = Colors.primary.value
            self.layer.cornerRadius = 2
            
        case .large:
            self.setTitleColor(Colors.white.value, for: .normal)
            self.tintColor = Colors.white.value
            self.titleLabel?.font = Fonts.buttonLarge.value
            self.backgroundColor = Colors.primary.value
            self.layer.cornerRadius = 2
            
        case .flat:
            self.setTitleColor(Colors.primary.value, for: .normal)
            self.tintColor = Colors.primary.value
            self.titleLabel?.font = Fonts.button.value
            self.backgroundColor = Colors.transparent.value
            
        case .icon:
            self.tintColor = Colors.primary.value
            self.backgroundColor = Colors.transparent.value
            
        }
    }
}
