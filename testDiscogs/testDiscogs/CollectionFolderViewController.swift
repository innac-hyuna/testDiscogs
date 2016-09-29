//
//  CollectionFolderViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/27/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import PKHUD
import SnapKit

class CollectionFolderViewController: BaseViewController {
    
    var tableView: UITableView!
    var cellInd: String!
    var fData: [CollectionFolder]!
    var listVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CollectionFolder"
        cellInd = "cellFolder"
       
        loadData("\(getUrlStr())")
        listVC = UITableView()
        listVC.backgroundColor = UIColor.bgColor()
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
        
        listVC.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0) }
      
    }
    
    func loadData(urlStr: String) {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()

        DataManager.sharedManager.getData(urlStr, controller: control.CollectionFolderViewController) { [unowned self] (ListF) in
            self.fData =  ListF as! [CollectionFolder]
            if (self.fData.count != 0) {
                self.listVC.reloadData() }
            PKHUD.sharedHUD.hide(afterDelay: 1.0)
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
