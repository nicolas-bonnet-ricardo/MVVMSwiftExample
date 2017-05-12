//
//  SuccessAfterPurchaseStepCell.swift
//  Autoricardo
//
//  Created by Nicolas Bonnet on 5/9/17.
//  Copyright © 2017 Ricardo.ch. All rights reserved.
//

import Foundation
import UIKit

class SuccessAfterPurchaseStepCell: UITableViewCell
{
    @IBOutlet weak var stepNumberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var crossedLine: UIView!
    
    var crossed: Bool = false
    {
        didSet {
            updateCell()
        }
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override public func awakeFromNib()
    {
        super.awakeFromNib()
        crossedLine.backgroundColor = Colors.textSecondary.value
        updateCell()
    }
    
    public func setup(with index:Int, title:String, crossed:Bool)
    {
        stepNumberLabel.layer.borderWidth = 1
        stepNumberLabel.layer.cornerRadius = stepNumberLabel.frame.width / 2

        stepNumberLabel.text = String(index)
        titleLabel.text = title
        
        self.crossed = crossed
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCell()
    {
        if(crossed)
        {
            crossedLine.isHidden = false
            stepNumberLabel.textColor = Colors.textSecondary.value
            stepNumberLabel.layer.borderColor = Colors.textSecondary.value.cgColor
            titleLabel.textColor = Colors.textSecondary.value
        }
        else
        {
            crossedLine.isHidden = true
            stepNumberLabel.textColor = Colors.success.value
            stepNumberLabel.layer.borderColor = Colors.success.value.cgColor
            titleLabel.textColor = Colors.textPrimary.value
        }
    }
}
