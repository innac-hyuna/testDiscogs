//
//  MenuTableViewCell.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/20/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    var lblTitle: UILabel!
    var imgIcon: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        lblTitle = UILabel()
        lblTitle.font =  UIFont.HelTextFont(14)
        contentView.addSubview(lblTitle)
         lblTitle.translatesAutoresizingMaskIntoConstraints = false
        
        imgIcon = UIImageView()
        contentView.addSubview(imgIcon)
        imgIcon.contentMode = UIViewContentMode.ScaleAspectFit
        imgIcon.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setupLayout() {
        

        NSLayoutConstraint(item: imgIcon,
                           attribute: NSLayoutAttribute.CenterY,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.CenterY,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: imgIcon,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 10 ).active = true
        NSLayoutConstraint(item: imgIcon,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 80).active = true
        
        NSLayoutConstraint(item: lblTitle,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: imgIcon,
                           attribute: NSLayoutAttribute.Trailing,
                           multiplier: 1.0,
                           constant: 5).active = true
        NSLayoutConstraint(item: lblTitle,
                           attribute: NSLayoutAttribute.CenterY,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.CenterY,
                           multiplier: 1.0,
                           constant: 0).active = true

 
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
