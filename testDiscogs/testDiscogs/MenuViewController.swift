//
//  MenuViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit
import SnapKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(index : Int32)
}

class MenuViewController: UIViewController {
    
    /**
    *  Array to display menu options
    */
    var tblMenuOptions : UITableView!
    
    /**
    *  Transparent button to hide menu
    */
    var btnCloseMenuOverlay : UIButton!
    
   
    /**
    *  Array containing menu options
    */
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    /**
    *  Menu button which was tapped to display the menu
    */
    var btnMenu : UIButton!
    
    /**
    *  Delegate of the MenuVC
    */
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblMenuOptions = UITableView()
        tblMenuOptions.delegate = self
        tblMenuOptions.dataSource = self
        tblMenuOptions.registerClass(MenuTableViewCell.self, forCellReuseIdentifier: "cellMenu")
       // tblMenuOptions.frame = CGRectMake(0, 0 , view.bounds.width, view.bounds.height)
        tblMenuOptions.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tblMenuOptions)
        tblMenuOptions.tableFooterView = UIView()
        
        btnCloseMenuOverlay = UIButton(type: .Custom) as UIButton
        btnCloseMenuOverlay.setTitle("Menu", forState: .Normal)
        btnCloseMenuOverlay.titleLabel?.font = UIFont.HelTextFont(14)
        btnCloseMenuOverlay.backgroundColor = UIColor.buttonColor()
        btnCloseMenuOverlay.addTarget(self, action: #selector(MenuViewController.onCloseMenuClick(_:)), forControlEvents: .TouchUpInside)
       // btnCloseMenuOverlay.frame = CGRectMake(0, 0 , view.bounds.width, 20)
        btnCloseMenuOverlay.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btnCloseMenuOverlay)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        NSLayoutConstraint(item: btnCloseMenuOverlay,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: topLayoutGuide,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 5).active = true
        
        btnCloseMenuOverlay.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(view).offset(0)
            make.height.equalTo(30)
            make.left.equalTo(view) }
        
        tblMenuOptions.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(btnCloseMenuOverlay.snp_bottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
            make.left.equalTo(view).offset(0) } 
        
          }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"Search", "icon":"Search-44"])
        arrayMenuOptions.append(["title":"User", "icon":"User"])
        arrayMenuOptions.append(["title":"Collection", "icon":"Collection"])
        arrayMenuOptions.append(["title":"Wantlist", "icon":"Wantlist"])
        tblMenuOptions.reloadData()
    }
    
     func onCloseMenuClick(button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.frame = CGRectMake(-UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clearColor()
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        })
    }
}
extension MenuViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : MenuTableViewCell = (tableView.dequeueReusableCellWithIdentifier("cellMenu") as? MenuTableViewCell)!
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clearColor()
        
        cell.imgIcon.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        cell.lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
    
        return cell
    }    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

extension MenuViewController: UITableViewDelegate {
    
}


