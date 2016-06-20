//
//  ItemTableViewCell.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/14/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
   
    var thumbImg: UIImageView!
    var titLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.buttonColor()
        titLabel = UILabel()
        titLabel.textColor = UIColor.textColor()
        titLabel.font =  UIFont.HelTextFont(10)
        titLabel.numberOfLines = 2
        titLabel.textAlignment = .Center
        contentView.addSubview(titLabel)
        titLabel.translatesAutoresizingMaskIntoConstraints = false

        thumbImg = UIImageView()
        contentView.addSubview(thumbImg)
        thumbImg.contentMode = UIViewContentMode.ScaleAspectFit
        thumbImg.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupLayout () {
        
        NSLayoutConstraint(item: thumbImg,
                           attribute: NSLayoutAttribute.TopMargin,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.TopMargin,
                           multiplier: 1.0,
                           constant: 10).active = true
        NSLayoutConstraint(item: thumbImg,
                           attribute: NSLayoutAttribute.CenterX,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.CenterX,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: thumbImg,
                           attribute: NSLayoutAttribute.BottomMargin,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.BottomMargin,
                           multiplier: 1.0,
                           constant: -30 ).active = true
        
        NSLayoutConstraint(item: titLabel,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: thumbImg,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 5).active = true
        NSLayoutConstraint(item: titLabel,
                           attribute: NSLayoutAttribute.CenterX,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.CenterX,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: titLabel,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 80).active = true
        
    }

}
