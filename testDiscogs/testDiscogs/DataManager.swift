//
//  SearchListData.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/13/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


enum control: String {
    case SearchViewController = "SearchViewController"
    case UserViewController = "UserViewController"
    case WantlistViewController = "WantlistViewController"
    case CollectionViewController =  "CollectionViewController"
    case CollectionFolderViewController = "CollectionFolderViewController"
}

class DataManager {
    static let sharedManager = DataManager()
    
    func getData(urlStr: String, controller: control , callback: ((AnyObject) -> ())?) {
        
        Alamofire.request(.GET, urlStr, parameters: ["": ""])
            .validate()
            .response {request, response, data, error in
                
                var parsedData: AnyObject!
                
                switch (controller) {
                case .SearchViewController:
                    parsedData = self.getListDataFromJson(data!) as ListData
                case .UserViewController:
                    parsedData = self.getUserDataFromJson(data!) as UserData
                case .WantlistViewController:
                    parsedData = self.getWantlistDataFromJson(data!) as ListData
                case .CollectionViewController:
                    parsedData = self.getCollectionDataFromJson(data!) as ListData
                case .CollectionFolderViewController:
                    parsedData = self.getCollectionFolderFromJson(data!)  as [CollectionFolder]
                }                
                dispatch_async(dispatch_get_main_queue()) {
                    callback?(parsedData)
                }
            }      
    }
    
    func delData(urlStr: String) {
        Alamofire.request(.DELETE, urlStr)
            .response { (request, response, data, error) in
                print(request)
                print(response)
        }
    }
    
    func updateData(urlStr: String, parameters: NSDictionary) {        
       
        Alamofire.request(.POST, urlStr, parameters: parameters as? [String : AnyObject],  encoding: .JSON)
             .response { request, response, data, error in
             print(request)
             print(response)
             print(data)
         }
    }
    
    
    func updateDataPut(urlStr: String, parameters: NSDictionary) {
        
        Alamofire.request(.PUT, urlStr, parameters: parameters as? [String : AnyObject],  encoding: .JSON)
            .response { request, response, data, error in
                print(request)
                print(response)
                
        }
    }
    
    
 private func getListDataFromJson(data: NSData) -> ListData {
        
        let json = JSON(data: data)
        let list = ListData()
        getPagenation(list, json: json)
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
                    iData.year = (year as NSString).integerValue}
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
                iDataArr.append(iData) }
            
            list.itemsData = iDataArr
        }
        return list
    }

 private func getUserDataFromJson(data: NSData) -> UserData {
        let UData = UserData()
        let json = JSON(data: data)
        
        if let profile = json["profile"].string {
            UData.profile = profile }
        if let rank = json["rank"].float {
            UData.rank = rank  }
        if let idi = json["id"].int {
            UData.id = idi }
        if let homePage = json["home_page"].string {
            UData.homePage = homePage }
        if let location = json["location"].string {
            UData.location = location }
        if let collectionFoldersUrl = json["collection_folders_url"].string {
            UData.collectionFoldersUrl = collectionFoldersUrl  }
        if let username = json["username"].string {
            UData.username = username }
        if let collectionFieldsUrl = json["collection_fields_url"].string {
            UData.collectionFieldsUrl = collectionFieldsUrl }
        if let releasesContributed = json["releases_contributed"].int {
            UData.releasesContributed = releasesContributed }
        if let registered = json["registered"].string {
            UData.registered = registered }
        if let ratingAvg = json["rating_avg"].float {
            UData.ratingAvg = ratingAvg   }
        if let numCollection = json["num_collection"].int {
            UData.numCollection = numCollection  }
        if let releasesRated = json["releases_rated"].int {
            UData.releasesRated = releasesRated  }
        if let numLists = json["num_lists"].int {
            UData.numLists = numLists }
        if let name = json["name"].string {
            UData.name = name }
        if let numWantlist = json["num_wantlist"].int {
            UData.numWantlist = numWantlist }
        if let inventoryUrl = json["inventory_url"].string {
            UData.inventoryUrl = inventoryUrl }
        if let uri = json["uri"].string {
            UData.uri = uri  }
        if let avatarUrl = json["avatar_url"].string {
            UData.avatarUrl = avatarUrl }
        if let resourceUrl = json["resource_url"].string {
            UData.resourceUrl = resourceUrl  }

        return UData
    }

    func getWantlistDataFromJson(data: NSData) -> ListData {
        let WData = ListData()
        let json = JSON(data: data)
        getPagenation(WData, json: json)
        if let itemArr = json["wants"].array {
            var iDataArr = [WantlistData]()
            for item in itemArr {
                let iData = WantlistData()
                if let idi = item["id"].int {
                    iData.id = idi}
                if let resourceUrl = item["resourceUrl"].string {
                    iData.resourceUrl = resourceUrl }
                if let thumb = item["basic_information"]["thumb"].string {
                    iData.thumb = thumb }
                if let catno = item["basic_information"]["labels"][0]["catno"].string {
                    iData.catno = catno }
                if let id = item["id"].int {
                    iData.id = id }
                if let year = item["basic_information"]["year"].int {
                    iData.year = year }
                if let nameLabels = item["basic_information"]["labels"][0]["name"].string {
                    iData.name = nameLabels }
                if let title = item["basic_information"]["title"].string {
                    iData.title = title }
                if let rating = item["rating"].int {
                    iData.rating = rating }
                if let descriptionsFormat = item["basic_information"]["formats"][0]["descriptions"].arrayObject {
                    let des = descriptionsFormat as! [String]
                    iData.descriptionsFormat = des.joinWithSeparator(", ")   }
                if let qtyFormat = item["basic_information"]["formats"][0]["qty"].string {
                    iData.qtyFormat = qtyFormat }
                if let nameFormat = item["basic_information"]["formats"][0]["name"].string {
                    iData.nameFormat = nameFormat }
                if let textFormat = item["basic_information"]["formats"][0]["text"].string {
                    iData.textFormat = textFormat }
                if let nameArtists = item["basic_information"]["artists"][0]["name"].string {
                    iData.nameArtists = nameArtists }               
                
                iDataArr.append(iData) }
            
            WData.itemsData = iDataArr
        }
        return WData
        
    }
    
    func getCollectionDataFromJson(data: NSData) -> ListData {
        let WData = ListData()
        let json = JSON(data: data)
        getPagenation(WData, json: json)
        if let itemArr = json["releases"].array {
            var iDataArr = [CollectionData]()
            for item in itemArr {
                let iData = CollectionData()
                if let idi = item["id"].int {
                    iData.id = idi}
                if let instanceId = item["instance_id"].int {
                    iData.instanceId = instanceId}
                if let resourceUrl = item["resourceUrl"].string {
                    iData.resourceUrl = resourceUrl }
                if let thumb = item["basic_information"]["thumb"].string {
                    iData.thumb = thumb }
                if let catno = item["basic_information"]["labels"][0]["catno"].string {
                    iData.catno = catno }
                if let id = item["id"].int {
                    iData.id = id }
                if let year = item["basic_information"]["year"].int {
                    iData.year = year }
                if let nameLabels = item["basic_information"]["labels"][0]["name"].string {
                    iData.name = nameLabels }
                if let title = item["basic_information"]["title"].string {
                    iData.title = title }
                if let rating = item["rating"].int {
                    iData.rating = rating }
                if let descriptionsFormat = item["basic_information"]["formats"][0]["descriptions"].arrayObject {
                    let des = descriptionsFormat as! [String]
                    iData.descriptionsFormat = des.joinWithSeparator(", ")  }
                if let qtyFormat = item["basic_information"]["formats"][0]["qty"].string {
                    iData.qtyFormat = qtyFormat }
                if let nameFormat = item["basic_information"]["formats"][0]["name"].string {
                    iData.nameFormat = nameFormat }
                if let textFormat = item["basic_information"]["formats"][0]["text"].string {
                    iData.textFormat = textFormat }
                if let nameArtists = item["basic_information"]["artists"][0]["name"].string {
                    iData.nameArtists = nameArtists }
                
                iDataArr.append(iData) }
            
            WData.itemsData = iDataArr
        }
        return WData
    }

    func getCollectionFolderFromJson(data: NSData) -> [CollectionFolder] {
        var fData = [CollectionFolder]()
        let json = JSON(data: data)
     
        if let itemArr = json["folders"].array {
            for item in itemArr {
                let folder = CollectionFolder()
                if let fid = item["id"].int {
                 folder.id = fid }
                if let count = item["count"].int {
                 folder.count = count }
                if let name = item["count"].string{
                 folder.name = name }
                
                fData.append(folder)
            }        
        }
    
        return fData        
    }
    
    func getPagenation(WData: ListData, json: JSON) {
        
        if let urlStr = json["pagination"]["urlStr"].string {
            WData.urlStr = urlStr }
        if let perpage = json["pagination"]["perpage"].int {
            WData.perpage = perpage }
        if let pages = json["pagination"]["pages"].int {
            WData.pages = pages}
        if let page = json["pagination"]["page"].int {
            WData.page = page}
        if let urlprev = json["pagination"]["urls"]["prev"].string {
            WData.urlprev = urlprev}
        if let urlnext = json["pagination"]["urls"]["next"].string {
            WData.urlnext = urlnext}
        if let urllast = json["pagination"]["urls"]["last"].string {
            WData.urllast = urllast}
        if let urlfirst = json["pagination"]["urls"]["first"].string {
            WData.urlfirst = urlfirst}
        if let items = json["pagination"]["items"].int {
            WData.items = items}
    }

}
