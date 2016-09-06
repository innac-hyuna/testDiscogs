//
//  AlbumViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/15/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumViewController: UIViewController {
    
    var albumData: ItemData!
    var thumbImage: UIImageView!
    var titleLabel: UILabel!
    var styleLabel: UILabel!
    var formatLabel: UILabel!
    var countryLabel: UILabel!
    var labelLabel: UILabel!
    var yearLabel: UILabel!
    var genreLabel: UILabel!
    var navigationBar: UINavigationBar!
    var addCollectionButton: UIButton!
    var addWishlistButton: UIButton!
    var topBar: UILayoutSupport!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBar = self.topLayoutGuide
        
        thumbImage = UIImageView()
        
        if let URL = NSURL(string: albumData.thumb) {
            let resource = Resource(downloadURL: URL, cacheKey: albumData.thumb)
            thumbImage.kf_setImageWithResource(resource, placeholderImage: UIImage(named:"placeholder")) }
        
        thumbImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(thumbImage)
        
        addWishlistButton = UIButton(type: .Custom) as UIButton
        addWishlistButton.setImage(UIImage(named: "addToCollection"), forState: .Normal)
        addWishlistButton.setImage(UIImage(named: "pressAddToCol"), forState: .Selected)
        addWishlistButton.backgroundColor = UIColor.buttonColor()
        addWishlistButton.layer.cornerRadius = 3
        addWishlistButton.addTarget(self, action: #selector(AlbumViewController.addWishlistAction(_:)), forControlEvents: .TouchUpInside)
        addWishlistButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addWishlistButton)
        
        addCollectionButton = UIButton(type: .Custom) as UIButton
        addCollectionButton.setImage(UIImage(named: "addToFavor"), forState: .Normal)
        addCollectionButton.setImage(UIImage(named: "pressAddToFa"), forState: .Selected)
        addCollectionButton.backgroundColor = UIColor.buttonColor()
        addCollectionButton.layer.cornerRadius = 3
        addCollectionButton.addTarget(self, action: #selector(AlbumViewController.addCollectionAction(_:)), forControlEvents: .TouchUpInside)
        addCollectionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addCollectionButton)
        
        titleLabel =  UILabel()
        titleLabel.text = albumData.title
        titleLabel.textColor = UIColor.titleColor()
        titleLabel.font = UIFont.HelTextFont(18)
        titleLabel.textAlignment = .Center
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .ByTruncatingTail
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        styleLabel =  UILabel()
        styleLabel.text = "Style: \(albumData.style.joinWithSeparator(", "))"
        styleLabel.textColor = UIColor.textColor()
        styleLabel.font = UIFont.HelTextFont(12)
        styleLabel.numberOfLines = 2
        styleLabel.lineBreakMode = .ByTruncatingTail
        styleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(styleLabel)
        
        formatLabel =  UILabel()
        formatLabel.text = "Format: \(albumData.format.joinWithSeparator(", "))"
        formatLabel.textColor = UIColor.textColor()
        formatLabel.font = UIFont.HelTextFont(12)
        formatLabel.numberOfLines = 2
        formatLabel.lineBreakMode = .ByTruncatingTail
        formatLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formatLabel)
        
        countryLabel =  UILabel()
        countryLabel.text = "Country: \(albumData.country)"
        countryLabel.textColor = UIColor.textColor()
        countryLabel.font = UIFont.HelTextFont(12)
        countryLabel.numberOfLines = 2
        countryLabel.lineBreakMode = .ByTruncatingTail
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countryLabel)
        
        labelLabel =  UILabel()
        labelLabel.text = "Label: \(albumData.label.joinWithSeparator(", "))"
        labelLabel.textColor = UIColor.textColor()
        labelLabel.font = UIFont.HelTextFont(12)
        labelLabel.numberOfLines = 2
        labelLabel.lineBreakMode = .ByTruncatingTail
        labelLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelLabel)
        
        yearLabel =  UILabel()
        yearLabel.text = "Year\(albumData.year)"
        yearLabel.textColor = UIColor.textColor()
        yearLabel.font = UIFont.HelTextFont(12)
        yearLabel.numberOfLines = 2
        yearLabel.lineBreakMode = .ByTruncatingTail
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLabel)
        
        genreLabel =  UILabel()
        genreLabel.text = "Genre: \(albumData.genre.joinWithSeparator(", "))"
        genreLabel.textColor = UIColor.textColor()
        genreLabel.font = UIFont.HelTextFont(12)
        genreLabel.numberOfLines = 2
        genreLabel.lineBreakMode = .ByTruncatingTail
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genreLabel)
        
        setupLayout()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        setupLayout()
    }
    
    func addWishlistAction(sender: UIButton) {
        
        let param = [
            "username": "innablack" ]
        
        DataManager.sharedManager.updateData("https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/wants/\(albumData.id)", parameters: param )
    }
    
    func addCollectionAction(sender: UIButton) {
        
        let param = [
            "username": "innablack" ,
            "folder_id": "1",
            "release_id": String(albumData.id)]
        
        DataManager.sharedManager.updateData("https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/collection/folders/1/releases/\(albumData.id)", parameters: param )
    }
    
    func setupLayout()  {
        
        NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: topBar,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 20).active = true
        
        if UIDevice.currentDevice().orientation.isPortrait.boolValue  {
            compactLayout()
        } else {
            regularLayout()
        }
    }
    
    func compactLayout() {
        
        thumbImage.snp_remakeConstraints { (make) -> Void in
            make.centerX.equalTo(view).offset(0)
            make.width.equalTo(150)
            make.height.equalTo(150) }
        
        titleLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(thumbImage.snp_bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10) }
        
        labelLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp_bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.width.equalTo(view).offset(-10) }
        
        formatLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(labelLabel.snp_bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.width.equalTo(view).offset(-10) }
        
        countryLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(formatLabel.snp_bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.width.equalTo(view).offset(-10) }
        
        genreLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(countryLabel.snp_bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.width.equalTo(view).offset(-10) }
        
        styleLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(genreLabel.snp_bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.width.equalTo(view).offset(-10) }
        
        yearLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(styleLabel.snp_bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.width.equalTo(view).offset(-10) }
        
        addCollectionButton.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(yearLabel.snp_bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.width.equalTo(44)
            make.height.equalTo(44) }
        
        addWishlistButton.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(yearLabel.snp_bottom).offset(10)
            make.left.equalTo(addCollectionButton.snp_right).offset(10)
            make.width.equalTo(44)
            make.height.equalTo(44) }
    }
    
    func regularLayout() {
        
        thumbImage.snp_remakeConstraints { (make) -> Void in
            make.leading.equalTo(view).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(150) }
        
        titleLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(60)
            make.leading.equalTo(thumbImage.snp_trailing).offset(10)
            make.trailing.equalTo(view).offset(-10) }
        
        labelLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp_bottom).offset(10)
            make.leading.equalTo(thumbImage.snp_trailing).offset(10)
            make.width.equalTo(view).offset(-160) }
        
        formatLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(labelLabel.snp_bottom).offset(10)
            make.leading.equalTo(thumbImage.snp_trailing).offset(10)
            make.width.equalTo(view).offset(-160) }
        
        countryLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(formatLabel.snp_bottom).offset(10)
            make.leading.equalTo(thumbImage.snp_trailing).offset(10)
            make.width.equalTo(view).offset(-160) }
        
        genreLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(countryLabel.snp_bottom).offset(10)
            make.leading.equalTo(thumbImage.snp_trailing).offset(10)
            make.width.equalTo(view).offset(-160) }
        
        styleLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(genreLabel.snp_bottom).offset(10)
            make.leading.equalTo(thumbImage.snp_trailing).offset(10)
            make.width.equalTo(view).offset(-160) }
        
        yearLabel.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(styleLabel.snp_bottom).offset(10)
            make.leading.equalTo(thumbImage.snp_trailing).offset(10)
            make.width.equalTo(view).offset(-160) }
        
        addCollectionButton.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(yearLabel.snp_bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.width.equalTo(44)
            make.height.equalTo(44) }
        
        addWishlistButton.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(yearLabel.snp_bottom).offset(10)
            make.left.equalTo(addCollectionButton.snp_right).offset(10)
            make.width.equalTo(44)
            make.height.equalTo(44) }
        
    }    
}