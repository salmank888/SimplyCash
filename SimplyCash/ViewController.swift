//
//  ViewController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 06/01/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var cardSelect: UIView!
    

    @IBOutlet weak var checkSelect: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cardTap = UITapGestureRecognizer(target: self, action: Selector("handleCardTap"))
        cardSelect.addGestureRecognizer(cardTap)
        
        let checkTap = UITapGestureRecognizer(target: self, action: Selector("handleCheckTap"))
        checkSelect.addGestureRecognizer(checkTap)
        
        self.navigationItem.hidesBackButton = true
        
    // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleCheckTap(){
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var ACH_MID = defaults.stringForKey("ACH_MID")
        var ACH_PROCESSOR = defaults.stringForKey("ACH_PROCESSOR")
        var ACH_GATEWAYID = defaults.stringForKey("ACH_GATEWAYID")
        var ACH_TRANSACTIONCENTERID = defaults.stringForKey("ACH_TRANSACTIONCENTERID")
        
        if ACH_MID == nil
        {
            ACH_MID = ""
            showDialoge("Please review ACH settings to continue", type: "ACH")
        }
        else if ACH_PROCESSOR == nil
        {
            ACH_PROCESSOR = ""
            showDialoge("Please review ACH settings to continue", type: "ACH")
        }
        else if ACH_GATEWAYID == nil
        {
            ACH_GATEWAYID = ""
            showDialoge("Please review ACH settings to continue", type: "ACH")
        }
        else if ACH_TRANSACTIONCENTERID == nil
        {
            ACH_TRANSACTIONCENTERID = ""
            showDialoge("Please review ACH settings to continue", type: "ACH")
        }
        else if ACH_MID!.characters.count > 0 && ACH_PROCESSOR!.characters.count > 0 && ACH_GATEWAYID!.characters.count > 0 && ACH_TRANSACTIONCENTERID!.characters.count > 0
        {
            self.performSegueWithIdentifier("Check_Segue", sender: self)
        }
        else
        {
            showDialoge("Please review ACH settings to continue", type: "ACH")
        }
    }
    
    func showDialoge(messageData : String, type : String)
    {
        let checkAlert = UIAlertController(title: "Alert", message: messageData, preferredStyle: UIAlertControllerStyle.Alert)
        
        checkAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { UIAlertAction -> Void in
            if(type == "ACH") {
            self.performSegueWithIdentifier("Main_ACH_Segue", sender:self)
            } else if(type == "Credit"){
            self.performSegueWithIdentifier("Main_Credit_Segue", sender:self)
            }
            }))
        
        self.presentViewController(checkAlert, animated: true, completion: nil)
    }
    
    
    func handleCardTap(){
        let defaults = NSUserDefaults.standardUserDefaults()
        var Credit_MID = defaults.stringForKey("Credit_MID")
        var Credit_PROCESSOR = defaults.stringForKey("Credit_PROCESSOR")
        var Credit_GATEWAYID = defaults.stringForKey("Credit_GATEWAYID")
        var Credit_TRANSACTIONCENTERID = defaults.stringForKey("Credit_TRANSACTIONCENTERID")
        var Credit_TID = defaults.stringForKey("Credit_TID")
        
        if Credit_MID == nil
        {
            Credit_MID = ""
            showDialoge("Please review Credit settings to continue", type: "Credit")
        }
        else if Credit_PROCESSOR == nil
        {
            Credit_PROCESSOR = ""
            showDialoge("Please review Credit settings to continue", type: "Credit")
        }
        else if Credit_GATEWAYID == nil
        {
           Credit_GATEWAYID = ""
            showDialoge("Please review Credit settings to continue", type: "Credit")
        }
        else if Credit_TRANSACTIONCENTERID == nil
        {
            Credit_TRANSACTIONCENTERID = ""
            showDialoge("Please review Credit settings to continue", type: "Credit")
        }
        else if Credit_TID == nil
        {
            Credit_TID = ""
            showDialoge("Please review Credit settings to continue", type: "Credit")
        }
        else if Credit_MID!.characters.count > 0 && Credit_PROCESSOR!.characters.count > 0 && Credit_GATEWAYID!.characters.count > 0 && Credit_TRANSACTIONCENTERID!.characters.count > 0 && Credit_TID!.characters.count > 0
        {
            self.performSegueWithIdentifier("Credit_Segue", sender: self)
        }
        else
        {
            showDialoge("Please review Credit settings to continue", type: "Credit")
        }
        
    }


}

