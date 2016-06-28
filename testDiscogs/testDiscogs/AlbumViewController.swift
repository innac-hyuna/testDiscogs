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
    var uriLabel: UILabel!
    var typeLabel: UILabel!
    var idLabel: UILabel!
    var styleLabel: UILabel!
    var formatLabel: UILabel!
    var countryLabel: UILabel!
    var barcodeLabel: UILabel!
    var communityLabel: UILabel!
    var labelLabel: UILabel!
    var catnoLabel: UILabel!
    var yearLabel: UILabel!
    var genreLabel: UILabel!
    var navigationBar: UINavigationBar!
    var compactConstraint: [NSLayoutConstraint] = []
    var regularConstraint: [NSLayoutConstraint] = []
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
        
        
        titleLabel =  UILabel()
        titleLabel.text = albumData.title
        titleLabel.textColor = UIColor.titleColor()
        titleLabel.font = UIFont.HelTextFont(18)
        titleLabel.textAlignment = .Center
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .ByTruncatingTail
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        uriLabel =  UILabel()
        uriLabel.textColor = UIColor.textColor()
        uriLabel.font = UIFont.HelTextFont(12)
        uriLabel.numberOfLines = 2
        uriLabel.lineBreakMode = .ByTruncatingTail
        uriLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uriLabel)
        
        typeLabel =  UILabel()
        typeLabel.text = albumData.type
        typeLabel.textColor = UIColor.textColor()
        typeLabel.font = UIFont.HelTextFont(12)
        typeLabel.numberOfLines = 2
        typeLabel.lineBreakMode = .ByTruncatingTail
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(typeLabel)
        
        idLabel =  UILabel()
        idLabel.text = String(albumData.id)
        idLabel.textColor = UIColor.textColor()
        idLabel.font = UIFont.HelTextFont(12)
        idLabel.numberOfLines = 2
        idLabel.lineBreakMode = .ByTruncatingTail
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(idLabel)
        
        styleLabel =  UILabel()
        styleLabel.text = "Style: \(albumData.style.joinWithSeparator(", "))"
        styleLabel.textColor = UIColor.textColor()
        styleLabel.font = UIFont.HelTextFont(12)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .ByTruncatingTail
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
        
        barcodeLabel =  UILabel()
        barcodeLabel.text = albumData.barcode.joinWithSeparator(", ")
        barcodeLabel.textColor = UIColor.textColor()
        barcodeLabel.font = UIFont.HelTextFont(12)
        barcodeLabel.numberOfLines = 2
        barcodeLabel.lineBreakMode = .ByTruncatingTail
        barcodeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(barcodeLabel)
        
        communityLabel =  UILabel()
        let strCommunity = albumData.community.description
        communityLabel.text = strCommunity
        communityLabel.textColor = UIColor.textColor()
        communityLabel.font = UIFont.HelTextFont(12)
        communityLabel.numberOfLines = 2
        communityLabel.lineBreakMode = .ByTruncatingTail
        communityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(communityLabel)
        
        labelLabel =  UILabel()
        labelLabel.text = "Label: \(albumData.label.joinWithSeparator(", "))"
        labelLabel.textColor = UIColor.textColor()
        labelLabel.font = UIFont.HelTextFont(12)
        labelLabel.numberOfLines = 2
        labelLabel.lineBreakMode = .ByTruncatingTail
        labelLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelLabel)
        
        catnoLabel =  UILabel()
        catnoLabel.text = albumData.catno
        catnoLabel.textColor = UIColor.textColor()
        catnoLabel.font = UIFont.HelTextFont(12)
        catnoLabel.numberOfLines = 2
        catnoLabel.lineBreakMode = .ByTruncatingTail
        catnoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(catnoLabel)
        
        yearLabel =  UILabel()
        yearLabel.text = albumData.year
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
        
        createLayout()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        setupLayout()
    }
    
    func setupLayout()  {
        if UIDevice.currentDevice().orientation.isPortrait.boolValue  {
            NSLayoutConstraint.deactivateConstraints(regularConstraint)
            NSLayoutConstraint.activateConstraints(compactConstraint)
        } else {
            NSLayoutConstraint.deactivateConstraints(compactConstraint)
            NSLayoutConstraint.activateConstraints(regularConstraint) }
    }
 
    
    func createLayout() {

      //Compact
        compactConstraint.append(NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: topBar,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0))
        compactConstraint.append(NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 150))
        compactConstraint.append(NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 150))
        
        compactConstraint.append(NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: thumbImage,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 30))
        compactConstraint.append(NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 10))
        
        compactConstraint.append(NSLayoutConstraint(
            item: labelLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: titleLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: labelLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: labelLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0))
        
        compactConstraint.append(NSLayoutConstraint(
            item: formatLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: labelLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: formatLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: formatLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0))
        
        compactConstraint.append(NSLayoutConstraint(
            item: countryLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: formatLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: countryLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: countryLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0))
        
        compactConstraint.append(NSLayoutConstraint(
            item: genreLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: countryLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: genreLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: genreLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0))
        
        compactConstraint.append(NSLayoutConstraint(
            item: styleLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: genreLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: styleLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: styleLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0))
        
        compactConstraint.append(NSLayoutConstraint(
            item: yearLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: styleLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: yearLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 10))
        compactConstraint.append(NSLayoutConstraint(
            item: yearLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0))
        
        //Regular
        
        regularConstraint.append(NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: topBar,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 150))
        regularConstraint.append(NSLayoutConstraint(
            item: thumbImage,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 150))
        
        regularConstraint.append(NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: topBar,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 30))
        regularConstraint.append(NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: thumbImage,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: -150))
        
        regularConstraint.append(NSLayoutConstraint(
            item: labelLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: titleLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: labelLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: thumbImage,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: labelLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: -160))
        
        regularConstraint.append(NSLayoutConstraint(
            item: formatLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: labelLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: formatLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: thumbImage,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: formatLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: -160))
        
        regularConstraint.append(NSLayoutConstraint(
            item: countryLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: formatLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: countryLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: thumbImage,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: countryLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: -160))
        
        regularConstraint.append(NSLayoutConstraint(
            item: genreLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: countryLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: genreLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: thumbImage,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: genreLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: -160))
        
        regularConstraint.append(NSLayoutConstraint(
            item: styleLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: genreLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: styleLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: thumbImage,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: styleLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: -160))
        
        regularConstraint.append(NSLayoutConstraint(
            item: yearLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: styleLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: yearLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: thumbImage,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 10))
        regularConstraint.append(NSLayoutConstraint(
            item: yearLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: -160))
        
        setupLayout()

    }
    
    
}
