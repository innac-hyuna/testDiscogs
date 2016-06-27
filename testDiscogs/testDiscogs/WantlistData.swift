//
//  WantListData.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/22/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation

class WantlistData: ItemData {
    var rating: Int!
    var name: String!
    var descriptionsFormat: String!
    var textFormat: String!
    var nameFormat: String!
    var nameLabel: String!
    var qtyFormat: String!
    var nameArtists: String!
   
 
    override init() {
        super.init()
       rating = 0
       name = ""
       resourceUrl = ""
       descriptionsFormat = ""
       textFormat = ""
       nameFormat = ""
       qtyFormat  = ""
       nameArtists = ""
    }
     
}