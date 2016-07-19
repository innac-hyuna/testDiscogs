//
//  LoginedViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/17/16.
//  Copyright © 2016 courses. All rights reserved.
//

import WebKit
import OAuthSwift
import AKSideMenu


class LoginedViewController: OAuthWebViewController {
    var mainView: UIWebView!  
    var urlStr: String!
    var compactConstraint = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let oauthSwift = OAuth1Swift(
            consumerKey: constApp.key as String,
            consumerSecret: constApp.secret as String,
            requestTokenUrl: "https://api.discogs.com/oauth/request_token",
            authorizeUrl: "https://www.discogs.com/oauth/authorize",
            accessTokenUrl: "https://api.discogs.com/oauth/access_token")
        
       oauthSwift.authorize_url_handler = SafariURLHandler(viewController: self)
        
       oauthSwift.authorizeWithCallbackURL(
            NSURL(string: "testdiscogs://api.discogs.com")!,
            success: { credential, response, parameters in
              
                FileManagerSourse.sharedManager.saveServices(credential.oauth_token, consumerSecret: credential.oauth_token_secret)
                self.loadSearchViewController()
                
                oauthSwift.client.get("https://api.discogs.com/oauth/identity", headers: ["Accept":"application/json"],
                    success: {
                        data, response in
                        if let jsonDict = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) , dico = jsonDict as? [String: AnyObject] {
                            FileManagerSourse.sharedManager.saveUserName(dico["username"] as! String)  }
                        else {
                            print("no json response")
                        }
                        
                    }, failure: { error in
                        print(error)
                        
                })
            },
            failure: { error in
                print(error.localizedDescription)                
            })
        
        mainView =  UIWebView()
        mainView.delegate = self
        mainView.scalesPageToFit = true
        mainView.userInteractionEnabled = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        setupLayout()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSearchViewController() {
        
        let SearchViewC = UINavigationController(rootViewController: SearchViewController())
        let leftMenuViewController: LeftMenuViewController = LeftMenuViewController()
        let rightMenuViewController: RightMenuViewController = RightMenuViewController()
        
        // Create side menu controller
        let sideMenuViewController: AKSideMenu =  AKSideMenu(contentViewController: SearchViewC, leftMenuViewController: leftMenuViewController, rightMenuViewController: rightMenuViewController)
        sideMenuViewController.backgroundImage = UIImage(named: "Stars")!
        sideMenuViewController.menuPreferredStatusBarStyle = UIStatusBarStyle.LightContent
        sideMenuViewController.delegate = self
        sideMenuViewController.contentViewShadowColor = UIColor.blackColor()
        sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0)
        sideMenuViewController.contentViewShadowOpacity = 0.4
        sideMenuViewController.contentViewShadowRadius = 12
        sideMenuViewController.contentViewShadowEnabled = true
        
        presentViewController(sideMenuViewController, animated: true, completion: nil)
    }
    
    func setupLayout() {
        
        mainView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(0)
            make.width.equalTo(view).offset(0)
            make.height.equalTo(view).offset(0) }

    }
}

extension LoginedViewController: AKSideMenuDelegate {
    
    func sideMenu(sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
        print("willShowMenuViewController")
    }
    
    func sideMenu(sideMenu: AKSideMenu, didShowMenuViewController menuViewController: UIViewController) {
        print("didShowMenuViewController")
    }
    
    func sideMenu(sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        print("willHideMenuViewController")
    }
    
    func sideMenu(sideMenu: AKSideMenu, didHideMenuViewController menuViewController: UIViewController) {
        print("didHideMenuViewController")
    }

}

extension LoginedViewController: UIWebViewDelegate {
    
}

        