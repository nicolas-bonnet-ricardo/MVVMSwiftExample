//
//  BuySucessViewController.swift
//  Autoricardo
//
//  Created by Nicolas Bonnet on 5/9/17.
//  Copyright © 2017 Ricardo.ch. All rights reserved.
//

import Foundation
import UIKit

fileprivate extension Selector
{
    static let leave = #selector(BuySucessViewController.leaveAction(sender:))
}

struct Step {
    var index: Int
    var title: String
    var crossed: Bool
}

class BuySucessViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, Decoratable
{
//    weak var delegate: IRCHBuySuccessViewControllerDelegate!
    
    var totalPrice: NSNumber!
    
    @IBOutlet weak var leaveButton: UIButton!
    @IBOutlet weak var successImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleCompactView: ArticleCompactView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var viewModel: BuySucessViewModel!
    
    override public func viewDidLoad()
    {
        viewModel = BuySucessViewModel.init(article: Article(image: "car", title: "An amazing car", price: 120000))
        
        leaveButton.addTarget(self, action: .leave, for: .touchUpInside)
        
        setupUI()
    }
    
    func setupUI()
    {
        successImageView.tintColor = Colors.success.value
        titleLabel.textColor = Colors.success.value
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let nib = UINib(nibName: "SuccessAfterPurchaseStepCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SuccessAfterPurchaseStepCellIdentifier")
        
        tableViewHeightConstraint.constant = CGFloat(viewModel.stepList.count * 36)
        
        articleCompactView.setup(with: ArticleCompactType.price,
                                 article: viewModel.article!)
    }
    
    func updateUI()
    {
        
    }
    
    override public func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
    }
    
    override public func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
    }
    
    public override func viewWillAppear(_ animated: Bool)
    {
        // track screen
        //AutoricardoUtils.googleAnalyticsTrack(screen: GoogleAnalytics.Screen.login)
    }
    
    
    // MARK:- Button Actions
    
    func leaveAction(sender: UIButton)
    {
        self.dismiss(animated: true) {
            
        }
    }
    
    
    // MARK:- TableView Data Source
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModel.stepList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 36.0;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // FIXME:- Refactor when we move the Product Detail page to use the Networkable
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuccessAfterPurchaseStepCellIdentifier", for: indexPath) as! SuccessAfterPurchaseStepCell
        let step = viewModel.stepList[indexPath.row] as! Step
        cell.setup(with: step.index, title: step.title, crossed: step.crossed)
        
        return cell
    }
    
    
    
    
}
