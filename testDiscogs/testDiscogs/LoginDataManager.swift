//
//  LoginManager.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/17/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation
import SwiftyJSON
import MBProgressHUD

class LoginDataManager {
    
    
    func getLoginInfo(urlStr: String, controller: LoginedViewController) {
        
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
                print(httpResponse.statusCode)
                if httpResponse.statusCode == 200 ||  httpResponse.statusCode == 404 {
                    let parsedData = self.getDataFromJson(data!)
                    dispatch_async(dispatch_get_main_queue()) {
                        NSNotificationCenter.defaultCenter().postNotificationName(constNotification.Login, object: parsedData, userInfo: nil)
                        MBProgressHUD.hideAllHUDsForView(controller.view, animated: true)
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func getDataFromJson(data: NSData) -> UserData {
        let UData = UserData()
        let json = JSON(data: data)
        
        if let message = json["message"].string {
            UData.message = message
        }
        
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