//
//  WantListData.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/22/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation

class WantlistData {
    var rating: Int!
    var name: String!
    var catno: String!
    var resourceUrl: String!
    var id: Int!
    var descriptionsFormat: String!
    var textFormat: String!
    var nameFormat: String!
    var nameLabel: String!
    var qtyFormat: String!
    var thumb: String!
    var nameArtists: String!
    var idArtists: Int!
    var year: Int!
    var title: String!
 
    init() {
       rating = 0
       name = ""
       catno = ""
       resourceUrl = ""
       id = 0
       descriptionsFormat = ""
       textFormat = ""
       nameFormat = ""
       qtyFormat  = ""
       thumb = ""
       nameLabel = ""
       nameArtists = ""
       idArtists = 0
       year = 0
       title = ""
    }
     
}