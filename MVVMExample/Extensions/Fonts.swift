//
//  AutoricardoFonts.swift
//  Autoricardo
//
//  Created by Nicolas Bonnet on 5/2/17.
//  Copyright © 2017 Ricardo.ch. All rights reserved.
//

import Foundation
import UIKit

enum Fonts
{
    case body
    case button
    case buttonLarge
    case textField
}

extension Fonts {
    var value: UIFont {
        get {
            switch self {
            case .body:
                return UIFont.systemFont(ofSize: 16);
                
            case .button:
                return UIFont.systemFont(ofSize: 16);
                
            case .buttonLarge:
                return UIFont.systemFont(ofSize: 18);
                
            case .textField:
                return UIFont.systemFont(ofSize: 16);
            }
        }
    }
}
