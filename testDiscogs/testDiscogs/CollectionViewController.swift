//
//  CartViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/22/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import SMSwipeableTabView
import PKHUD
import SnapKit

class CollectionViewController: BaseViewController {

    
    var tableView: UITableView!
    var cellInd: String!
    var wData: ListData!   
    var idFolder: Int!
    var swipeableView: SMSwipeableTabMyViewController!
    var listVC: CollectionTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonLeft() 
        loadData("\(getUrlStr())", loadFirst: true)
        print(getUrlStr())

        title = "Collection"
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
    
    func loadData(urlStr: String, loadFirst: Bool) {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
      
        
        DataManager.sharedManager.getData(urlStr, controller: control.CollectionViewController) { [unowned self] (ListD) in
            
            self.wData =  ListD as! ListData
            if loadFirst { self.reloadSwipeableTabView() }
            self.reloadPage()
            self.listVC.folderId  = self.idFolder
            PKHUD.sharedHUD.hide(afterDelay: 1.0)
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


