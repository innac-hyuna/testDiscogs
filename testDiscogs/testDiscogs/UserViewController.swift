//
//  UserViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/21/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import Kingfisher

class UserViewController: BaseViewController {
    var avatarImg:  UIImageView!
    var nameLabel: UILabel!
    var profileLabel: UILabel!
    var locationLabel: UILabel!
    var uData : UserData!
    var indCell: String!

    override func viewDidLoad() {
        super.viewDidLoad()
         addSlideMenuButton()
        
        avatarImg = UIImageView()
        avatarImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarImg)
        
        nameLabel = UILabel()
        nameLabel.textColor = UIColor.titleColor()
        nameLabel.font = UIFont.HelTextFont(16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        profileLabel = UILabel()
        profileLabel.textColor = UIColor.textColor()
        profileLabel.font = UIFont.HelTextFont(16)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLabel)
        
        locationLabel = UILabel()
        locationLabel.textColor = UIColor.textColor()
        locationLabel.font = UIFont.HelTextFont(16)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationLabel)
        
        setupLayout()
       
        let userUrl = "https://api.discogs.com/users/\(FileManagerSourse.sharedManager.getUserName())"
      
        DataManager.sharedManager.getData(userUrl, controller: self) { (UserD) in
             self.uData =  UserD as! UserData
            self.reloadData()
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupLayout() {
        
        NSLayoutConstraint(item: avatarImg,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: topLayoutGuide,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: avatarImg,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 150).active = true
        NSLayoutConstraint(item: avatarImg,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 150).active = true
        NSLayoutConstraint(item: avatarImg,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 15).active = true
        
        NSLayoutConstraint(item: nameLabel,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: avatarImg,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: nameLabel,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 30).active = true
        NSLayoutConstraint(item: nameLabel,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 15).active = true
        
        NSLayoutConstraint(item: profileLabel,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: nameLabel,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: profileLabel,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 30).active = true
        NSLayoutConstraint(item: profileLabel,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 15).active = true
        
        
        NSLayoutConstraint(item: locationLabel,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: profileLabel,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: locationLabel,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 30).active = true
        NSLayoutConstraint(item: locationLabel,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy:  NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 15).active = true

    }
    
    func reloadData() {
        if let urlImage = NSURL(string: uData.avatarUrl) {
        let resource = Resource(downloadURL: urlImage, cacheKey: uData.avatarUrl)
            avatarImg.kf_setImageWithResource(resource, placeholderImage: UIImage(named:"placeholder"))}
        
        nameLabel.text = "Name: \(uData.username)"
        profileLabel.text = "Pofile: \(uData.profile)"
        locationLabel.text = "Location: \(uData.location)"
       
    }
}


