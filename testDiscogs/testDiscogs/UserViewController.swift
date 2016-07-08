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
      
        DataManager.sharedManager.getData(userUrl, controller: control.UserViewController) { (UserD) in
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

        avatarImg.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(150)
            make.width.equalTo(150)
            make.leading.equalTo(view).offset(15) }
        
        nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(avatarImg.snp_bottom).offset(0)
            make.height.equalTo(30)
            make.leading.equalTo(view).offset(15) }
        
        profileLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameLabel.snp_bottom).offset(0)
            make.height.equalTo(30)
            make.leading.equalTo(view).offset(15) }
        
        profileLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(profileLabel.snp_bottom).offset(0)
            make.height.equalTo(30)
            make.leading.equalTo(view).offset(15) }
  
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


