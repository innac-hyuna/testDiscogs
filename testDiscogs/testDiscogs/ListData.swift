//
//  ListData.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/16/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation

class ListData {
    var urlStr: String!
    var perpage: Int!
    var pages: Int!
    var page: Int!
    var urllast: String!
    var urlprev: String!
    var urlfirst: String!
    var urlnext: String!
    var items: Int!
    var itemsData: [AnyObject]!
    
    init() {

        urlStr = ""
        perpage = 0
        pages = 0
        page = 0
        urllast = ""
        urlnext = ""
        urlfirst = ""
        urlprev = ""
        items = 0
        itemsData = [AnyObject]()
    }
}