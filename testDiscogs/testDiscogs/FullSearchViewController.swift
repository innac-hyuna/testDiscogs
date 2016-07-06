//
//  FullSearchViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 7/5/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit

protocol SlideSearchDelegate {
    func slideSearchQuery(dic : NSDictionary)
}

class FullSearchViewController: UIViewController {

    var btnCloseMenuOverlay: UIButton!
    var btnResetAll: UIButton!
    var editType: UITextField!
    var editTitle: UITextField!
    var editReleaseTitle: UITextField!
    var editCredit: UITextField!
    var editArtist: UITextField!
    var editAnv: UITextField!
    var editLabel: UITextField!
    var editGenre: UITextField!
    var editStyle: UITextField!
    var editCountry: UITextField!
    var editYear: UITextField!
    var editFormat: UITextField!
    var editCatno: UITextField!
    var editBarcode: UITextField!
    var editTrack: UITextField!
    var editSubmitter: UITextField!
    var editContributor: UITextField!
    var labType: UILabel!
    var labTitle: UILabel!
    var labReleaseTitle: UILabel!
    var labCredit: UILabel!
    var labArtist: UILabel!
    var labAnv: UILabel!
    var labLabel: UILabel!
    var labGenre: UILabel!
    var labStyle: UILabel!
    var labCountry: UILabel!
    var labYear: UILabel!
    var labFormat: UILabel!
    var labCatno: UILabel!
    var labBarcode: UILabel!
    var labTrack: UILabel!
    var labSubmitter: UILabel!
    var labContributor: UILabel!
    var btnSearch : UIButton!
    var userDef: NSUserDefaults!
    var scrollView: UIScrollView!
    var regularConstraint: [NSLayoutConstraint] = []
    var compactConstraint: [NSLayoutConstraint] = []
    var delegate : SlideSearchDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDef = NSUserDefaults.standardUserDefaults()
        
        scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.bgColor()
        view.addSubview(scrollView)
        
        btnCloseMenuOverlay = UIButton(type: .Custom) as UIButton
        btnCloseMenuOverlay.setTitle("ADD to search", forState: .Normal)
        btnCloseMenuOverlay.titleLabel?.font = UIFont.HelTextFont(14)
        btnCloseMenuOverlay.backgroundColor = UIColor.buttonColor()
        btnCloseMenuOverlay.addTarget(self, action: #selector(FullSearchViewController.onCloseMenuClick(_:)), forControlEvents: .TouchUpInside)
        btnCloseMenuOverlay.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(btnCloseMenuOverlay)
        
        btnResetAll = UIButton(type: .Custom) as UIButton
        btnResetAll.setTitle("RESET", forState: .Normal)
        btnResetAll.titleLabel?.font = UIFont.HelTextFont(14)
        btnResetAll.backgroundColor = UIColor.buttonColor()
        btnResetAll.addTarget(self, action: #selector(FullSearchViewController.onReset(_:)), forControlEvents: .TouchUpInside)
        btnResetAll.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(btnResetAll)
        
        editType = UITextField()
        editType.setMyStyle()
        editType.delegate = self
        editType.tag = 1
        editType.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editType)
        
        labType = UILabel()
        labType.text = "Type"
        //labType.font = UIFont.HelTextFont(12)
        //labType.textColor = UIColor.textColor()
        labType.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labType)
        
        editTitle = UITextField()
        editTitle.setMyStyle()
        editTitle.delegate = self
        editTitle.tag = 2
        editTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editTitle)
        
        labTitle = UILabel()
        labTitle.text = "Title"
        labTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labTitle)
        
        editReleaseTitle = UITextField()
        editReleaseTitle.setMyStyle()
        editReleaseTitle.delegate = self
        editReleaseTitle.tag = 3
        editReleaseTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editReleaseTitle)
        
        labReleaseTitle = UILabel()
        labReleaseTitle.text = "Release_title"
        labReleaseTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labReleaseTitle)
        
        editCredit = UITextField()
        editCredit.setMyStyle()
        editCredit.delegate = self
        editCredit.tag = 4
        editCredit.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editCredit)
        
        labCredit = UILabel()
        labCredit.text = "Credit"
        labCredit.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labCredit)
        
        editArtist = UITextField()
        editArtist.setMyStyle()
        editArtist.delegate = self
        editArtist.tag = 5
        editArtist.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editArtist)
        
        labArtist = UILabel()
        labArtist.text = "Artist"
        labArtist.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labArtist)
        
        editAnv = UITextField()
        editAnv.setMyStyle()
        editAnv.delegate = self
        editAnv.tag = 6
        editAnv.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editAnv)
        
        labAnv = UILabel()
        labAnv.text = "Anv"
        labAnv.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labAnv)
        
        editLabel = UITextField()
        editLabel.setMyStyle()
        editLabel.delegate = self
        editLabel.tag = 7
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editLabel)
        
        labLabel = UILabel()
        labLabel.text = "Label"
        labLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labLabel)
        
        editGenre = UITextField()
        editGenre.setMyStyle()
        editGenre.delegate = self
        editLabel.tag = 8
        editGenre.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editGenre)
        
        labGenre = UILabel()
        labGenre.text = "Genre"
        labGenre.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labGenre)
        
        editStyle = UITextField()
        editStyle.setMyStyle()
        editStyle.delegate = self
        editStyle.tag = 9
        editStyle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editStyle)
        
        labStyle = UILabel()
        labStyle.text = "Style"
        labStyle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labStyle)
        
        editFormat = UITextField()
        editFormat.setMyStyle()
        editFormat.delegate = self
        editFormat.tag = 10
        editFormat.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editFormat)
        
        labFormat = UILabel()
        labFormat.text = "Format"
        labFormat.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labFormat)
        
        editCountry = UITextField()
        editCountry.setMyStyle()
        editCountry.delegate = self
        editCountry.tag = 11
        editCountry.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editCountry)
        
        labCountry = UILabel()
        labCountry.text = "Country"
        labCountry.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labCountry)
        
        editYear = UITextField()
        editYear.setMyStyle()
        editYear.delegate = self
        editYear.tag = 12
        editYear.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editYear)
        
        labYear = UILabel()
        labYear.text = "Year"
        labYear.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labYear)
        
        editCatno = UITextField()
        editCatno.setMyStyle()
        editCatno.tag = 13
        editCatno.delegate = self
        editCatno.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editCatno)
        
        labCatno = UILabel()
        labCatno.text = "Catno"
        labCatno.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labCatno)
        
        editBarcode = UITextField()
        editBarcode.setMyStyle()
        editBarcode.tag = 14
        editBarcode.delegate = self
        editBarcode.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editBarcode)
        
        labBarcode = UILabel()
        labBarcode.text = "Barcode"
        labBarcode.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labBarcode)
        
        editTrack = UITextField()
        editTrack.setMyStyle()
        editTrack.delegate = self
        editTrack.tag = 15
        editTrack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editTrack)
        
        labTrack = UILabel()
        labTrack.text = "Track"
        labTrack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labTrack)
        
        editSubmitter = UITextField()
        editSubmitter.setMyStyle()
        editSubmitter.delegate = self
        editSubmitter.tag = 16
        editSubmitter.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editSubmitter)
        
        labSubmitter = UILabel()
        labSubmitter.text = "Submitter"
        labSubmitter.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labSubmitter)
        
        editContributor = UITextField()
        editContributor.setMyStyle()
        editContributor.delegate = self
        editContributor.tag = 17
        editContributor.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editContributor)
        
        labContributor = UILabel()
        labContributor.text = "Contributor"
        labContributor.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labContributor)
        
        setContaintsForTextField(
            [(editType, labType),
                (editTitle, labTitle),
                (editReleaseTitle,labReleaseTitle),
                (editCredit, labCredit),
                (editArtist, labArtist),
                (editAnv, labAnv),
                (editLabel, labLabel),
                (editGenre, labGenre),
                (editStyle, labStyle),
                (editCountry, labCountry),
                (editYear, labYear),
                (editFormat, labFormat),
                (editCatno, labCatno),
                (editBarcode, labBarcode),
                (editTrack, labTrack),
                (editSubmitter, labSubmitter),
                (editContributor, labContributor)])       
        
        NSLayoutConstraint(item: scrollView,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Width,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: scrollView,
                           attribute: NSLayoutAttribute.Height,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Height,
                           multiplier: 1.0,
                           constant: 0).active = true
        NSLayoutConstraint(item: scrollView,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: view,
                           attribute: NSLayoutAttribute.Top,
                           multiplier: 1.0,
                           constant: 0).active = true
        
        NSLayoutConstraint(item: btnCloseMenuOverlay,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 100).active = true
        NSLayoutConstraint(item: btnCloseMenuOverlay,
                           attribute: NSLayoutAttribute.Leading,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: scrollView,
                           attribute: NSLayoutAttribute.Leading,
                           multiplier: 1.0,
                           constant: 15).active = true
        
        NSLayoutConstraint(item: btnResetAll,
                           attribute: NSLayoutAttribute.Width,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: nil,
                           attribute: NSLayoutAttribute.NotAnAttribute,
                           multiplier: 1.0,
                           constant: 100).active = true
        NSLayoutConstraint(item: btnResetAll,
                           attribute: NSLayoutAttribute.Trailing,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: scrollView,
                           attribute: NSLayoutAttribute.Trailing,
                           multiplier: 1.0,
                           constant: -15).active = true

        
        setContaintsV(
            [   "btn": btnCloseMenuOverlay,
                "Type": editType,
                "Title": editTitle,
                "ReleaseTitle": editReleaseTitle,
                "Credit": editCredit,
                "Artist": editArtist,
                "Anv": editAnv,
                "Label": editLabel,
                "Genre": editGenre,
                "Style": editStyle,
                "Country": editCountry,
                "Year": editYear,
                "Format": editFormat,
                "Catno": editCatno,
                "Barcode": editBarcode,
                "Track": editTrack,
                "Submitter": editSubmitter,
                "Contributor": editContributor])
        
        setContaintsV(
            [   "btn": btnResetAll,
                "Type": labType,
                "Title": labTitle,
                "ReleaseTitle": labReleaseTitle,
                "Credit": labCredit,
                "Artist": labArtist,
                "Anv": labAnv,
                "Label": labLabel,
                "Genre": labGenre,
                "Style": labStyle,
                "Country": labCountry,
                "Year": labYear,
                "Format": labFormat,
                "Catno": labCatno,
                "Barcode": labBarcode,
                "Track": labTrack,
                "Submitter": labSubmitter,
                "Contributor": labContributor])
        setupLayout()
        reloadDataEdit()
    }
    
    
    func reloadDataEdit() {
        
        editType.text = userDef.stringForKey("1")
        editTitle.text = userDef.stringForKey("2")
        editReleaseTitle.text = userDef.stringForKey("3")
        editCredit.text = userDef.stringForKey("4")
        editArtist.text = userDef.stringForKey("5")
        editAnv.text = userDef.stringForKey("6")
        editLabel.text = userDef.stringForKey("7")
        editLabel.text = userDef.stringForKey("8")
        editStyle.text = userDef.stringForKey("9")
        editFormat.text = userDef.stringForKey("10")
        editCountry.text = userDef.stringForKey("11")
        editYear.text = userDef.stringForKey("12")
        editCatno.text = userDef.stringForKey("13")
        editBarcode.text = userDef.stringForKey("14")
        editTrack.text = userDef.stringForKey("15")
        editSubmitter.text = userDef.stringForKey("16")
        editContributor.text = userDef.stringForKey("17")
    }
    
    
    func setupLayout() {
        
        //if UIDevice.currentDevice().orientation.isPortrait.boolValue  {
         //   NSLayoutConstraint.deactivateConstraints(regularConstraint)
            NSLayoutConstraint.activateConstraints(compactConstraint)
      /*  } else {
            NSLayoutConstraint.deactivateConstraints(compactConstraint)
            NSLayoutConstraint.activateConstraints(regularConstraint) }*/
    }
    
   /* override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
       setupLayout()
    }*/
    
    func onReset(sender: UIButton) {
        for i in 1...17 {
          userDef.removeObjectForKey(String(i))
        }
        reloadDataEdit()
    }
    
    func setContaintsV(dic: NSDictionary){
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-[btn]-[Type(30)]-[Title(30)]-[ReleaseTitle(30)]-[Credit(30)]-[Artist(30)]-[Anv(30)]-[Label(30)]-[Genre(30)]-[Style(30)]-[Country(30)]-[Year(30)]-[Format(30)]-[Catno(30)]-[Barcode(30)]-[Track(30)]-[Submitter(30)]-[Contributor(30)]-|", options: [], metrics: nil, views: dic as! [String : AnyObject] ))
    }
    
    func setContaintsForTextField(arrTextF: [(UITextField, UILabel)]){
     
        for textF in arrTextF {
            compactConstraint.append(NSLayoutConstraint(item: textF.1,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: scrollView,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1.0,
                constant: 15))
            compactConstraint.append(NSLayoutConstraint(item: textF.1,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1.0,
                constant: 100))
            compactConstraint.append(NSLayoutConstraint(item: textF.1,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: textF.0,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1.0,
                constant: 0))
            
            compactConstraint.append(NSLayoutConstraint(item: textF.0,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: scrollView,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1.0,
                constant: -15))
            compactConstraint.append(NSLayoutConstraint(item: textF.0,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: textF.1,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1.0,
                constant: 0))
            compactConstraint.append(NSLayoutConstraint(item: textF.0,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1.0,
                constant: scrollView.bounds.width-120))
            
            regularConstraint.append(NSLayoutConstraint(item: textF.1,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: scrollView,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1.0,
                constant: 15))
            regularConstraint.append(NSLayoutConstraint(item: textF.1,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1.0,
                constant: 100))
            regularConstraint.append(NSLayoutConstraint(item: textF.1,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: textF.0,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1.0,
                constant: 0))
            
            regularConstraint.append(NSLayoutConstraint(item: textF.0,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: scrollView,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1.0,
                constant: -15))
            regularConstraint.append(NSLayoutConstraint(item: textF.0,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: textF.1,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1.0,
                constant: 0))
            regularConstraint.append(NSLayoutConstraint(item: textF.0,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1.0,
                constant: scrollView.bounds.width-120))
        
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func onCloseMenuClick(button:UIButton!){
        btnSearch.tag = 0
        
        if (self.delegate != nil) {
            
           delegate?.slideSearchQuery(
            ["type": editType.text!,
             "title": editTitle.text!,
             "release_title": editReleaseTitle.text!,
             "credit": editCredit.text!,
             "artist": editArtist.text!,
             "anv": editAnv.text!,
             "label": editLabel.text!,
             "genre": editGenre.text!,
             "style": editStyle.text!,
             "country": editCountry.text!,
             "year": editYear.text!,
             "format": editFormat.text!,
             "catno": editCatno.text!,
             "barcode": editBarcode.text!,
             "track": editTrack.text!,
             "submitter": editSubmitter.text!,
             "contributor": editContributor.text!])
        }
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.frame = CGRectMake(-UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clearColor()
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
      })
    }
  }

extension FullSearchViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(textField: UITextField) {
 
        userDef.setValue(textField.text, forKey: String(textField.tag))
        
    }
    

}