//
//  AlbumViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/15/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import Kingfisher
import Cartography

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
    var addWantlistButton: UIButton!
    var topBar: UILayoutSupport!
    var isLandscape = false
    var group: ConstraintGroup!
    var group1: ConstraintGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thumbImage = UIImageView()
        if let URL = NSURL(string: albumData.thumb) {
            let resource = Resource(downloadURL: URL, cacheKey: albumData.thumb)
            thumbImage.kf_setImageWithResource(resource, placeholderImage: UIImage(named:"placeholder")) }
        view.addSubview(thumbImage)
        isLandscape = UIDevice.currentDevice().orientation.isLandscape.boolValue
        
        addWantlistButton = UIButton(type: .Custom) as UIButton
        addWantlistButton.setImage(UIImage(named: "addToCollection"), forState: .Normal)
        addWantlistButton.setImage(UIImage(named: "pressAddToCol"), forState: .Selected)
        addWantlistButton.backgroundColor = UIColor.buttonColor()
        addWantlistButton.layer.cornerRadius = 3
        addWantlistButton.tag = 1
        addWantlistButton.addTarget(self, action: #selector(AlbumViewController.addAction(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(addWantlistButton)
     
        addCollectionButton = UIButton(type: .Custom) as UIButton
        addCollectionButton.setImage(UIImage(named: "addToFavor"), forState: .Normal)
        addCollectionButton.setImage(UIImage(named: "pressAddToFa"), forState: .Selected)
        addCollectionButton.backgroundColor = UIColor.buttonColor()
        addCollectionButton.layer.cornerRadius = 3
        addCollectionButton.tag = 2
        addCollectionButton.addTarget(self, action: #selector(AlbumViewController.addAction(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(addCollectionButton)
        
        titleLabel =  UILabel()
        titleLabel.text = albumData.title
        titleLabel.textColor = UIColor.titleColor()
        titleLabel.font = UIFont.HelTextFont(18)
        titleLabel.textAlignment = .Center
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .ByTruncatingTail
        view.addSubview(titleLabel)
        
        styleLabel =  UILabel()
        styleLabel.text = "Style: \(albumData.style.joinWithSeparator(", "))"
        styleLabel.textColor = UIColor.textColor()
        styleLabel.font = UIFont.HelTextFont(12)
        styleLabel.numberOfLines = 2
        styleLabel.lineBreakMode = .ByTruncatingTail
        view.addSubview(styleLabel)
        
        formatLabel =  UILabel()
        formatLabel.text = "Format: \(albumData.format.joinWithSeparator(", "))"
        formatLabel.textColor = UIColor.textColor()
        formatLabel.font = UIFont.HelTextFont(12)
        formatLabel.numberOfLines = 2
        formatLabel.lineBreakMode = .ByTruncatingTail
        view.addSubview(formatLabel)
        
        countryLabel =  UILabel()
        countryLabel.text = "Country: \(albumData.country)"
        countryLabel.textColor = UIColor.textColor()
        countryLabel.font = UIFont.HelTextFont(12)
        countryLabel.numberOfLines = 2
        countryLabel.lineBreakMode = .ByTruncatingTail
        view.addSubview(countryLabel)
        
        labelLabel =  UILabel()
        labelLabel.text = "Label: \(albumData.label.joinWithSeparator(", "))"
        labelLabel.textColor = UIColor.textColor()
        labelLabel.font = UIFont.HelTextFont(12)
        labelLabel.numberOfLines = 2
        labelLabel.lineBreakMode = .ByTruncatingTail
        view.addSubview(labelLabel)
        
        yearLabel =  UILabel()
        yearLabel.text = "Year\(albumData.year)"
        yearLabel.textColor = UIColor.textColor()
        yearLabel.font = UIFont.HelTextFont(12)
        yearLabel.numberOfLines = 2
        yearLabel.lineBreakMode = .ByTruncatingTail
        view.addSubview(yearLabel)
        
        genreLabel =  UILabel()
        genreLabel.text = "Genre: \(albumData.genre.joinWithSeparator(", "))"
        genreLabel.textColor = UIColor.textColor()
        genreLabel.font = UIFont.HelTextFont(12)
        genreLabel.numberOfLines = 2
        genreLabel.lineBreakMode = .ByTruncatingTail
        view.addSubview(genreLabel)
        setupLayout()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        isLandscape = UIDevice.currentDevice().orientation.isLandscape.boolValue
        reloadLayout()
    }
    
    func addAction(sender: UIButton) {
    
        if sender.tag == 2  {
            let param = [ "username" : FileManagerSourse.sharedManager.getUserName(),
                          "release_id" : albumData.id]
            
            DataManager.sharedManager.updateDataPut("https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/wants/\(albumData.id)?token=\(constApp.token)", parameters: param )
        } else {
            let param = [
                "username": FileManagerSourse.sharedManager.getUserName(),
                "folder_id": 1,
                "release_id": albumData.id]
            
            DataManager.sharedManager.updateData("https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())/collection/folders/1/releases/\(albumData.id)?token=\(constApp.token)", parameters: param ) }
    }

    func setupLayout()  {
        
        constrain(thumbImage, addWantlistButton, addCollectionButton) {
            thumbImage, addWantlistButton, addCollectionButton in
            thumbImage.top == thumbImage.superview!.top + 65
            thumbImage.left == thumbImage.superview!.left + 10
            thumbImage.width == 150
            thumbImage.height == 150
            addWantlistButton.top ==  addWantlistButton.superview!.top + 65
            addWantlistButton.left == thumbImage.right + 10
            addWantlistButton.width == 44
            addWantlistButton.height == 44
            addCollectionButton.top == addCollectionButton.superview!.top + 65
            addCollectionButton.left == addWantlistButton.right + 10
            addCollectionButton.width == 44
            addCollectionButton.height == 44
        }
        
        group = ConstraintGroup()
        group1 = ConstraintGroup()
        reloadLayout()
    }
    
    func reloadLayout() {
        
        constrain(thumbImage, titleLabel, labelLabel, formatLabel, replace:  group) {
            thumbImage, titleLabel, labelLabel, formatLabel in
            
            labelLabel.top == titleLabel.bottom + 10
            if isLandscape {
                titleLabel.top == titleLabel.superview!.top + 135
                titleLabel.left == thumbImage.right + 10
            } else {
                titleLabel.top == thumbImage.bottom + 10
                titleLabel.left == titleLabel.superview!.left + 10 }
            
            titleLabel.width == titleLabel.superview!.width - (isLandscape ? 185 : 20)
            labelLabel.left == labelLabel.superview!.left + (isLandscape ? 170 : 10)
            labelLabel.width == labelLabel.superview!.width - (isLandscape ? 160 : 20)
            formatLabel.top == labelLabel.bottom + 10
        }
        
        constrain(formatLabel, countryLabel, genreLabel, styleLabel, yearLabel, replace:  group1) {
            formatLabel, countryLabel, genreLabel, styleLabel, yearLabel in
          
            formatLabel.left == formatLabel.superview!.left + (isLandscape ? 170 : 10)
            formatLabel.width == formatLabel.superview!.width - (isLandscape ? 185 : 20)
            countryLabel.top == formatLabel.bottom + 10
            countryLabel.left == countryLabel.superview!.left + (isLandscape ? 164 : 10)
            countryLabel.width == countryLabel.superview!.width - (isLandscape ? 185 : 20)
            genreLabel.top == countryLabel.bottom + 10
            genreLabel.left == genreLabel.superview!.left +  (isLandscape ? 170 : 10)
            genreLabel.width == genreLabel.superview!.width - (isLandscape ? 185 : 20)
            styleLabel.top == genreLabel.bottom + 10
            styleLabel.left == styleLabel.superview!.left +  (isLandscape ? 170 : 10)
            styleLabel.width == styleLabel.superview!.width - (isLandscape ? 185 : 20)
            yearLabel.top == styleLabel.bottom + 10
            yearLabel.left == yearLabel.superview!.left +  (isLandscape ? 170 : 10)
            yearLabel.width == yearLabel.superview!.width - (isLandscape ? 185 : 20)
        }

    }
    
 }
