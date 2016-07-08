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
        
        thumbImg.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentView).offset(10)
            make.centerX.equalTo(contentView).offset(0)
            make.bottom.equalTo(contentView).offset(-30)
            make.width.equalTo(70) }
        
        titLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(thumbImg.snp_bottom).offset(5)
            make.centerX.equalTo(contentView).offset(0)
            make.width.equalTo(80) }
        
           }

}
