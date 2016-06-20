//
//  LoginedViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 6/17/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit


class LoginedViewController: UIViewController {
    var mainView: UIView!
    var iconImg: UIImageView!
    var loginText: UITextField!
    var passwordText: UITextField!
    var loginButton: UIButton!
    var topBar: UILayoutSupport!
    var urlStr: String!
    var loginName: String!
    var LManager: LoginDataManager!
    var NavController: UINavigationController!
    var compactConstraint = [NSLayoutConstraint]()
    var BarMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let login =  NSUserDefaults.standardUserDefaults().stringForKey("loginname") {
            if login != "" {
                loadSearchViewController() }
       
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginedViewController.loginGotAction(_:)), name: constNotification.Login, object: nil)
        
        urlStr = "https://api.discogs.com/users/"
        loginName = ""
        LManager = LoginDataManager()
        
        BarMenu = UIBarButtonItem()
       
        
        mainView = UIView()
        mainView.userInteractionEnabled = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        
        iconImg  = UIImageView()
        iconImg.image = UIImage.bgIconImage()
        iconImg.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(iconImg)
        
        loginText = UITextField()
        loginText.textColor = UIColor.textColor()
        loginText.delegate = self
        loginText.backgroundColor = UIColor.buttonColor()
        loginText.autocapitalizationType = UITextAutocapitalizationType.None
        loginText.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(loginText)
        
        loginButton = UIButton(type: .Custom) as UIButton
        loginButton.addTarget(self, action: #selector(LoginedViewController.loginButtonAction(_:)), forControlEvents: .TouchUpInside)
        loginButton.setTitle("Sign into Discogs", forState: .Normal)
        loginButton.titleLabel?.font = UIFont.HelTextFont(14)
        loginButton.backgroundColor = UIColor.buttonColor()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(loginButton)
        setapLayout()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loginGotAction(notification: NSNotification) {
            
          guard let arrData = notification.object as? UserData else {
            return     }
        
        if arrData.message == "" {
            NSUserDefaults.standardUserDefaults().setValue(arrData.username, forKey: "loginname")
            loadSearchViewController()
        }
        
    }
    
    func loadSearchViewController() {
        
        NavController = UINavigationController(rootViewController: SearchViewController())
        presentViewController(NavController, animated: true, completion: nil)
     
        
    }

    func loginButtonAction (sender: UIButton) {
      forLoginButtonAction()
    }
    
    func forLoginButtonAction() {
        loginName = loginText.text
        loginName = loginName.stringByReplacingOccurrencesOfString(" ", withString: "")
        LManager.getLoginInfo(urlStr+loginName, controller: self)
    }
    
    func setapLayout() {
        
        //Compact Constaints
        
        compactConstraint.append(NSLayoutConstraint(
            item: mainView,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 20))
        compactConstraint.append(NSLayoutConstraint(
            item: mainView,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0))
        compactConstraint.append(NSLayoutConstraint(
            item: mainView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 350 ))
        compactConstraint.append(NSLayoutConstraint(
            item: mainView,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 300))
        
        compactConstraint.append(NSLayoutConstraint(
            item: iconImg,
            attribute: NSLayoutAttribute.TopMargin,
            relatedBy: NSLayoutRelation.Equal,
            toItem: mainView,
            attribute: NSLayoutAttribute.TopMargin,
            multiplier: 1.0,
            constant: 15))
        compactConstraint.append(NSLayoutConstraint(
            item: iconImg,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: mainView,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0))
        
        compactConstraint.append(NSLayoutConstraint(
            item: loginText,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: mainView,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0))
        compactConstraint.append(NSLayoutConstraint(
            item: loginText,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: iconImg,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 15))
        compactConstraint.append(NSLayoutConstraint(
            item: loginText,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 250))
        compactConstraint.append(NSLayoutConstraint(
            item: loginText,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 30))
        
        compactConstraint.append(NSLayoutConstraint(
            item: loginButton,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: mainView,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0))
        compactConstraint.append(NSLayoutConstraint(
            item: loginButton,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: loginText,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 15))
        compactConstraint.append(NSLayoutConstraint(
            item: loginButton,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 250))
        compactConstraint.append(NSLayoutConstraint(
            item: loginButton,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 30))
        NSLayoutConstraint.activateConstraints(compactConstraint)
    }
    
}

extension LoginedViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        forLoginButtonAction()
        return true
    }
   
}




        