//
//  LoginedViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/17/16.
//  Copyright © 2016 courses. All rights reserved.
//

import WebKit
import OAuthSwift


class LoginedViewController: OAuthWebViewController {
    var mainView: UIWebView!  
    var urlStr: String!
    var compactConstraint = [NSLayoutConstraint]()
    var fmanager: FileManagerSourse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fmanager = FileManagerSourse()
        let oauthSwift = OAuth1Swift(
            consumerKey: constApp.key as String,
            consumerSecret: constApp.secret as String,
            requestTokenUrl: "https://api.discogs.com/oauth/request_token",
            authorizeUrl: "https://www.discogs.com/oauth/authorize",
            accessTokenUrl: "https://api.discogs.com/oauth/access_token"
        )
        
       oauthSwift.authorize_url_handler = SafariURLHandler(viewController: self)
        
       oauthSwift.authorizeWithCallbackURL(
            NSURL(string: "testdiscogs://api.discogs.com")!,
            success: { credential, response, parameters in
                print(credential.oauth_token)
                print(credential.oauth_token_secret)
              
                self.fmanager.saveServices(credential.oauth_token, consumerSecret: credential.oauth_token_secret)
                self.loadSearchViewController()
                
                oauthSwift.client.get("https://api.discogs.com/oauth/identity", headers: ["Accept":"application/json"],
                    success: {
                        data, response in
                        if let jsonDict = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) , dico = jsonDict as? [String: AnyObject] {
                            self.fmanager.saveUserName(dico["username"] as! String)
                            print(self.fmanager.getUserName()) }
                        else {
                            print("no json response")
                        }
                        
                        
                    }, failure: { error in
                        print(error)
                })
            },
            failure: { error in
                print(error.localizedDescription)
            }             
        )

        mainView =  UIWebView()
        mainView.delegate = self
        mainView.scalesPageToFit = true
        mainView.userInteractionEnabled = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        setapLayout()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadSearchViewController() {
        
        let SearchViewC = UINavigationController(rootViewController: SearchViewController())
        presentViewController(SearchViewC, animated: true, completion: nil)
    }

    func loginButtonAction (sender: UIButton) {
      forLoginButtonAction()
    }
    
    func forLoginButtonAction() {
      
    }
    
    func setapLayout() {
        
        //Compact Constaints
        
        compactConstraint.append(NSLayoutConstraint(
            item: mainView,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: topLayoutGuide,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 20))
        compactConstraint.append(NSLayoutConstraint(
            item: mainView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: 0 ))
        compactConstraint.append(NSLayoutConstraint(
            item: mainView,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0))
        
      NSLayoutConstraint.activateConstraints(compactConstraint)
    }
    
}

extension LoginedViewController: UIWebViewDelegate {
   
}






        