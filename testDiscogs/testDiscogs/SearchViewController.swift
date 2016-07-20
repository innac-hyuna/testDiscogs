//
//  ViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/13/16.
//  Copyright © 2016 courses. All rights reserved.


import UIKit
import SMSwipeableTabView
import MBProgressHUD
import SnapKit

class SearchViewController: BaseViewController {
    
    var userName = ""
    var progressHUD: MBProgressHUD!
    var searchData: ListData!
    var seachBar: UISearchBar!
    var swipeableView: SMSwipeableTabMyViewController!
    var listVC: SMSimpleListViewController!
    var searchQ = ""
    var searchActive = true
    var activePage = 0
    var fullSearchText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullSearchText = ""
        title = "Search"
        seachBar = UISearchBar()
        seachBar.delegate = self
        seachBar.text = SearchParamManager.sharedManager.getSearchText()
        loadData(getUrlStr())
        seachBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seachBar)
        searchData = ListData()
        setupLayoutSeachBar()
        setButtonsBar()
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLayoutSeachBar() {
        
       seachBar.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(snp_topLayoutGuideBottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.height.equalTo(35) }
    }
    
    func setupLayoutSwipeableView() {
        
        swipeableView.view.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(seachBar.snp_bottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.bottom.equalTo(view) }
    }
    
    func loadData(urlStr: String) {
        
        progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progressHUD.labelText = "Loading..."
        DataManager.sharedManager.getData(urlStr, controller: control.SearchViewController) { [unowned self] (listData) in
            
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
    
   func slideSearchQuery() {
        fullSearchText = ""
     let dic = SearchParamManager.sharedManager.getAllParametr()
        for (key, value) in dic {
            if (value as? NSString) != nil {
                fullSearchText.appendContentsOf( (value as! String) != ""  ? "&\(key)=\(value)" : "")}
        }
    }
    
    func getUrlStr() -> String {
      slideSearchQuery()
      let searchText = SearchParamManager.sharedManager.getSearchText()
      let sText = searchText.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
      let fSearchText = fullSearchText.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
      let jUrl = "https://api.discogs.com/database/search?q=\(sText!)\(fSearchText!)&token=\(constApp.token)"
      
      return jUrl
        
    }
   
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        
       swipeableView?.loadTab()
       
    }
}

extension SearchViewController: SMSwipeableTabViewControllerDelegate {
    
    func didLoadViewControllerAtIndex(index: Int) -> UIViewController {
        
        listVC = SMSimpleListViewController()
        loadData("\(getUrlStr())&page=\(index+1)")
        //SearchParamManager.sharedManager.saveSearchNumberPage(String(index+1 ))
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
        SearchParamManager.sharedManager.saveSearchtext(searchBar.text!)
        loadData(getUrlStr())
        searchActive = true
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
}
