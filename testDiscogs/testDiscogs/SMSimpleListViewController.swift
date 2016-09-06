//
//  DataViewController.swift
//  SwipableViews
//
//  Created by Sahil Mahajan on 21/12/15.
//  Copyright © 2015 Sahil Mahajan. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

public class SMSimpleListViewController: UIViewController {
    
    var dSource: [ItemData]?
    var pageIndex = 0
    var buttonDataSource: [String]?
    var cellInd = "Cell"
    
    @IBOutlet var mainTableView: UICollectionView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100,height: 100)
        mainTableView = UICollectionView(frame: UIScreen.mainScreen().bounds, collectionViewLayout: flowLayout)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.registerClass(ItemCollectionViewCell.self, forCellWithReuseIdentifier: cellInd)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainTableView)
        setupLayout()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLayout() {
        
        mainTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.leading.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0) }
    }
    
}

extension SMSimpleListViewController: UICollectionViewDataSource  {
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dSource?.count ?? 0
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ItemCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellInd, forIndexPath: indexPath) as! ItemCollectionViewCell
        
        if let data = dSource {
            cell.titLabel.text = data[indexPath.row].title
            
            if let URL = NSURL(string: data[indexPath.row].thumb) {
                let resource = Resource(downloadURL: URL, cacheKey: data[indexPath.row].thumb)
                cell.thumbImg.kf_setImageWithResource(resource, placeholderImage: UIImage(named:"placeholder")) }
        }
        
        return cell
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let nexController = AlbumViewController()
        if let data = dSource {
            nexController.albumData = data[indexPath.row]}
        navigationController?.pushViewController(nexController, animated: true)
    }
}

extension SMSimpleListViewController: UICollectionViewDelegate {
    
    
}
