//
//  RightMenuViewController.swift
//  AKSideMenuSimple
//
//  Created by Diogo Autilio on 6/7/16.
//  Copyright © 2016 AnyKey Entertainment. All rights reserved.
//

import UIKit

public class LeftMenuViewController: UIViewController {
    
    var tableView: UITableView?
    var titles:[String] = ["Search", "User",  "Collection", "Wantlist"]
    var images:[String] = ["Search-44", "User", "Collection", "Wantlist"]
    var rowHeight: CGFloat = 54
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        let tableView: UITableView = UITableView.init(frame: CGRectMake(0, (self.view.frame.size.height - rowHeight * CGFloat(titles.count)) / 2.0, self.view.frame.size.width, rowHeight *  CGFloat(titles.count)), style: UITableViewStyle.Plain)
        tableView.autoresizingMask = [UIViewAutoresizing.FlexibleTopMargin , UIViewAutoresizing.FlexibleBottomMargin , UIViewAutoresizing.FlexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.opaque = false
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = nil
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.bounces = false
        
        self.tableView = tableView
        self.view.addSubview(self.tableView!)
    }
}

extension LeftMenuViewController: UITableViewDelegate {

    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch (indexPath.row) {
            case 0:
                var topController: SearchViewController?
                let vBool = sideMenuViewController?.childViewControllers.filter({ vController -> Bool in
                    if  vController.classForCoder.description() == "UINavigationController" {
                        let vMain = (vController as? UINavigationController)!.topViewController
                        if vMain?.classForCoder.description().componentsSeparatedByString(".").last! == "SearchViewController" {
                            return true
                        } else {
                            return false}
                    }
                    return false })
                
                if (vBool?.count == 0) {
                    topController = SearchViewController()
                    self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: topController!), animated: true) }
                
                self.sideMenuViewController!.hideMenuViewController()
                break
            case 1:
                self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: UserViewController()), animated: true)
                self.sideMenuViewController!.hideMenuViewController()
                break
            case 2:
                self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: CollectionFolderViewController()), animated: true)
                self.sideMenuViewController!.hideMenuViewController()
                break
            case 3:
                self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: WantlistViewController()), animated: true)
                self.sideMenuViewController!.hideMenuViewController()
                break
        default:
            break
        }
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return titles.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier: String = "Cell"
    
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
    
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.font = UIFont.init(name: "HelveticaNeue", size: 21)
            cell!.textLabel?.textColor = UIColor.whiteColor()
            cell!.textLabel?.highlightedTextColor = UIColor.lightGrayColor()
            cell!.selectedBackgroundView = UIView.init()
        }

        cell!.textLabel?.text = titles[indexPath.row]
        cell!.textLabel?.textAlignment = NSTextAlignment.Left
        cell!.imageView?.image = UIImage.init(named: images[indexPath.row])
    
        return cell!
    }
   
}

extension LeftMenuViewController: UITableViewDataSource {
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return rowHeight
    }
}