//
//  SearchListData.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/13/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation
import SwiftyJSON

class SearchListData {
    var urlStr: String!
    var perpage: Int!
    var pages: Int!
    var page: Int!
    var urlslast: String!
    var urlnext: String!
    var items: Int!
   
    
    func getList(urlStr: String) {
        
        let url = NSURL(string: urlStr)
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
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func getDataFromJson(data: NSData) -> SearchListData {
        
        let json = JSON(data: data)
        let list = SearchListData()
        
        
        return list

        
    }

}
