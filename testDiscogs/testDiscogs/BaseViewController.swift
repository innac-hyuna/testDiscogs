//
//  BaseViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, SlideMenuDelegate, SlideSearchDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func slideMenuItemSelectedAtIndex(index: Int32) {
      
        switch(index){
        case 0:
            self.openViewControllerBasedOnIdentifier(SearchViewController())
            break
        case 1:
            self.openViewControllerBasedOnIdentifier(UserViewController())
            break
        case 2:
            self.openViewControllerBasedOnIdentifier(CollectionFolderViewController())
            break
        case 3:
            self.openViewControllerBasedOnIdentifier(WantlistViewController())
            break
        default:
            print("default\n", terminator: "")
        }
    }
    
    func slideSearchQuery(dicText: NSDictionary) {
        
    }
    
    func openViewControllerBasedOnIdentifier(strIdentifier: BaseViewController){
        let destViewController : UIViewController = strIdentifier
        self.navigationController!.pushViewController(destViewController, animated: true)
   
    }
    
    func addSlideMenuButton(){
        let btnShowMenu = UIButton(type: UIButtonType.Custom) as UIButton
        btnShowMenu.setImage(UIImage.menuImage(), forState: UIControlState.Normal)
        btnShowMenu.frame = CGRectMake(0, 0, 30, 30)
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    func addSlideSearchButton(){
        let btnShowMenu = UIButton(type: UIButtonType.Custom) as UIButton
        btnShowMenu.setImage(UIImage.addSearchButton(), forState: UIControlState.Normal)
        btnShowMenu.frame = CGRectMake(0, 0, 30, 30)
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideSearchButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.rightBarButtonItem = customBarItem;
    }

    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 22), false, 0.0)
        
        UIColor.blackColor().setFill()
        UIBezierPath(rect: CGRectMake(0, 3, 30, 1)).fill()
        UIBezierPath(rect: CGRectMake(0, 10, 30, 1)).fill()
        UIBezierPath(rect: CGRectMake(0, 17, 30, 1)).fill()
        
        UIColor.whiteColor().setFill()
        UIBezierPath(rect: CGRectMake(0, 4, 30, 1)).fill()
        UIBezierPath(rect: CGRectMake(0, 11,  30, 1)).fill()
        UIBezierPath(rect: CGRectMake(0, 18, 30, 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
       
        return defaultMenuImage;
    }
    
    func onSlideMenuButtonPressed(sender : UIButton){
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.mainScreen().bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clearColor()
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.enabled = false
        sender.tag = 10
        let menuVC : MenuViewController = MenuViewController() 
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()        
        
        menuVC.view.frame=CGRectMake(0 - UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height);
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            menuVC.view.frame=CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height);
            sender.enabled = true
            }, completion:nil)
    }
    
    func onSlideSearchButtonPressed(sender : UIButton){
        if (sender.tag == 10)
        {
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x =  UIScreen.mainScreen().bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clearColor()
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.enabled = false
        sender.tag = 10
        
        let searchVC : FullSearchViewController = FullSearchViewController()
        searchVC.btnSearch = sender
        searchVC.delegate = self
        self.view.addSubview(searchVC.view)
        self.addChildViewController(searchVC)
        searchVC.view.layoutIfNeeded()
        
        
        searchVC.view.frame=CGRectMake(UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height);
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            searchVC.view.frame=CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height);
            sender.enabled = true
            }, completion:nil)
    }

}
