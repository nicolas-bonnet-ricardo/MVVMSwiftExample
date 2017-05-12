//
//  UIColorStyle.swift
//  Autoricardo
//
//  Created by Nicolas Bonnet on 5/2/17.
//  Copyright © 2017 Ricardo.ch. All rights reserved.
//

import Foundation
import UIKit

enum Colors
{
    case primary
    case accent
    case error
    case warning
    case success
    case white
    case transparent
    case textPrimary
    case textSecondary
}

extension Colors {
    var value: UIColor {
        get {
            switch self {
            case .primary:
                return Colors.colorForKey(color: "3563a6")
                
            case .accent:
                return Colors.colorForKey(color: "3563a6")
                
            case .error:
                return Colors.colorForKey(color: "d84021")
                
            case .warning:
                return Colors.colorForKey(color: "edb400")
                
            case .success:
                return Colors.colorForKey(color: "3db200")
                
            case .white:
                return UIColor.white
                
            case .transparent:
                return UIColor.clear
                
            case .textPrimary:
                return UIColor.black.withAlphaComponent(0.87)
                
            case .textSecondary:
                return UIColor.black.withAlphaComponent(0.54)
            }
        }
    }
    
    static func colorForKey(color: String) -> UIColor
    {
        var colorString: String = color
        
        if colorString.characters.count != 6
        {
            return UIColor.white
        }
        
        let redString = String(colorString.characters.prefix(2))
        
        colorString = String(colorString.characters.dropFirst(2))
        
        let greenString = String(colorString.characters.prefix(2))
        
        colorString = String(colorString.characters.dropFirst(2))
        
        let blueString = String(colorString.characters.prefix(2))
        
        
        var redUInt: CUnsignedInt = 0
        Scanner(string: redString).scanHexInt32(&redUInt)
        
        var greenUInt: CUnsignedInt = 0
        Scanner(string: greenString).scanHexInt32(&greenUInt)
        
        var blueUInt: CUnsignedInt = 0
        Scanner(string: blueString).scanHexInt32(&blueUInt)
        
        
        return UIColor(red: CGFloat(redUInt) / 255.0, green: CGFloat(greenUInt) / 255.0, blue: CGFloat(blueUInt) / 255.0, alpha: CGFloat(1))
    }
}
