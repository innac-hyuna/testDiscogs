//
//  ViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/13/16.
//  Copyright © 2016 courses. All rights reserved.


import UIKit
import SMSwipeableTabView
import MBProgressHUD

class SearchViewController: BaseViewController {
    
    var userName = ""
    var progressHUD: MBProgressHUD!
    var searchData: ListData!
    var seachBar: UISearchBar!
    var swipeableView: SMSwipeableTabViewController!
    var listVC: SMSimpleListViewController!
    var searchQ = ""
    var searchActive = false
    var activePage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSlideMenuButton()
        seachBar = UISearchBar()
        seachBar.delegate = self
        seachBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seachBar)
        searchData = ListData()
        setupLayoutSeachBar()
    
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLayoutSeachBar() {
        
        NSLayoutConstraint(item: seachBar,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: topLayoutGuide,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: seachBar,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Width,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: seachBar,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 44).active = true }
    
    func setupLayoutSwipeableView() {
        
        NSLayoutConstraint(item: swipeableView.view,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: seachBar,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 10).active = true
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
    
    func loadData(urlStr: String) {
        print("loadData")
        progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progressHUD.labelText = "Loading..."
        DataManager.sharedManager.getData(urlStr, controller: control.SearchViewController) {  (listData) in
            self.searchData = listData as! ListData
            
            if self.searchActive {
                self.reloadSwipeableTabView()}
                self.reloadPage()
                self.activePage = self.listVC.view.tag
                print(self.searchData.page)
                MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
            
        }
    }
    
    func reloadPage() {
        
            listVC.dSource = searchData.itemsData as? [ItemData]
            listVC.title = String(listVC.dSource?.count)
            listVC.mainTableView.reloadData()
       
    }
    
    func reloadSwipeableTabView() {        
        
        swipeableView?.removeFromParentViewController()
        swipeableView?.view.removeFromSuperview()
        
        swipeableView?.delegate = nil
        
        swipeableView = SMSwipeableTabMyViewController()
       
        swipeableView.titleBarDataSource = Array(1 ... searchData.pages).map { iElement -> String in
            NSNumberFormatter.localizedStringFromNumber(iElement, numberStyle: .DecimalStyle) }
        
        swipeableView.segmentBarAttributes = [SMBackgroundColorAttribute: UIColor.buttonColor()]
        
        swipeableView.delegate = self
        
        addChildViewController(swipeableView)
        view.addSubview(swipeableView.view)
        swipeableView.view.translatesAutoresizingMaskIntoConstraints = false
        swipeableView.didMoveToParentViewController(self)
        
        setupLayoutSwipeableView()
        
    }
    
    func getUrlStr(searchText: String) -> String {
        return "https://api.discogs.com/database/search?q=\(searchText)&token=\(constApp.token)"
    }
    
}

extension SearchViewController: SMSwipeableTabViewControllerDelegate {
    
    func didLoadViewControllerAtIndex(index: Int) -> UIViewController {
        
        listVC = SMSimpleListViewController()
        loadData("\(getUrlStr(searchQ))&page=\(index+1)")
        searchActive = false
        return listVC
    }

}

extension SearchViewController: UISearchBarDelegate {
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchQ = searchBar.text!.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
        loadData(getUrlStr(searchQ))
        searchActive = true
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
}
