//
//  BaseViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButtonLeft() {
        let btnShowMenu = UIButton(type: UIButtonType.Custom) as UIButton
        btnShowMenu.setImage(UIImage.menuImage(), forState: UIControlState.Normal)
        btnShowMenu.frame = CGRectMake(0, 0, 30, 30)
        btnShowMenu.addTarget(self, action: #selector(self.presentLeftMenuViewController(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem
    }
    
    func setButtonRight() {
        let btnShowSearch = UIButton(type: UIButtonType.Custom) as UIButton
        btnShowSearch.setImage(UIImage.addSearchButton(), forState: UIControlState.Normal)
        btnShowSearch.frame = CGRectMake(0, 0, 30, 30)
        btnShowSearch.addTarget(self, action: #selector(self.presentRightMenuViewController(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowSearch)
        self.navigationItem.rightBarButtonItem = customBarItem
    }
    
    func setButtonsBar() {
        setButtonLeft()
        setButtonRight()
    }
    
   
}
