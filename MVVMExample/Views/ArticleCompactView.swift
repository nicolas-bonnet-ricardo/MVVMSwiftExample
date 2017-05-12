//
//  ArticleCompactView.swift
//  Autoricardo
//
//  Created by Nicolas Bonnet on 5/9/17.
//  Copyright © 2017 Ricardo.ch. All rights reserved.
//

import UIKit

//import Kingfisher

enum ArticleCompactType
{
    case noPrice
    case price
    case pricePerUnit
}

@IBDesignable
public class ArticleCompactView : UIView {
    
    var view: UIView!
    
    var nibName: String = "ArticleCompactView"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceValueLabel: UILabel!
    @IBOutlet weak var priceTextLabel: UILabel!
    
    var type: ArticleCompactType = ArticleCompactType.noPrice
    {
        didSet {
            updateCellType()
        }
    }
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        linkToNib()
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        linkToNib()
    }
    
    func linkToNib()
    {
        self.view = UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil)[0] as! UIView
        
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(self.view)
    }
    
    func setup(with type:ArticleCompactType, article:Article)
    {
        self.type = type
        self.imageView.image = UIImage(named: "car")
        self.titleLabel.text = article.title
        self.priceValueLabel.text = article.priceInString
    }
    
    func updateCellType()
    {
        switch type {
        case .noPrice:
            priceTextLabel.isHidden = true
            priceValueLabel.isHidden = true
            
        case .price:
            priceTextLabel.isHidden = false
            priceValueLabel.isHidden = false
            priceTextLabel.text = "Price"
            
        case .pricePerUnit:
            priceTextLabel.isHidden = false
            priceValueLabel.isHidden = false
            priceTextLabel.text = "Price per unit"
            
        }
    }
    
}
