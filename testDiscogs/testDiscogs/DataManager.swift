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


class DataManager {
    static let sharedManager = DataManager()
    
    func getData(urlStr: String, controller: BaseViewController, callback: ((AnyObject) -> ())?) {
      
       
        let progressHUD = MBProgressHUD.showHUDAddedTo(controller.view, animated: true)
        progressHUD.labelText = "Loading..."
        
        let url = NSURL(string: urlStr)
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url!) { [unowned self] (data, response, error) -> Void in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? NSHTTPURLResponse {// where httpResponse.statusCode == 200 {
                
                 if httpResponse.statusCode == 200 {
                    let nameControler = NSStringFromClass(controller.classForCoder).componentsSeparatedByString(".").last!
                    var parsedData: AnyObject!
                    if nameControler == "SearchViewController" {
                        parsedData = self.getListDataFromJson(data!) as ListData
                    } else {
                        parsedData = self.getUserDataFromJson(data!) as UserData}
                    
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        callback?(parsedData)// UserData
                        
                        MBProgressHUD.hideAllHUDsForView(controller.view, animated: true)
                    }
                }
            }
        }
        
        task.resume()
    }
    
 private func getListDataFromJson(data: NSData) -> ListData {
        
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
                if let idi = item["id"].int {
                    iData.id = idi}
                if let resourceUrl = item["resourceUrl"].string {
                    iData.resourceUrl = resourceUrl }
                if let thumb = item["thumb"].string {
                    iData.thumb = thumb }
                if let title  = item["title"].string {
                    iData.title = title }
                if let type = item["type"].string {
                    iData.type = type   }
                if let uri = item["uri"].string {
                    iData.uri = uri }
                if let country = item["country"].string {
                    iData.country = country }
                if let catno =  item["catno"].string {
                    iData.catno = catno}
                if let year =  item["year"].string {
                    iData.year = year}
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

 private func getUserDataFromJson(data: NSData) -> UserData {
        let UData = UserData()
        let json = JSON(data: data)
        
        
        if let profile = json["profile"].string {
            UData.profile = profile
        }
        
        if let wantlistUrl = json["wantlist_url"].string {
            UData.wantlistUrl = wantlistUrl
        }
        
        if let rank = json["rank"].float {
            UData.rank = rank
        }
        
        if let numPending = json["num_pending"].string {
            UData.numPending = numPending
        }
        
        if let idi = json["id"].int {
            UData.id = idi
        }
        
        if let numForsale = json["num_for_sale"].string {
            UData.numForsale = numForsale
        }
        
        if let homePage = json["home_page"].string {
            UData.homePage = homePage
        }
       
        if let location = json["location"].string {
            UData.location = location
        }
      
        if let collectionFoldersUrl = json["collection_folders_url"].string {
            UData.collectionFoldersUrl = collectionFoldersUrl
        }
        
        if let username = json["username"].string {
            UData.username = username
        }
        
        if let collectionFieldsUrl = json["collection_fields_url"].string {
            UData.collectionFieldsUrl = collectionFieldsUrl
        }
        
        if let releasesContributed = json["releases_contributed"].int {
            UData.releasesContributed = releasesContributed
        }
        
        if let registered = json["registered"].string {
            UData.registered = registered
        }
        
        if let ratingAvg = json["rating_avg"].float {
            UData.ratingAvg = ratingAvg
        }
      
        if let numCollection = json["num_collection"].int {
            UData.numCollection = numCollection
        }
        
        if let releasesRated = json["releases_rated"].int {
            UData.releasesRated = releasesRated
        }
        
        if let numLists = json["num_lists"].int {
            UData.numLists = numLists
        }
        
        if let name = json["name"].string {
            UData.name = name
        }
        
        if let numWantlist = json["num_wantlist"].int {
            UData.numWantlist = numWantlist
        }
        
        if let inventoryUrl = json["inventory_url"].string {
            UData.inventoryUrl = inventoryUrl
        }

        if let uri = json["uri"].string {
            UData.uri = uri
        }
        
        if let avatarUrl = json["avatar_url"].string {
            UData.avatarUrl = avatarUrl
        }
        
        if let resourceUrl = json["resource_url"].string {
            UData.resourceUrl = resourceUrl
        }

        return UData
    }


}
