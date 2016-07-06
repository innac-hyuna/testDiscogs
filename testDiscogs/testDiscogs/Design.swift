//
//  Design.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/14/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        var cString: String = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            self.init(white: 0.5, alpha: 1.0)
        } else {
            let rString: String = (cString as NSString).substringToIndex(2)
            let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
            let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
            
            var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0;
            NSScanner(string: rString).scanHexInt(&r)
            NSScanner(string: gString).scanHexInt(&g)
            NSScanner(string: bString).scanHexInt(&b)
            
            self.init(red: CGFloat(r) / CGFloat(255.0), green: CGFloat(g) / CGFloat(255.0), blue: CGFloat(b) / CGFloat(255.0), alpha: CGFloat(1))
        }
    }
    static func bgColor() -> UIColor {
        return UIColor(hexString: "#8f8f8d")
    }
    static func buttonColor() -> UIColor {
        return  UIColor(hexString: "#34495e")
    }
    static func tabBarColor() -> UIColor {
        return UIColor(hexString: "#34495e")
    }
    
    static func borderFildColor() -> UIColor {
        return UIColor(hexString: "#7a7a7a")
    }
    
    static func textColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    static func titleColor() -> UIColor {
        return UIColor.brownColor()
    }
}

extension UIFont {
    static func HelTextFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "HelveticaNeue", size: size)!
    }
    static func HelTextFontBold(size: CGFloat) -> UIFont {
        return UIFont.init(name: "HelveticaNeue-Bold", size: size)!
    }
}

extension UIImage {
    
    static func bgIconImage() -> UIImage {
        return UIImage(named: "bg")!
    }
    
    static func menuImage() -> UIImage {
        return UIImage(named: "Collection")!
    }
    
    static func raitingImage(full: String) -> UIImage {
       if full == "full" {
        return UIImage(named: "StarFull")!
       } else {
        return UIImage(named: "StarEmpty")!
        }
    }
    
    static func addWishButton() -> UIImage {
       return UIImage(named: "Wantlist")!
    }
    
    static func addCollecButton() -> UIImage {
        return UIImage(named: "Collection")!
    }
    
    static func addSearchButton() -> UIImage {
        return UIImage(named: "FullSearch")!
    }

}

extension UIView {
    func setStyle() {
        self.backgroundColor = UIColor.buttonColor()
        self.layer.borderColor = UIColor.borderFildColor().CGColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
}

extension UITextField {
     func setMyStyle() {
        self.backgroundColor = UIColor.buttonColor()
        self.layer.borderColor = UIColor.borderFildColor().CGColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }

}
