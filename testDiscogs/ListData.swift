//
//  SearchListData.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/13/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation
import SwiftyJSON
import MBProgressHUD

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
    var itemsData: [ItemData]!
    
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
        itemsData = [ItemData]()
    }
   
    
    func getList(urlStr: String, controller: SearchViewController) {
        
        let progressHUD = MBProgressHUD.showHUDAddedTo(controller.view, animated: true)
        progressHUD.labelText = "Loading..."

        let url = NSURL(string: urlStr)
        print(urlStr)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url!) { [unowned self] (data, response, error) -> Void in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
                return
            }
            if let httpResponse = response as? NSHTTPURLResponse {// where httpResponse.statusCode == 200 {
                if httpResponse.statusCode == 200 {
                    let parsedData = self.getDataFromJson(data!)
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        NSNotificationCenter.defaultCenter().postNotificationName(constNotification.Search, object: parsedData, userInfo: nil)
                        MBProgressHUD.hideAllHUDsForView(controller.view, animated: true)
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func getDataFromJson(data: NSData) -> ListData {
        
        let json = JSON(data: data)
        let list = ListData()     
     
        if let urlStr = json["pagination"]["urlStr"].string {
            list.urlStr = urlStr }
        if let perpage = json["pagination"]["perpage"].int {
            list.perpage = perpage }
        if let pages = json["pagination"]["pages"].int {
            list.pages = pages}
        if let page = json["pagination"]["page"].int {
            list.page = page}
        if let urlprev = json["pagination"]["urls"]["prev"].string {
            list.urlprev = urlprev}
        if let urlnext = json["pagination"]["urls"]["next"].string {
            list.urlnext = urlnext}
        if let urllast = json["pagination"]["urls"]["last"].string {
            list.urllast = urllast}
        if let urlfirst = json["pagination"]["urls"]["first"].string {
            list.urlfirst = urlfirst}
        if let items = json["pagination"]["items"].int {
            list.items = items}
        if let itemArr = json["results"].array {
            var iDataArr = [ItemData]()
            for item in itemArr {
                let iData = ItemData()
                iData.id = item["id"].int
                iData.resourceUrl = item["resourceUrl"].string
                iData.thumb = item["thumb"].string
                iData.title = item["title"].string
                iData.type = item["type"].string
                iData.uri = item["uri"].string
                iData.country = item["country"].string
                iData.catno = item["catno"].string
                iData.year = item["year"].string
                if let iStyle = item["style"].arrayObject {
                  iData.style = iStyle as! [String] }
                if let iFormat = item["format"].arrayObject {
                    iData.format = iFormat as! [String] }
                if let iBarcode = item["barcode"].arrayObject {
                    iData.barcode = iBarcode as! [String] }
                if let iCommunity = item["community"].dictionaryObject {
                    iData.community = iCommunity as! [String: Int] }
                if let iLabel = item["label"].arrayObject {
                    iData.label = iLabel as! [String] }
                if let iGenre = item["genre"].arrayObject {
                    iData.genre = iGenre as! [String] }
                
                iDataArr.append(iData)
            }
             list.itemsData = iDataArr
        }        
        return list

        
    }

}
