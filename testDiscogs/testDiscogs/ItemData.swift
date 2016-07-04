//
//  ItemData.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/13/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation

class ItemData {
    var thumb: String!
    var title: String!
    var uri: String!
    var resourceUrl: String!
    var type: String!
    var id: Int!
    var style: [String]!
    var format: [String]!
    var country: String!
    var barcode:[String]!
    var community: [String: Int]!
    var label: [String]!
    var catno: String!
    var year: Int!
    var genre: [String]!

    
    init() {
        thumb = ""
        title = ""
        uri = ""
        resourceUrl = ""
        type = ""
        id = 0
        style = []
        format = []
        country = ""
        barcode = []
        community = [:]
        label = []
        catno = ""
        year = 0
        genre = []
    }
}
