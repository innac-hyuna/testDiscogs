//
//  CollectionFolderViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/27/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit

class CollectionFolderViewController: BaseViewController {
    
    var tableView: UITableView!
    var cellInd: String!
    var fData: [CollectionFolder]!
    var listVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellInd = "cellFolder"
        addSlideMenuButton()
        loadData("\(getUrlStr())")
        listVC = UITableView()
        listVC?.registerClass(CollectionTableViewCell.self, forCellReuseIdentifier: cellInd)
        listVC.delegate = self
        listVC.dataSource = self
        listVC.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listVC)
        setupLayoutSwipeableView()        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupLayoutSwipeableView() {
        
        NSLayoutConstraint(item: listVC,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: topLayoutGuide,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: listVC,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Width,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: listVC,
                           attribute: NSLayoutAttribute.Bottom,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
    }
    
    func loadData(urlStr: String) {
        
        DataManager.sharedManager.getData(urlStr, controller: self) { (ListF) in
            self.fData =  ListF as! [CollectionFolder]
            self.listVC.reloadData()
           
        }
    }
    
    func getUrlStr() -> String {
        return "https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/collection/folders"
    }
}


extension CollectionFolderViewController: UITableViewDelegate {
    func  tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}

extension CollectionFolderViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CollectionTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellInd, forIndexPath: indexPath) as! CollectionTableViewCell
        
        if fData != nil {
          cell.titleLabel.text = fData[indexPath.row].name
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
 
        let nexController = CollectionViewController()
        if fData != nil {
            nexController.idFolder = fData[indexPath.row].id}
        navigationController?.pushViewController(nexController, animated: true)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return fData?.count ?? 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
