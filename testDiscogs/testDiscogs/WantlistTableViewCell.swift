//
//  SimpleTableViewCell.swift
//  testAlbom
//
//  Created by FE Team TV on 5/31/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit

class WantlistTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var thumbImg: UIImageView!
    var rating: UILabel!
    var year: UILabel!
    var textFormat: UILabel!
    var deleteButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.backgroundColor = UIColor.bgColor()
    
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .ByTruncatingTail
        titleLabel.textColor = UIColor.textColor()
        titleLabel.font =  UIFont.HelTextFont(16)
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        thumbImg = UIImageView()
        contentView.addSubview(thumbImg)
        thumbImg.contentMode = UIViewContentMode.ScaleAspectFit
        thumbImg.translatesAutoresizingMaskIntoConstraints = false
    
        rating = UILabel()
        rating.textColor = UIColor.textColor()
        rating.font =  UIFont.HelTextFont(16)
        contentView.addSubview(rating)
        rating.translatesAutoresizingMaskIntoConstraints = false
    
        year = UILabel()
        year.textColor = UIColor.textColor()
        year.font =  UIFont.HelTextFont(16)
        contentView.addSubview(year)
        year.translatesAutoresizingMaskIntoConstraints = false
    
        textFormat = UILabel()
        textFormat.textColor = UIColor.textColor()
        textFormat.font =  UIFont.HelTextFont(16)
        contentView.addSubview(textFormat)
        textFormat.translatesAutoresizingMaskIntoConstraints = false
    
        deleteButton = UIButton(type: .Custom) as UIButton
        deleteButton.frame = CGRect(x: 0,y: 0,width: 60,height: 60)
        deleteButton.setImage(UIImage(named:"Delete"), forState: .Normal)

        contentView.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
    
        setupLayout()
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func setupLayout () {

        NSLayoutConstraint(item: thumbImg,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: thumbImg,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 50).active = true
        NSLayoutConstraint(item: thumbImg,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 50).active = true
       
        NSLayoutConstraint(item: titleLabel,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: thumbImg,
                           attribute: NSLayoutAttribute.Trailing,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: titleLabel,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 40).active = true
        NSLayoutConstraint(item: titleLabel,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Width,
                           multiplier: 1.0,
                           constant: -70).active = true
        
        NSLayoutConstraint(item: textFormat,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: thumbImg,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: textFormat,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: textFormat,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 40).active = true
        

        NSLayoutConstraint(item: year,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: titleLabel,
                           attribute: NSLayoutAttribute.Trailing,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: year,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: titleLabel,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: year,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 40).active = true
        

        NSLayoutConstraint(item: rating,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: rating,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: year,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: rating,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 20).active = true
        
        NSLayoutConstraint(item: deleteButton,
                           attribute: NSLayoutAttribute.Trailing,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Trailing,
                           multiplier: 1.0,
                           constant: -10).active = true
        NSLayoutConstraint(item: deleteButton,
                           attribute: NSLayoutAttribute.CenterY,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.CenterY,
                           multiplier: 1.0,
                           constant: 0).active = true


        
    }

}