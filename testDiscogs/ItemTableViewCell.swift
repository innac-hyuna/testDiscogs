//
//  ItemTableViewCell.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/14/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
   
    var thumbImg: UIImage!
    var titLabel: UILabel!
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        titLabel = UILabel()
        titLabel.textColor = UIColor.textColor()
        titLabel.font =  UIFont.HelTextFont(16)
        contentView.addSubview(titLabel)
        titLabel.translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel = UILabel()
        typeLabel.textColor = UIColor.textColor()
        typeLabel.font =  UIFont.HelTextFont(16)
        contentView.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
     
        
        setupLayout()
    }
    
    func setupLayout () {
        
        NSLayoutConstraint(item: titLabel,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Top,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: titLabel,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 20).active = true
        
        NSLayoutConstraint(item: typeLabel,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: titLabel,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: typeLabel,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: contentView,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 20).active = true
    }

}
