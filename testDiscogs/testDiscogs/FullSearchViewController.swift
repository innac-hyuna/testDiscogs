//
//  FullSearchViewController.swift
//  testDiscogs
//
//  Created by FE Team TV on 7/5/16.
//  Copyright © 2016 courses. All rights reserved.
//

import UIKit
import SnapKit


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
    var scrollView: UIScrollView!
    var regularConstraint: [NSLayoutConstraint] = []
    var compactConstraint: [NSLayoutConstraint] = []
    var dicParam: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        scrollView.backgroundColor = UIColor.bgColor()
        scrollView.alwaysBounceHorizontal = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
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
        editType.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editType)
        
        labType = UILabel()
        labType.text = "Type"
        labType.font = UIFont.HelTextFont(13)
        labType.textColor = UIColor.textColor()
        labType.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labType)
        
        editTitle = UITextField()
        editTitle.setMyStyle()
        editTitle.font = UIFont.HelTextFont(14)
        editTitle.textColor = UIColor.textColor()
        editTitle.delegate = self
        editTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editTitle)
        
        labTitle = UILabel()
        labTitle.text = "Title"
        labTitle.font = UIFont.HelTextFont(13)
        labTitle.textColor = UIColor.textColor()
        labTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labTitle)
        
        editReleaseTitle = UITextField()
        editReleaseTitle.setMyStyle()
        editReleaseTitle.font = UIFont.HelTextFont(14)
        editReleaseTitle.textColor = UIColor.textColor()
        editReleaseTitle.delegate = self
        editReleaseTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editReleaseTitle)
        
        labReleaseTitle = UILabel()
        labReleaseTitle.text = "Release_title"
        labReleaseTitle.font = UIFont.HelTextFont(13)
        labReleaseTitle.textColor = UIColor.textColor()
        labReleaseTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labReleaseTitle)
        
        editCredit = UITextField()
        editCredit.setMyStyle()
        editCredit.font = UIFont.HelTextFont(14)
        editCredit.textColor = UIColor.textColor()
        editCredit.delegate = self
        editCredit.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editCredit)
        
        labCredit = UILabel()
        labCredit.text = "Credit"
        labCredit.font = UIFont.HelTextFont(13)
        labCredit.textColor = UIColor.textColor()
        labCredit.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labCredit)
        
        editArtist = UITextField()
        editArtist.setMyStyle()
        editArtist.font = UIFont.HelTextFont(14)
        editArtist.textColor = UIColor.textColor()
        editArtist.delegate = self
        editArtist.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editArtist)
        
        labArtist = UILabel()
        labArtist.text = "Artist"
        labArtist.font = UIFont.HelTextFont(13)
        labArtist.textColor = UIColor.textColor()
        labArtist.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labArtist)
        
        editAnv = UITextField()
        editAnv.setMyStyle()
        editAnv.font = UIFont.HelTextFont(14)
        editAnv.textColor = UIColor.textColor()
        editAnv.delegate = self
        editAnv.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editAnv)
        
        labAnv = UILabel()
        labAnv.text = "Anv"
        labAnv.font = UIFont.HelTextFont(13)
        labAnv.textColor = UIColor.textColor()
        labAnv.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labAnv)
        
        editLabel = UITextField()
        editLabel.setMyStyle()
        editLabel.font = UIFont.HelTextFont(14)
        editLabel.textColor = UIColor.textColor()
        editLabel.delegate = self
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editLabel)
        
        labLabel = UILabel()
        labLabel.text = "Label"
        labLabel.font = UIFont.HelTextFont(13)
        labLabel.textColor = UIColor.textColor()
        labLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labLabel)
        
        editGenre = UITextField()
        editGenre.setMyStyle()
        editGenre.font = UIFont.HelTextFont(14)
        editGenre.textColor = UIColor.textColor()
        editGenre.delegate = self
        editGenre.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editGenre)
        
        labGenre = UILabel()
        labGenre.text = "Genre"
        labGenre.font = UIFont.HelTextFont(13)
        labGenre.textColor = UIColor.textColor()
        labGenre.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labGenre)
        
        editStyle = UITextField()
        editStyle.setMyStyle()
        editStyle.font = UIFont.HelTextFont(14)
        editStyle.textColor = UIColor.textColor()
        editStyle.delegate = self
        editStyle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editStyle)
        
        labStyle = UILabel()
        labStyle.text = "Style"
        labStyle.font = UIFont.HelTextFont(13)
        labStyle.textColor = UIColor.textColor()
        labStyle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labStyle)
        
        editFormat = UITextField()
        editFormat.setMyStyle()
        editFormat.font = UIFont.HelTextFont(14)
        editFormat.textColor = UIColor.textColor()
        editFormat.delegate = self
        editFormat.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editFormat)
        
        labFormat = UILabel()
        labFormat.text = "Format"
        labFormat.font = UIFont.HelTextFont(13)
        labFormat.textColor = UIColor.textColor()
        labFormat.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labFormat)
        
        editCountry = UITextField()
        editCountry.setMyStyle()
        editCountry.font = UIFont.HelTextFont(13)
        editCountry.textColor = UIColor.textColor()
        editCountry.delegate = self
        editCountry.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editCountry)
        
        labCountry = UILabel()
        labCountry.text = "Country"
        labCountry.font = UIFont.HelTextFont(13)
        labCountry.textColor = UIColor.textColor()
        labCountry.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labCountry)
        
        editYear = UITextField()
        editYear.setMyStyle()
        editYear.font = UIFont.HelTextFont(13)
        editYear.textColor = UIColor.textColor()
        editYear.delegate = self
        editYear.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editYear)
        
        labYear = UILabel()
        labYear.text = "Year"
        labYear.font = UIFont.HelTextFont(13)
        labYear.textColor = UIColor.textColor()
        labYear.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labYear)
        
        editCatno = UITextField()
        editCatno.setMyStyle()
        editCatno.font = UIFont.HelTextFont(13)
        editCatno.textColor = UIColor.textColor()
        editCatno.delegate = self
        editCatno.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editCatno)
        
        labCatno = UILabel()
        labCatno.text = "Catno"
        labCatno.font = UIFont.HelTextFont(13)
        labCatno.textColor = UIColor.textColor()
        labCatno.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labCatno)
        
        editBarcode = UITextField()
        editBarcode.setMyStyle()
        editBarcode.font = UIFont.HelTextFont(13)
        editBarcode.textColor = UIColor.textColor()
        editBarcode.delegate = self
        editBarcode.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editBarcode)
        
        labBarcode = UILabel()
        labBarcode.text = "Barcode"
        labBarcode.font = UIFont.HelTextFont(13)
        labBarcode.textColor = UIColor.textColor()
        labBarcode.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labBarcode)
        
        editTrack = UITextField()
        editTrack.setMyStyle()
        editTrack.font = UIFont.HelTextFont(13)
        editTrack.textColor = UIColor.textColor()
        editTrack.delegate = self
        editTrack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editTrack)
        
        labTrack = UILabel()
        labTrack.text = "Track"
        labTrack.font = UIFont.HelTextFont(13)
        labTrack.textColor = UIColor.textColor()
        labTrack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labTrack)
        
        editSubmitter = UITextField()
        editSubmitter.setMyStyle()
        editSubmitter.font = UIFont.HelTextFont(13)
        editSubmitter.textColor = UIColor.textColor()
        editSubmitter.delegate = self
        editSubmitter.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editSubmitter)
        
        labSubmitter = UILabel()
        labSubmitter.text = "Submitter"
        labSubmitter.font = UIFont.HelTextFont(13)
        labSubmitter.textColor = UIColor.textColor()
        labSubmitter.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labSubmitter)
        
        editContributor = UITextField()
        editContributor.setMyStyle()
        editContributor.font = UIFont.HelTextFont(13)
        editContributor.textColor = UIColor.textColor()
        editContributor.delegate = self
        editContributor.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editContributor)
        
        labContributor = UILabel()
        labContributor.text = "Contributor"
        labContributor.font = UIFont.HelTextFont(13)
        labContributor.textColor = UIColor.textColor()
        labContributor.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(labContributor)
        createLayuot()
        NSLayoutConstraint.activateConstraints(compactConstraint)
        
        dicParam = ["type": editType,
                    "title": editTitle,
                    "release_title": editReleaseTitle,
                    "credit": editCredit,
                    "artist": editArtist,
                    "anv": editAnv,
                    "label": editLabel,
                    "genre": editGenre,
                    "style": editStyle,
                    "country": editCountry,
                    "year": editYear,
                    "format": editFormat,
                    "catno": editCatno,
                    "barcode": editBarcode,
                    "track": editTrack,
                    "submitter": editSubmitter,
                    "contributor": editContributor]

        reloadDataEdit()
    }
    
    func reloadDataEdit() {
       
        for (key, value) in dicParam {
         (value as! UITextField).text = SearchParamManager.sharedManager.getParametr(key as! String) }
    }   
    
    func onReset(sender: UIButton) {
        
        for (key, _) in dicParam {
            SearchParamManager.sharedManager.delParametrSearch(key as! String) }
            reloadDataEdit()
    }
    
    func setContaintsV(dic: NSDictionary) {
       scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-[btn]-[Type(30)]-[Title(30)]-[ReleaseTitle(30)]-[Credit(30)]-[Artist(30)]-[Anv(30)]-[Label(30)]-[Genre(30)]-[Style(30)]-[Country(30)]-[Year(30)]-[Format(30)]-[Catno(30)]-[Barcode(30)]-[Track(30)]-[Submitter(30)]-[Contributor(30)]-|", options: [], metrics: nil, views: dic as! [String : AnyObject] ))
    }
    
    func createLayuot(){
        
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
        
        compactConstraint.append(NSLayoutConstraint(item: scrollView,
                           attribute: NSLayoutAttribute.Top,
                           relatedBy: NSLayoutRelation.Equal,
                           toItem: topLayoutGuide,
                           attribute: NSLayoutAttribute.Bottom,
                           multiplier: 1.0,
                           constant: 0))
        
        scrollView.snp_remakeConstraints { (make) -> Void in
            make.width.equalTo(view).offset(0)
            make.height.equalTo(view).offset(0) }
        
        btnCloseMenuOverlay.snp_remakeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.leading.equalTo(scrollView).offset(15) }
        
        btnResetAll.snp_remakeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.trailing.equalTo(scrollView).offset(-15) }
        

        
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

    }
    
    func setContaintsForTextField(arrTextF: [(UITextField, UILabel)]) {
      
        
        for textF in arrTextF {
        
            
            textF.1.snp_remakeConstraints { (make) -> Void in
                make.leading.equalTo(scrollView).offset(15)
                make.width.equalTo(100)
                make.trailing.equalTo(textF.0.snp_leading).offset(0) }
            
            textF.0.snp_remakeConstraints { (make) -> Void in
                make.trailing.equalTo(scrollView).offset(-15)
                make.leading.equalTo(textF.1.snp_trailing).offset(0)
                make.width.equalTo(scrollView).offset(-120) }
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
        
    SearchParamManager.sharedManager.setParametr(dicParam.map { (key, value) -> (String, String) in
        return (key as! String, (value as! UITextField).text!)
        })
    
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clearColor()
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
      })
    }
  }

extension FullSearchViewController: UITextFieldDelegate {
    
    

}