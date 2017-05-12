//
//  BuySucessViewModel.swift
//  MVVMExample
//
//  Created by Nicolas Bonnet on 5/12/17.
//  Copyright © 2017 Nicolas Bonnet. All rights reserved.
//

import Foundation

struct BuySucessViewModel
{
    var stepList: NSArray
    var article: Article?
    
    init(article: Article)
    {
        stepList = [
            Step(index: 1, title: "Ricardo send an email to the seller", crossed:true),
            Step(index: 2, title: "The seller contact you", crossed:false),
            Step(index: 3, title: "You pay", crossed:false),
            Step(index: 4, title: "The seller send you the article", crossed:false)
        ]
        self.article = article
    }
}
