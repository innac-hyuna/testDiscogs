//
//  WantlistViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/22/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import Kingfisher


class WantlistTableViewController: UIViewController {
   
    @IBOutlet var tableView: UITableView!
   
    var cellInd: String!
    var dataSource: [WantlistData]?
    var pageIndex = 0
    var buttonDataSource: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        cellInd = "CellWantlist"
               
        tableView = UITableView()
        tableView?.backgroundColor = UIColor.bgColor()
        tableView?.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 1))
        tableView?.registerClass(WantlistTableViewCell.self, forCellReuseIdentifier: cellInd)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        setupLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupLayout() {
        
        NSLayoutConstraint(item: tableView,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: topLayoutGuide,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: tableView,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Height,
                           multiplier: 1.0,
                           constant: 150).active = true
        NSLayoutConstraint(item: tableView,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Width,
                           multiplier: 1.0,
                           constant: 0).active = true
    
    }
    
    func deleteWantliast(sender: UIButton) {
        let refreshAlert = UIAlertController(title: "Delete", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            let urlStr = "https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/wants/\(sender.tag)"
            DataManager.sharedManager.delData(urlStr)
             }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
         presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    
   
}

extension WantlistTableViewController: UITableViewDelegate {
    
    func  tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
}

extension WantlistTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: WantlistTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellInd, forIndexPath: indexPath) as! WantlistTableViewCell
        
        if let data = dataSource {
            cell.titleLabel.text = "\(data[indexPath.row].nameArtists) \(data[indexPath.row].title)\(data[indexPath.row].catno)"
            if let URL = NSURL(string: data[indexPath.row].thumb) {
                let resource = Resource(downloadURL: URL, cacheKey: data[indexPath.row].thumb)
                cell.thumbImg.kf_setImageWithResource(resource, placeholderImage: UIImage(named:"placeholder")) }
             cell.deleteButton.tag = data[indexPath.row].id
             cell.deleteButton.addTarget(self, action: #selector(WantlistTableViewController.deleteWantliast(_:)), forControlEvents: .TouchUpInside)
             cell.year.text = String(data[indexPath.row].year)
             cell.textFormat.text = "\(data[indexPath.row].textFormat) \(data[indexPath.row].descriptionsFormat)"
             cell.floatRatingView.rating = Float(data[indexPath.row].rating)

        }
       
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}

