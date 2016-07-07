//
//  CartViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/22/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import SMSwipeableTabView
import MBProgressHUD

class CollectionViewController: BaseViewController {

    
    var tableView: UITableView!
    var cellInd: String!
    var wData: ListData!
    var progressHUD: MBProgressHUD!
    var floatRatingView: FloatRatingView!
    var idFolder: Int!
    var swipeableView: SMSwipeableTabMyViewController!
    var listVC: CollectionTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSlideMenuButton()
        loadData("\(getUrlStr())", loadFirst: true)
        title = "Collection"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupLayoutSwipeableView() {
        
        NSLayoutConstraint(item: swipeableView.view,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: topLayoutGuide,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: swipeableView.view,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Width,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: swipeableView.view,
                           attribute: NSLayoutAttribute.Bottom,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
    }
    
    func loadData(urlStr: String, loadFirst: Bool) {
        progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progressHUD.labelText = "Loading..."
        DataManager.sharedManager.getData(urlStr, controller: control.CollectionViewController) { (ListD) in
            
            self.wData =  ListD as! ListData
            if loadFirst { self.reloadSwipeableTabView() }
            self.reloadPage()
            self.listVC.folderId  = self.idFolder
            MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
        }
    }   
    
    func reloadPage() {
        listVC.dataSource = (wData.itemsData as? [CollectionData])!
        listVC.tableView.reloadData()
    }
    
    func reloadSwipeableTabView() {
        
        swipeableView?.removeFromParentViewController()
        swipeableView?.view.removeFromSuperview()
        
        swipeableView?.delegate = nil
        
        swipeableView = SMSwipeableTabMyViewController()
        
        swipeableView.titleBarDataSource = Array(1 ... wData.pages).map { iElement -> String in
            NSNumberFormatter.localizedStringFromNumber(iElement, numberStyle: .DecimalStyle) }
        
        swipeableView.segmentBarAttributes = [SMBackgroundColorAttribute: UIColor.buttonColor()]
        
        swipeableView.delegate = self
        
        addChildViewController(swipeableView)
        view.addSubview(swipeableView.view)
        swipeableView.view.translatesAutoresizingMaskIntoConstraints = false
        swipeableView.didMoveToParentViewController(self)
        
        setupLayoutSwipeableView()
    }
    
    func getUrlStr() -> String {
        return "https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/collection/folders/\(idFolder)/releases"
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        
        swipeableView?.loadTab()
        
    }
}

extension CollectionViewController: SMSwipeableTabViewControllerDelegate {
    
    func didLoadViewControllerAtIndex(index: Int) -> UIViewController {
        listVC = CollectionTableViewController()
        loadData("\(getUrlStr())?per_page=50&page=\(index+1)", loadFirst: false)        
        return listVC
    }
}


