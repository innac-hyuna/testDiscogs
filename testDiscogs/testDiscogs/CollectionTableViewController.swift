//
//  CollectionTableViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/23/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import Kingfisher


class CollectionTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var cellInd: String!
    var dataSource: [CollectionData]!
    var pageIndex = 0
    var folderId = 0
    var buttonDataSource: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        dataSource = [CollectionData]()
        cellInd = "CellCollection"
        tableView = UITableView()
        tableView.backgroundColor = UIColor.bgColor()
        tableView?.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 1))
        tableView?.registerClass(CollectionTableViewCell.self, forCellReuseIdentifier: cellInd)
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
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.height.equalTo(view).offset(0) }
    }
    
    func deleteWantliast(sender: UIButton) {
       
        let refreshAlert = UIAlertController(title: "Delete", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { [unowned self] (action: UIAlertAction!) in
            let urlStr = "https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/collection/folders/\(self.folderId)/releases/\(self.dataSource[sender.tag].id)/instances/\(self.dataSource[sender.tag].instanceId)?token=\(constApp.token)"
            DataManager.sharedManager.delData(urlStr)
            self.dataSource.removeAtIndex(sender.tag)
            self.tableView.reloadData()
        }))
     
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            self.tableView.reloadData()
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    
    func updateWantliast(index: Int, raiting: Int) {
        let refreshAlert = UIAlertController(title: "Save", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            self.dataSource[index].rating = raiting
            let urlStr = "https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/collection/folders/\(self.folderId)/releases/\(self.dataSource[index].id)/instances/\(self.dataSource[index].instanceId)?token=\(constApp.token)"
            let param: NSDictionary = [
                "release_id": self.dataSource[index].id,
                "rating_id": self.dataSource[index].rating,
                "instance_id": self.dataSource[index].rating,
                "rating": raiting]
            
            DataManager.sharedManager.updateData(urlStr, parameters: param )
             self.tableView.reloadData()  }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) in
            self.tableView.reloadData()
            print("Handle Cancel Logic here")  }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
    }   
}

extension CollectionTableViewController: UITableViewDelegate {
    func  tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
}

extension CollectionTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CollectionTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellInd, forIndexPath: indexPath) as! CollectionTableViewCell
        
            cell.titleLabel.text = "\(dataSource[indexPath.row].nameArtists) \(dataSource[indexPath.row].title) \(dataSource[indexPath.row].catno)"
            
            if let URL = NSURL(string: dataSource[indexPath.row].thumb) {
                let resource = Resource(downloadURL: URL, cacheKey: "\(dataSource[indexPath.row].thumb)")
            cell.thumbImg.kf_setImageWithResource(resource, placeholderImage: UIImage(named:"placeholder")) }
            cell.deleteButton.tag = indexPath.row
            cell.deleteButton.addTarget(self, action: #selector(WantlistTableViewController.deleteWantliast(_:)), forControlEvents: .TouchUpInside)
            cell.year.text = String(dataSource[indexPath.row].year)
            cell.textFormat.text = "\(dataSource[indexPath.row].textFormat) \(dataSource[indexPath.row].descriptionsFormat)"
            cell.floatRatingView.rating = Float(dataSource[indexPath.row].rating)
            cell.floatRatingView.delegate = self
            cell.floatRatingView.tag = indexPath.row
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count ?? 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {        

    }
    
}

extension CollectionTableViewController: FloatRatingViewDelegate {
    
    func floatRatingView(ratingView: FloatRatingView, isUpdating rating: Float) {
        
    }
    
    func floatRatingView(ratingView: FloatRatingView, didUpdate rating: Float) {
        updateWantliast(ratingView.tag, raiting: Int(rating) )
    }
}

