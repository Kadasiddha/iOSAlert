//
//  ViewController.swift
//  iOSAlert
//
//  Created by Kadasiddha Kullolli on 01/08/15.
//  Copyright (c) 2015 Kadasiddha Kullolli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Taking height and width of the screen
    var height = UIScreen.mainScreen().bounds.size.height;
    var width = UIScreen.mainScreen().bounds.size.width;
    
    var overlayHideView: UIView!
    var alertView: UIView!
    var verifyText = UITextField()
    var overlayView: UIView!


    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // OK button action on the alert view
    func buttonOKClicked()
    {
        buttonOne.enabled = true
        buttonTwo.enabled = true
        buttonThree.enabled = true
        buttonFour.enabled = true
        
        UIView.animateWithDuration(0.4, animations: {
           // self.overlayHideView.alpha = 0.0
            }, completion: {
                (value: Bool) in
                self.alertView.removeFromSuperview()
                self.alertView = nil
        })
        //alertView.removeFromSuperview()
        
        //overlayHideView.removeFromSuperview()
        
    }
    
    // Cancel button action on the alert view
    
    func buttonCancelClicked() {
        
        buttonOne.enabled = true
        buttonTwo.enabled = true
        buttonThree.enabled = true
        buttonFour.enabled = true
        
        
        UIView.animateWithDuration(0.4, animations: {
            //self.overlayHideView.alpha = 0.0
            }, completion: {
                (value: Bool) in
                self.alertView.removeFromSuperview()
                self.alertView = nil
        })
       // alertView.removeFromSuperview()
        //overlayHideView.removeFromSuperview()
        
    }
    
    // Creating the alert view
    func createSimpleAlertView(messageText: String,btnOneLbl: String, btnSecondLbl:String) {
        
        var alertWidth: CGFloat = CGFloat()
        var alertHeight: CGFloat = CGFloat()
        var yAxis: CGFloat = CGFloat()
        var xAxis:CGFloat = CGFloat()
        if (height == 480)
        {
            xAxis = 20
            yAxis = 200
            alertWidth = 280
            alertHeight = 120
        }
        else if (height == 568)
        {
            xAxis = 20
            yAxis = 200
            alertWidth = 280
            alertHeight = 120
        }
        else if (height == 667)
        {
            xAxis = 35
            yAxis = 300
            alertWidth = 300
            alertHeight = 120
        }
        else if (height == 736)
        {
            xAxis = 60
            yAxis = 300
            
            alertWidth = 300
            alertHeight = 120
        }
        
        let alertViewFrame: CGRect = CGRectMake(xAxis, yAxis, alertWidth, alertHeight)
        
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.whiteColor()
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 10;
        alertView.layer.shadowColor = UIColor.blackColor().CGColor;
        alertView.layer.borderWidth = 0.5
        
        let alertTextView = UIView(frame: CGRectMake(0, 0, alertWidth, ((alertHeight / 2) + 20)))
        alertTextView.backgroundColor = UIColor.whiteColor()
        alertTextView.layer.cornerRadius = 10;
        let alertText = UILabel(frame: CGRectMake(0, 20, alertWidth, 20))
        alertText.textAlignment = NSTextAlignment.Center
        alertText.textColor = UIColor.blackColor()
        alertText.font = UIFont(name: "Gotham", size: 14)
        alertText.text = messageText
        
        let lineSperatorAlert = UILabel(frame: CGRectMake(0, ((alertHeight / 2) + 20), alertWidth, 0.5))
        lineSperatorAlert.backgroundColor = UIColor.blackColor()
        lineSperatorAlert.alpha = 0.2
        
        alertTextView.addSubview(lineSperatorAlert)
        alertTextView.addSubview(alertText)
        
        
        
        
        let btnLog = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnLog.setTitle("\(btnOneLbl)", forState: UIControlState.Normal)
        btnLog.titleLabel?.font = UIFont(name: "Gotham-Bold", size: 14)
        btnLog.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        btnLog.tintColor = UIColor.blueColor()
        btnLog.frame = CGRectMake(0, ((alertHeight / 2) + 18), (alertWidth / 2), 45)
        btnLog.addTarget(self, action: Selector("buttonOKClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let btnCancel = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnCancel.setTitle("\(btnSecondLbl)", forState: UIControlState.Normal)
        btnCancel.titleLabel?.font = UIFont(name: "Gotham-Bold", size: 14)
        btnCancel.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
        btnCancel.backgroundColor = UIColor.clearColor()
        btnCancel.frame = CGRectMake(145, ((alertHeight / 2) + 18), (alertWidth / 2), 45)
        
        btnCancel.addTarget(self, action: Selector("buttonCancelClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let lineSperatorForButton = UILabel(frame: CGRectMake((alertWidth / 2), ((alertHeight / 2) + 20), 0.5, ((alertHeight / 2) - 20 )))
        lineSperatorForButton.backgroundColor = UIColor.blackColor()
        lineSperatorForButton.alpha = 0.2
        alertView.addSubview(lineSperatorForButton)
        alertView.addSubview(btnCancel)
        alertView.addSubview(btnLog)
        alertView.addSubview(alertTextView)
        view.addSubview(alertView)
    }
    
    
    // Creating the alert view
    func createDifferentColorAlertView(messageText: String,btnOneLbl: String, btnSecondLbl:String) {
        
        var alertWidth: CGFloat = CGFloat()
        var alertHeight: CGFloat = CGFloat()
        var yAxis: CGFloat = CGFloat()
        var xAxis:CGFloat = CGFloat()
        if (height == 480)
        {
            xAxis = 20
            yAxis = 200
            alertWidth = 280
            alertHeight = 120
        }
        else if (height == 568)
        {
            xAxis = 20
            yAxis = 200
            alertWidth = 280
            alertHeight = 120
        }
        else if (height == 667)
        {
            xAxis = 35
            yAxis = 300
            alertWidth = 300
            alertHeight = 120
        }
        else if (height == 736)
        {
            xAxis = 60
            yAxis = 300
            
            alertWidth = 300
            alertHeight = 120
        }
        
        let alertViewFrame: CGRect = CGRectMake(xAxis, yAxis, alertWidth, alertHeight)
        
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.whiteColor()
        alertView.alpha = 0.0
        //alertView.layer.cornerRadius = 10;
        alertView.layer.shadowColor = UIColor.blackColor().CGColor;
        alertView.layer.borderWidth = 0.5
        
        let alertTextView = UIView(frame: CGRectMake(0, 0, alertWidth, ((alertHeight / 2) + 20)))
        alertTextView.backgroundColor = UIColor.whiteColor()
        //alertTextView.layer.cornerRadius = 10;
        let alertText = UILabel(frame: CGRectMake(0, 20, alertWidth, 20))
        alertText.textAlignment = NSTextAlignment.Center
        alertText.textColor = UIColor.blackColor()
        alertText.font = UIFont(name: "Gotham", size: 14)
        alertText.text = messageText
        
        let lineSperatorAlert = UILabel(frame: CGRectMake(0, ((alertHeight / 2) + 20), alertWidth, 0.5))
        lineSperatorAlert.backgroundColor = UIColor.blackColor()
        lineSperatorAlert.alpha = 0.2
        
        alertTextView.addSubview(lineSperatorAlert)
        alertTextView.addSubview(alertText)
        
        
        
        
        let btnLog = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnLog.setTitle("\(btnOneLbl)", forState: UIControlState.Normal)
        btnLog.titleLabel?.font = UIFont(name: "Gotham-Bold", size: 14)
        btnLog.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btnLog.backgroundColor = UIColor.blueColor()
        btnLog.tintColor = UIColor.blueColor()
        btnLog.frame = CGRectMake(0, ((alertHeight / 2) + 15), (alertWidth / 2), 45)
        btnLog.addTarget(self, action: Selector("buttonOKClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        //btnLog.layer.cornerRadius = 10;
        let btnCancel = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnCancel.setTitle("\(btnSecondLbl)", forState: UIControlState.Normal)
        btnCancel.titleLabel?.font = UIFont(name: "Gotham-Bold", size: 14)
        btnCancel.setTitleColor(UIColor.brownColor(), forState: UIControlState.Normal)
        //btnCancel.layer.cornerRadius = 10;
        btnCancel.backgroundColor = UIColor.purpleColor()
        btnCancel.frame = CGRectMake(145, ((alertHeight / 2) + 15), (alertWidth / 2) + 5, 45)
        
        btnCancel.addTarget(self, action: Selector("buttonCancelClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let lineSperatorForButton = UILabel(frame: CGRectMake((alertWidth / 2), ((alertHeight / 2) + 20), 0.5, ((alertHeight / 2) - 20 )))
        lineSperatorForButton.backgroundColor = UIColor.blackColor()
        lineSperatorForButton.alpha = 0.2
        alertView.addSubview(lineSperatorForButton)
        alertView.addSubview(btnCancel)
        alertView.addSubview(btnLog)
        alertView.addSubview(alertTextView)
        view.addSubview(alertView)
    }

    
//    // Creating background view for alert
//    
//    func createAlertBackgroundView() {
//        
//        overlayHideView = UIView(frame: view.bounds)
//        overlayHideView.backgroundColor = UIColor.blackColor()
//        overlayHideView.alpha = 0.4
//        view.addSubview(overlayHideView)
//    }
//    
  
    @IBAction func buttonDifferentColorAlertView(sender: AnyObject) {
        buttonOne.enabled = false
        buttonThree.enabled = false
        buttonTwo.enabled = false
        buttonFour.enabled = false
        //self.createAlertBackgroundView()
        if (alertView == nil) {
            createDifferentColorAlertView("Button with different color",btnOneLbl: "OK",btnSecondLbl: "CANCEL")
        }
        
        alertView.alpha = 1.0
    }
    // Button action on the view controller
    @IBAction func buttonSimpleAlertView(sender: AnyObject) {
        buttonOne.enabled = false
        buttonTwo.enabled = false
        buttonThree.enabled = false
        buttonFour.enabled = false

        //self.createAlertBackgroundView()
        if (alertView == nil) {
            createSimpleAlertView("This is simple alert view",btnOneLbl: "OK",btnSecondLbl: "CANCEL")
        }
        
        alertView.alpha = 1.0
        
    }
    
    @IBAction func buttonround(sender: AnyObject) {
        buttonOne.enabled = false
        buttonTwo.enabled = false
        buttonThree.enabled = false
        buttonFour.enabled = false

        //self.createAlertBackgroundView()
        if (alertView == nil) {
            createroundEdgeColorAlertView("Round edge alert box",btnOneLbl: "OK",btnSecondLbl: "CANCEL")
        }
        
        alertView.alpha = 1.0
        
    }
    
    
    // Creating the alert view
    func createroundEdgeColorAlertView(messageText: String,btnOneLbl: String, btnSecondLbl:String) {
        
        var alertWidth: CGFloat = CGFloat()
        var alertHeight: CGFloat = CGFloat()
        var yAxis: CGFloat = CGFloat()
        var xAxis:CGFloat = CGFloat()
        if (height == 480)
        {
            xAxis = 20
            yAxis = 200
            alertWidth = 280
            alertHeight = 120
        }
        else if (height == 568)
        {
            xAxis = 20
            yAxis = 200
            alertWidth = 280
            alertHeight = 120
        }
        else if (height == 667)
        {
            xAxis = 35
            yAxis = 300
            alertWidth = 300
            alertHeight = 120
        }
        else if (height == 736)
        {
            xAxis = 60
            yAxis = 300
            
            alertWidth = 300
            alertHeight = 120
        }
        
        let alertViewFrame: CGRect = CGRectMake(xAxis, yAxis, alertWidth, alertHeight)
        
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.purpleColor()
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 10;
        alertView.layer.shadowColor = UIColor.blackColor().CGColor;
        alertView.layer.borderWidth = 0.5
        
        let alertTextView = UIView(frame: CGRectMake(0, 0, alertWidth, ((alertHeight / 2) + 20)))
        alertTextView.backgroundColor = UIColor.purpleColor()
        alertTextView.layer.cornerRadius = 10;
        let alertText = UILabel(frame: CGRectMake(0, 20, alertWidth, 20))
        alertText.textAlignment = NSTextAlignment.Center
        alertText.textColor = UIColor.whiteColor()
        alertText.font = UIFont(name: "Gotham", size: 14)
        alertText.text = messageText
        
        let lineSperatorAlert = UILabel(frame: CGRectMake(0, ((alertHeight / 2) + 20), alertWidth, 0.5))
        lineSperatorAlert.backgroundColor = UIColor.blackColor()
        lineSperatorAlert.alpha = 0.2
        
        alertTextView.addSubview(lineSperatorAlert)
        alertTextView.addSubview(alertText)
        
        
        
        
        let btnLog = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnLog.setTitle("\(btnOneLbl)", forState: UIControlState.Normal)
        btnLog.titleLabel?.font = UIFont(name: "Gotham-Bold", size: 14)
        btnLog.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        btnLog.backgroundColor = UIColor.clearColor()
        btnLog.tintColor = UIColor.blueColor()
        btnLog.frame = CGRectMake(0, ((alertHeight / 2) + 15), (alertWidth / 2), 45)
        btnLog.addTarget(self, action: Selector("buttonOKClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        //btnLog.layer.cornerRadius = 10;
        let btnCancel = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnCancel.setTitle("\(btnSecondLbl)", forState: UIControlState.Normal)
        btnCancel.titleLabel?.font = UIFont(name: "Gotham-Bold", size: 14)
        btnCancel.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        //btnCancel.layer.cornerRadius = 10;
        btnCancel.backgroundColor = UIColor.clearColor()
        btnCancel.frame = CGRectMake(145, ((alertHeight / 2) + 15), (alertWidth / 2) + 5, 45)
        
        btnCancel.addTarget(self, action: Selector("buttonCancelClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let lineSperatorForButton = UILabel(frame: CGRectMake((alertWidth / 2), ((alertHeight / 2) + 20), 0.5, ((alertHeight / 2) - 20 )))
        lineSperatorForButton.backgroundColor = UIColor.blackColor()
        lineSperatorForButton.alpha = 0.2
        alertView.addSubview(lineSperatorForButton)
        alertView.addSubview(btnCancel)
        alertView.addSubview(btnLog)
        alertView.addSubview(alertTextView)
        view.addSubview(alertView)
    }

    @IBAction func buttonPINCodeClicked(sender: AnyObject) {
        self.verifyText.becomeFirstResponder()
        self.createOverlay()
        if (self.alertView == nil) {
            self.createVerifyAccount("Verify Account",btnOneLbl: "CANCEL",btnSecondLbl: "SUBMIT",lblAlert: 0 )
        }
        
        // Animate in the overlay
        UIView.animateWithDuration(0.4) {
            self.overlayView.alpha = 0.7
        }
        
        // Animate the alert view using UIKit Dynamics.
        self.alertView.alpha = 1.0
    }
    
    func createVerifyAccount(messageText: String,btnOneLbl: String, btnSecondLbl:String, lblAlert: Int) {
        
        var alertWidth: CGFloat = CGFloat()
        var alertHeight: CGFloat = CGFloat()
        var yAxis: CGFloat = CGFloat()
        var xAxis:CGFloat = CGFloat()
        if (height == 480)
        {
            xAxis = 20
            yAxis = 43
            alertWidth = 280
            alertHeight = 180
        }
        else if (height == 568)
        {
            xAxis = 20
            yAxis = 85
            alertWidth = 280
            alertHeight = 180
        }
        else if (height == 667)
        {
            xAxis = 37
            yAxis = 130
            alertWidth = 300
            alertHeight = 190
        }
        else if (height == 736)
        {
            xAxis = 57
            yAxis = 160
            
            alertWidth = 300
            alertHeight = 190
        }
        
        let alertViewFrame: CGRect = CGRectMake(xAxis, yAxis, alertWidth, alertHeight)
        
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.whiteColor()
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 10;
        
        
        let backviewtop = UIView(frame: CGRectMake(0, 0, alertWidth, ((alertHeight / 2) + 50)))
        backviewtop.backgroundColor = UIColor.whiteColor()
        backviewtop.layer.cornerRadius = 10;
        
        
        let verifyTitle = UILabel(frame: CGRectMake(0, 20, alertWidth, 22))
        verifyTitle.textAlignment = NSTextAlignment.Center
        verifyTitle.textColor = UIColor.blackColor()
        verifyTitle.font = UIFont(name: "Gotham-Book", size: 20)
        verifyTitle.text = messageText
        let verifyLabel = UILabel(frame: CGRectMake(16, 70, alertWidth, 20))
        verifyLabel.font = UIFont(name: "Gotham", size: 12)
        
        
        verifyText = UITextField(frame: CGRectMake(10, 92, (alertWidth - 20), 35))
        verifyText.becomeFirstResponder()
        verifyText.keyboardType = UIKeyboardType.NumberPad
        verifyText.secureTextEntry = true
        verifyText.keyboardAppearance = UIKeyboardAppearance.Light
        verifyText.borderStyle = UITextBorderStyle.RoundedRect
        //verifyText.layer.cornerRadius = 1.0
        //verifyText.layer.borderWidth = 0.5
        verifyText.textAlignment = NSTextAlignment.Left
        verifyText.placeholder = "PIN code"
        
        verifyText.font = UIFont(name: "Gotham", size: 14)
        verifyText.textColor = UIColor.blackColor()
        verifyText.layer.borderWidth = 0.8
        verifyText.layer.cornerRadius = 5.0
        verifyLabel.textAlignment = NSTextAlignment.Left
        if lblAlert == 0
        {
            
            
            self.verifyText.layer.borderColor = UIColor.grayColor().CGColor
            verifyLabel.textColor = UIColor.grayColor()
            verifyLabel.text = "ENTER YOUR PIN CODE"
        }
        else
        {
            self.verifyText.layer.borderColor = UIColor(red:0.93, green:0.45, blue:0.45, alpha:1.0).CGColor
            
            verifyLabel.textColor = UIColor(red:0.93, green:0.45, blue:0.45, alpha:1.0)
            verifyLabel.text = "INVALID PIN CODE"
        }
        
        
        
        //verifyText.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        let lineSperatorAlert = UILabel(frame: CGRectMake(0, ((alertHeight / 2) + 50), alertWidth, 0.5))
        lineSperatorAlert.backgroundColor = UIColor.blackColor()
        lineSperatorAlert.alpha = 0.2
        
        backviewtop.addSubview(lineSperatorAlert)
        backviewtop.addSubview(verifyTitle)
        backviewtop.addSubview(verifyLabel)
        backviewtop.addSubview(verifyText)
        
        
        
        
        let btnLog = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnLog.setTitle("\(btnOneLbl)", forState: UIControlState.Normal)
        btnLog.titleLabel?.font = UIFont(name: "Gotham-Bold", size: 14)
        btnLog.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        //var likeimg = UIImage(named: "like.png")
        //btnlike.setImage(likeimg, forState: UIControlState.Normal)
        btnLog.tintColor = UIColor.blueColor()
        btnLog.frame = CGRectMake(0, ((alertHeight / 2) + 50), (alertWidth / 2), 45)
        btnLog.addTarget(self, action: Selector("buttonPINCancelClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let btnCancel = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnCancel.setTitle("\(btnSecondLbl)", forState: UIControlState.Normal)
        btnCancel.titleLabel?.font = UIFont(name: "Gotham-Bold", size: 14)
        btnCancel.setTitleColor(UIColor(red:0.04, green:0.51, blue:0.67, alpha:1.0), forState: UIControlState.Normal)
        //var shareimg = UIImage(named: "share.png")
        //btnshare.setImage(shareimg, forState: UIControlState.Normal)
        btnCancel.backgroundColor = UIColor.clearColor()
        btnCancel.frame = CGRectMake(145, ((alertHeight / 2) + 50), (alertWidth / 2), 45)
        
        btnCancel.addTarget(self, action: Selector("buttonSubmitClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let lineSperatorForButton = UILabel(frame: CGRectMake((alertWidth / 2), ((alertHeight / 2) + 50), 0.5, ((alertHeight / 2) - 50 )))
        lineSperatorForButton.backgroundColor = UIColor.blackColor()
        lineSperatorForButton.alpha = 0.2
        alertView.addSubview(lineSperatorForButton)
        alertView.addSubview(btnCancel)
        alertView.addSubview(btnLog)
        alertView.addSubview(backviewtop)
        view.addSubview(alertView)
    }

    func createOverlay() {
        // Create a gray view and set its alpha to 0 so it isn't visible
        overlayView = UIView(frame: view.bounds)
        overlayView.backgroundColor = UIColor.blackColor()
        overlayView.alpha = 0.7
        view.addSubview(overlayView)
    }

    func buttonSubmitClicked() {
        
       
            
            verifyText.userInteractionEnabled = true
        
            
            overlayView.removeFromSuperview()
            
            UIView.animateWithDuration(0.4, animations: {
                self.overlayView.alpha = 0.0
                }, completion: {
                    (value: Bool) in
                    self.alertView.removeFromSuperview()
                    self.alertView = nil
            })
            println("\(verifyText.text)")
            
               
    }
    
    // Cancel button action on the alert view
    
    func buttonPINCancelClicked() {
        
        buttonOne.enabled = true
        buttonTwo.enabled = true
        buttonThree.enabled = true
        buttonFour.enabled = true
        
        overlayView.removeFromSuperview()
        
        UIView.animateWithDuration(0.4, animations: {
            self.overlayView.alpha = 0.0
            }, completion: {
                (value: Bool) in
                self.alertView.removeFromSuperview()
                self.alertView = nil
        })

        
    }

    
}

