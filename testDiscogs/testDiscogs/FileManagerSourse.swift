//
//  FileManagerSourse.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/21/16.
//  Copyright © 2016 courses. All rights reserved.
//

import Foundation

class FileManagerSourse {
    
    static let sharedManager = FileManagerSourse()
    
    func setManager() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let path = paths.stringByAppendingString("/Services.plist")
        let fileManager = NSFileManager.defaultManager()
        if (!(fileManager.fileExistsAtPath(path)))
        {
            let bundle : NSString = NSBundle.mainBundle().pathForResource("Services", ofType: "plist")!
            do{
                try  fileManager.copyItemAtPath(bundle as String, toPath: path)}
            catch{
            }
        }
        return path
    }

    func saveServices (consumerKey: String, consumerSecret: String){
        let path = setManager()
        let data : NSMutableDictionary = NSMutableDictionary(contentsOfFile: path)!
        data.setObject(consumerKey, forKey: "consumerKey")
        data.setObject(consumerSecret, forKey: "consumerSecret")
        data.writeToFile(path, atomically: true)
        print(path)
    }
    
    func saveUserName (username: String){
        let path = setManager()
        let data : NSMutableDictionary = NSMutableDictionary(contentsOfFile: path)!
        data.setObject(username, forKey: "username")
        data.writeToFile(path, atomically: true)
        print(path)
    }
    
    func getServices() -> (String, String) {
        let path = setManager()
        let data : NSMutableDictionary = NSMutableDictionary(contentsOfFile: path)!
        return (data["consumerKey"] as! String, data["consumerSecret"] as! String)
    }
    
    func getUserName() -> String {
        let path = setManager()
        let data : NSMutableDictionary = NSMutableDictionary(contentsOfFile: path)!
        return  data["username"] as! String
    }
}