//
//  DataViewController.swift
//  SwipableViews
//
//  Created by Sahil Mahajan on 21/12/15.
//  Copyright © 2015 Sahil Mahajan. All rights reserved.
//

import UIKit
import SnapKit
import Nuke
import Preheat


public class SMSimpleListViewController: UIViewController {

    var dSource: [ItemData]?
    var pageIndex = 0
    var buttonDataSource: [String]?
    var cellInd = "Cell"
    var preheatController: PreheatController<UICollectionView>!
    
    @IBOutlet var mainTableView: UICollectionView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100,height: 100)
        mainTableView = UICollectionView(frame: UIScreen.mainScreen().bounds, collectionViewLayout: flowLayout)
        mainTableView.delegate = self
        mainTableView.dataSource = self

        preheatController = PreheatController(view: mainTableView!)
        preheatController.handler = { [weak self] in
            self?.preheatWindowChanged(addedIndexPaths: $0, removedIndexPaths: $1)
        }
        mainTableView?.registerClass(ItemCollectionViewCell.self, forCellWithReuseIdentifier: cellInd)
        mainTableView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainTableView)
        setupLayout()
    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        preheatController.enabled = true
    }
    
    override public func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        preheatController.enabled = false
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateItemSize()
    }
    
    func updateItemSize() {
    
        let layout = mainTableView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 2.0
        let itemsPerRow = 4
        let side = (Double(view.bounds.size.width) - Double(itemsPerRow - 1) * 2.0) / Double(itemsPerRow)
        layout.itemSize = CGSize(width: side, height: side)
    }
    
    func setupLayout() {
        
         mainTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.leading.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0) }
    }
    
    func imageRequestWithURL(URL: NSURL) -> ImageRequest {
        func imageTargetSize() -> CGSize {
            let size = (mainTableView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
            let scale = UIScreen.mainScreen().scale
            return CGSize(width: size.width * scale, height: size.height * scale)
        }
        return ImageRequest(URL: URL, targetSize: imageTargetSize(), contentMode: .AspectFill)
    }
    
    func preheatWindowChanged(addedIndexPaths addedIndexPaths: [NSIndexPath], removedIndexPaths: [NSIndexPath]) {
        func requestForIndexPaths(indexPaths: [NSIndexPath]) -> [ImageRequest] {
            return indexPaths.map {
                        imageRequestWithURL(NSURL(string: dSource![$0.row].thumb)!)
                }
        }
        Nuke.startPreheatingImages(requestForIndexPaths(addedIndexPaths))
        Nuke.stopPreheatingImages(requestForIndexPaths(removedIndexPaths))
        logAddedIndexPaths(addedIndexPaths, removedIndexPaths: removedIndexPaths)
    }
    
    func logAddedIndexPaths(addedIndexPath: [NSIndexPath], removedIndexPaths: [NSIndexPath]) {
        func stringForIndexPaths(indexPaths: [NSIndexPath]) -> String {
            guard indexPaths.count > 0 else {
                return "[]"
            }
            let items = indexPaths.map{ return "\($0.item)" }.joinWithSeparator(" ")
            return "[\(items)]"
        }
       // print("did change preheat rect with added indexes \(stringForIndexPaths(addedIndexPath)), removed indexes \(stringForIndexPaths(removedIndexPaths))")
    }
}

extension SMSimpleListViewController: UICollectionViewDelegate {
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dSource?.count ?? 0
    }
    
   public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell: ItemCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellInd, forIndexPath: indexPath) as! ItemCollectionViewCell
    
    if let data = dSource {
        cell.titLabel.text = data[indexPath.row].title
     
        let imageURL = data[indexPath.row].thumb
        if let urla = NSURL(string:imageURL) {
            cell.thumbImg.nk_setImageWith(imageRequestWithURL(urla))}
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

extension SMSimpleListViewController: UICollectionViewDataSource {

}


   


