//
//  Article.swift
//  MVVMExample
//
//  Created by Nicolas Bonnet on 5/12/17.
//  Copyright © 2017 Nicolas Bonnet. All rights reserved.
//

import Foundation

struct Article
{
    var image: String
    var title: String
    var price: Double
    
    var priceInString: String {
        return String(format: "%.2f", price)
    }
}
