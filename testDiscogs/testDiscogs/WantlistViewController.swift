//
//  WantlistViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/22/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import SMSwipeableTabView
import PKHUD

class WantlistViewController: BaseViewController {
    
    var tableView: UITableView!
    var cellInd: String!
    var wData: ListData!
    var swipeableView: SMSwipeableTabMyViewController!
    var listVC: WantlistTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonLeft() 
        loadData("\(getUrlStr())", lodFirst: true)
        title = "Wantlist"
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupLayoutSwipeableView() {
       
        swipeableView.view.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0) }        

    }
    
    func loadData(urlStr: String, lodFirst: Bool) {
        
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        DataManager.sharedManager.getData(urlStr, controller: control.WantlistViewController) { [unowned self] (ListD) in
            
            self.wData =  ListD as! ListData
            if lodFirst {
                self.reloadSwipeableTabView()}
            self.reloadPage()
            PKHUD.sharedHUD.hide(afterDelay: 1.0)
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


