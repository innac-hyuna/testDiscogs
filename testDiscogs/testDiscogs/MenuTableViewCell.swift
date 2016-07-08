//
//  MenuTableViewCell.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/20/16.
//  Copyright © 2016 courses. All rights reserved.
//


import UIKit
import SnapKit

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
        
        imgIcon.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(contentView.snp_centerY).offset(0)
            make.width.equalTo(80)
            make.left.equalTo(contentView).offset(10) }
        
        lblTitle.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(contentView.snp_centerY).offset(0)
            make.left.equalTo(imgIcon.snp_right).offset(10) }
 
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
