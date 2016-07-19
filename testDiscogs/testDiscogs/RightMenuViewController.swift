//
//  LeftMenuViewController.swift
//  AKSideMenuSimple
//
//  Created by Diogo Autilio on 6/7/16.
//  Copyright © 2016 AnyKey Entertainment. All rights reserved.
//

import UIKit

public class RightMenuViewController: UIViewController {
    
    var tableView: UITableView?
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let searchVC : FullSearchViewController = FullSearchViewController()
        view.addSubview(searchVC.view)
        addChildViewController(searchVC)
        searchVC.view.layoutIfNeeded()
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            searchVC.view.frame = CGRectMake(75, 20, UIScreen.mainScreen().bounds.size.width - 75, UIScreen.mainScreen().bounds.size.height - 20);
             }, completion:nil)
    }

}

