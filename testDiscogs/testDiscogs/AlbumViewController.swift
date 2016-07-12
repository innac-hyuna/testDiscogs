//
//  AlbumViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/15/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import Kingfisher
import Neon

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
    var viewAdd: UIView!
    var viewL: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewL = UIView()
        view.addSubview(viewL)
        
        thumbImage = UIImageView()
        if let URL = NSURL(string: albumData.thumb) {
            let resource = Resource(downloadURL: URL, cacheKey: albumData.thumb)
            thumbImage.kf_setImageWithResource(resource, placeholderImage: UIImage(named:"placeholder")) }
        viewL.addSubview(thumbImage)
        
        viewAdd = UIView()
        viewL.addSubview(viewAdd)
        
        addWishlistButton = UIButton(type: .Custom) as UIButton
        addWishlistButton.setImage(UIImage(named: "addToCollection"), forState: .Normal)
        addWishlistButton.setImage(UIImage(named: "pressAddToCol"), forState: .Selected)
        addWishlistButton.backgroundColor = UIColor.buttonColor()
        addWishlistButton.layer.cornerRadius = 3
        addWishlistButton.addTarget(self, action: #selector(AlbumViewController.addWishlistAction(_:)), forControlEvents: .TouchUpInside)
        viewAdd.addSubview(addWishlistButton)
     
        addCollectionButton = UIButton(type: .Custom) as UIButton
        addCollectionButton.setImage(UIImage(named: "addToFavor"), forState: .Normal)
        addCollectionButton.setImage(UIImage(named: "pressAddToFa"), forState: .Selected)
        addCollectionButton.backgroundColor = UIColor.buttonColor()
        addCollectionButton.layer.cornerRadius = 3
        addCollectionButton.addTarget(self, action: #selector(AlbumViewController.addCollectionAction(_:)), forControlEvents: .TouchUpInside)
        viewAdd.addSubview(addCollectionButton)
        
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
        
        let isLandscape : Bool = UIDevice.currentDevice().orientation.isLandscape.boolValue
        let avSize =  CGFloat(isLandscape ? 100 : 150)
        let paddingSize = CGFloat(isLandscape ? 30 : 60)
        let paddingySize = CGFloat(isLandscape ? -10 : 0)
        let padSize = CGFloat(10)
        let sizeButton = CGFloat(44)
        
        viewL.anchorAndFillEdge(.Top, xPad: padSize, yPad: padSize, otherSize: avSize + paddingSize)
        view.groupAndAlign(group: .Vertical, andAlign: .UnderCentered, views: [titleLabel, labelLabel, formatLabel, countryLabel, genreLabel, styleLabel, yearLabel], relativeTo: viewL, padding: 5, width: view.width - 20, height: 20)        
        viewL.groupInCorner(group: .Horizontal, views: [thumbImage, viewAdd], inCorner: .TopLeft, padding: 10, width: avSize, height: avSize)
        thumbImage.anchorInCorner(.TopLeft, xPad: padSize, yPad: paddingSize, width: avSize, height: avSize)
        viewAdd.groupAndFill(group: .Horizontal, views: [addCollectionButton, addWishlistButton], padding: 10)
        addCollectionButton.anchorInCorner(.TopLeft, xPad: padSize, yPad: paddingSize-5, width: sizeButton, height: sizeButton)
        addWishlistButton.anchorInCorner(.BottomLeft, xPad: padSize, yPad: paddingySize-5, width: sizeButton, height: sizeButton)
        
    }
    
 }
