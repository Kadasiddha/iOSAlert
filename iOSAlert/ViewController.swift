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
        
        
        overlayHideView.removeFromSuperview()
        
        UIView.animateWithDuration(0.4, animations: {
            self.overlayHideView.alpha = 0.0
            }, completion: {
                (value: Bool) in
                self.alertView.removeFromSuperview()
                self.alertView = nil
        })
        
    }
    
    // Cancel button action on the alert view
    
    func buttonCancelClicked() {
        
        
        overlayHideView.removeFromSuperview()
        
        UIView.animateWithDuration(0.4, animations: {
            self.overlayHideView.alpha = 0.0
            }, completion: {
                (value: Bool) in
                self.alertView.removeFromSuperview()
                self.alertView = nil
        })
        
    }
    
    // Creating the alert view
    func createAlertView(messageText: String,btnOneLbl: String, btnSecondLbl:String) {
        
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
    
    // Creating background view for alert
    
    func createAlertBackgroundView() {
        
        overlayHideView = UIView(frame: view.bounds)
        overlayHideView.backgroundColor = UIColor.blackColor()
        overlayHideView.alpha = 0.7
        view.addSubview(overlayHideView)
    }
    
    // Button action on the view controller
    @IBAction func buttonSimpleAlertView(sender: AnyObject) {
        
        self.createAlertBackgroundView()
        if (alertView == nil) {
            createAlertView("This is simple alert view",btnOneLbl: "OK",btnSecondLbl: "CANCEL")
        }
        
        alertView.alpha = 1.0
        
    }
    
}

