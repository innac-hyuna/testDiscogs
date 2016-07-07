//
//  SearchParamManager.swift
//  testDiscogs
//
//  Created by FE Team TV on 7/7/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation


class SearchParamManager {
    static let sharedManager = SearchParamManager()
    var userDef = NSUserDefaults.standardUserDefaults()
    var  dicParam = ["type",
                     "title",
                     "release_title",
                     "credit",
                     "artist",
                     "anv",
                     "label",
                     "genre",
                     "style",
                     "country",
                     "year",
                     "format",
                     "catno",
                     "barcode",
                     "track",
                     "submitter",
                     "contributor"]    
    
    func setParametr(dic: [(String, String)]) {
        for (key, value) in dic {
             userDef.setValue(value, forKey: key )
        }
    }
    
    func getParametr(key: String) -> String {
        if let strDt = userDef.stringForKey(key) {
            return strDt
        } else {
            return ""
        }
    }
    
    func getAllParametr() -> NSDictionary {
         return userDef.dictionaryWithValuesForKeys(dicParam)
    }
    
    func delParametrSearch(key: String){
         userDef.removeObjectForKey(key)
    }

}