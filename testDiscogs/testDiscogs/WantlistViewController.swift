//
//  WantlistViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/22/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import SMSwipeableTabView
import MBProgressHUD

class WantlistViewController: BaseViewController {
    
    var tableView: UITableView!
    var cellInd: String!
    var progressHUD: MBProgressHUD!
    var wData: ListData!
    var swipeableView: SMSwipeableTabMyViewController!
    var listVC: WantlistTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        loadData("\(getUrlStr())", lodFirst: true)
        title = "Wantlist"
       
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
        
        swipeableView.view.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0) }        

    }
    
    func loadData(urlStr: String, lodFirst: Bool) {
        
        progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progressHUD.labelText = "Loading..."
        DataManager.sharedManager.getData(urlStr, controller: control.WantlistViewController) { (ListD) in
            
            self.wData =  ListD as! ListData
            if lodFirst {
                self.reloadSwipeableTabView()}
            self.reloadPage()
            MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
        }
    }
    
    func reloadPage() {
        listVC.dataSource = wData.itemsData as? [WantlistData]
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
        return "https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/wants"
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        
        swipeableView?.loadTab()
        
    }
}

extension WantlistViewController: SMSwipeableTabViewControllerDelegate {
    
    func didLoadViewControllerAtIndex(index: Int) -> UIViewController {
        listVC = WantlistTableViewController()
        loadData("\(getUrlStr())?per_page=50&page=\(index+1)", lodFirst: false)
        return listVC
    }
}


