//
//  User.swift
//  testDiscogs
//
//  Created by FE Team TV on 8/2/16.
//  Copyright © 2016 courses. All rights reserved.
//

import RealmSwift
import ObjectMapper


class RListData: Object, Mappable {
    
    var id = RealmOptional<Int>()
    dynamic var title: String? = nil
    dynamic var autor: String? = nil
    dynamic var genre: String? = nil

    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        autor <- map["autor"]
        genre <- map["genre"]
    }
}
