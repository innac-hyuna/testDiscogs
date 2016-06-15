//
//  DataViewController.swift
//  SwipableViews
//
//  Created by Sahil Mahajan on 21/12/15.
//  Copyright © 2015 Sahil Mahajan. All rights reserved.
//

import UIKit

public class SMSimpleListViewController: UIViewController {

    var dataSource: [ItemData]?
    var pageIndex = 0
    var buttonDataSource: [String]?
    var cellInd = "Cell"
    
    @IBOutlet var mainTableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.registerClass(ItemTableViewCell.self, forCellReuseIdentifier: cellInd)
        self.view.addSubview(mainTableView)
        mainTableView?.reloadData()
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension SMSimpleListViewController: UITableViewDataSource  {
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ItemTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellInd , forIndexPath: indexPath) as! ItemTableViewCell
        
        if let data = dataSource {
            cell.titLabel.text = data[indexPath.row].title
            cell.typeLabel.text = data[indexPath.row].type
        }
        return cell 
    }
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}

extension SMSimpleListViewController: UITableViewDelegate  {
    
}
   


