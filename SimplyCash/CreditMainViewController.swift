//
//  CreditMainViewController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 02/03/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
import MediaPlayer
import Foundation

class CreditMainViewController: UIViewController {
    
    var uniMagViewController: UniMagViewController = UniMagViewController()
    var alertController: UIAlertController = UIAlertController()
    let swipeCard = "Please Swipe Card"
    let poweringReader = "Powering Up Card Reader"
    @IBOutlet weak var swipeBtnOutlet: UIButton!


    @IBAction func creditTransactionType(sender: AnyObject) {
        
        if sender.selectedSegmentIndex == 0
        {
            JLToast.makeText("Sale", duration: 3).show()
            
            ccLabel.text = "Credit Card Number"
            ccVal.placeholder = "credit card number"

            
            ccExpiryLabel.hidden = false
            ccExpVal.hidden = false
            ccExpUnderline.hidden = false
            
            cvvLabel.hidden = false
            cvvVal.hidden = false
            cvvUnderline.hidden = false
            
            orderIdLabel.hidden = false
            orderIdVal.hidden = false
            orderIdUnderline.hidden = false
            
            ownerNameLabel.hidden = false
            ownerNameVal.hidden = false
            ownerNameUnderline.hidden = false
            
            recurringNumberLabel.hidden = true
            recurringNumberVal.hidden = true
            recurringNumberUnderline.hidden = true
            
            startDateLabel.hidden = true
            startDateVal.hidden = true
            recurringDateUnderline.hidden = true
            
            recurringTypeLabel.hidden = true
            recurringTypeVal.hidden = true
            recurringTypeUnderline.hidden = true
            
            endDateLabel.hidden = true
            endDateVal.hidden = true
            endDateUnderline.hidden = true
            
            
            
        } else if sender.selectedSegmentIndex == 1
        {
            JLToast.makeText("Void", duration: 3).show()
            
            ccLabel.text = "Reference/Transaction Number"
            ccVal.placeholder = "reference number"
            
            ccLabel.text = "Credit Card Number"
            ccVal.placeholder = "credit card number"
            
            ccExpiryLabel.hidden = true
            ccExpVal.hidden = true
            ccExpUnderline.hidden = true
            
            cvvLabel.hidden = true
            cvvVal.hidden = true
            cvvUnderline.hidden = true
            
            orderIdLabel.hidden = true
            orderIdVal.hidden = true
            orderIdUnderline.hidden = true
            
            ownerNameLabel.hidden = true
            ownerNameVal.hidden = true
            ownerNameUnderline.hidden = true
            
            recurringNumberLabel.hidden = true
            recurringNumberVal.hidden = true
            recurringNumberUnderline.hidden = true
            
            startDateLabel.hidden = true
            startDateVal.hidden = true
            recurringDateUnderline.hidden = true
            
            recurringTypeLabel.hidden = true
            recurringTypeVal.hidden = true
            recurringTypeUnderline.hidden = true
            
            endDateLabel.hidden = true
            endDateVal.hidden = true
            endDateUnderline.hidden = true
 
        } else if sender.selectedSegmentIndex == 2
        {
            JLToast.makeText("PreAuth", duration: 3).show()
            
            ccLabel.text = "Credit Card Number"
            ccVal.placeholder = "credit card number"
            
            ccExpiryLabel.hidden = false
            ccExpVal.hidden = false
            ccExpUnderline.hidden = false
            
            cvvLabel.hidden = false
            cvvVal.hidden = false
            cvvUnderline.hidden = false
            
            orderIdLabel.hidden = false
            orderIdVal.hidden = false
            orderIdUnderline.hidden = false
            
            ownerNameLabel.hidden = false
            ownerNameVal.hidden = false
            ownerNameUnderline.hidden = false
            
            recurringNumberLabel.hidden = false
            recurringNumberVal.hidden = false
            recurringNumberUnderline.hidden = false
            
            startDateLabel.hidden = false
            startDateVal.hidden = false
            recurringDateUnderline.hidden = false
            
            recurringTypeLabel.hidden = false
            recurringTypeVal.hidden = false
            recurringTypeUnderline.hidden = false
            
            endDateLabel.hidden = false
            endDateVal.hidden = false
            endDateUnderline.hidden = false
            

        } else if sender.selectedSegmentIndex == 3
        {
            JLToast.makeText("Recurring", duration: 3).show()
            
            ccLabel.text = "Credit Card Number"
            ccVal.placeholder = "credit card number"
            
            ccExpiryLabel.hidden = false
            ccExpVal.hidden = false
            ccExpUnderline.hidden = false
            
            cvvLabel.hidden = false
            cvvVal.hidden = false
            cvvUnderline.hidden = false
            
            orderIdLabel.hidden = false
            orderIdVal.hidden = false
            orderIdUnderline.hidden = false
            
            ownerNameLabel.hidden = false
            ownerNameVal.hidden = false
            ownerNameUnderline.hidden = false
            
            recurringNumberLabel.hidden = false
            recurringNumberVal.hidden = false
            recurringNumberUnderline.hidden = false
            
            startDateLabel.hidden = false
            startDateVal.hidden = false
            recurringDateUnderline.hidden = false
            
            recurringTypeLabel.hidden = false
            recurringTypeVal.hidden = false
            recurringTypeUnderline.hidden = false
            
            endDateLabel.hidden = false
            endDateVal.hidden = false
            endDateUnderline.hidden = false

        }
    }
    
   
    @IBAction func swipeBtn(sender: AnyObject) {
        
        uniMagViewController.swipeCard()

        
    }
    
    @IBAction func scanBtn(sender: AnyObject) {
    }
    
    @IBAction func submitBtn(sender: AnyObject) {
    }
    
    
    
    @IBOutlet weak var saleAmountLabel: UILabel!

    @IBOutlet weak var saleAmountVal: UITextField!
    
    @IBOutlet weak var saleUnderline: UIView!
    
    @IBOutlet weak var ccLabel: UILabel!
    
    @IBOutlet weak var ccVal: UITextField!
    
    @IBOutlet weak var ccUnderline: UIView!
    
    @IBOutlet weak var ccExpiryLabel: UILabel!
    
    @IBOutlet weak var ccExpVal: UITextField!
    
    @IBOutlet weak var ccExpUnderline: UIView!
    
    @IBOutlet weak var cvvLabel: UILabel!
    
    @IBOutlet weak var cvvVal: UITextField!
    
    @IBOutlet weak var cvvUnderline: UIView!
    
    @IBOutlet weak var orderIdLabel: UILabel!
    
    @IBOutlet weak var orderIdVal: UITextField!
    
    @IBOutlet weak var orderIdUnderline: UIView!
    
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    @IBOutlet weak var ownerNameVal: UITextField!
    
    @IBOutlet weak var ownerNameUnderline: UIView!
    
    @IBOutlet weak var recurringNumberLabel: UILabel!
    
    @IBOutlet weak var recurringNumberVal
    : UITextField!
    
    @IBOutlet weak var recurringNumberUnderline: UIView!
    
    @IBOutlet weak var startDateLabel: UILabel!
    
    @IBOutlet weak var startDateVal: UITextField!
    
    @IBOutlet weak var recurringDateUnderline: UIView!
    
    @IBOutlet weak var recurringTypeLabel: UILabel!
    
    @IBOutlet weak var recurringTypeVal: UITextField!
    
    @IBOutlet weak var recurringTypeUnderline: UIView!
    
    @IBOutlet weak var endDateLabel: UILabel!
    
    @IBOutlet weak var endDateVal: UITextField!
    
    @IBOutlet weak var endDateUnderline: UIView!
    
    
    override func viewWillAppear(animated: Bool) {
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "uniMagConnected:", name: uniMagDidConnectNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "swipeReceived:", name: uniMagDidReceiveDataNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceAttachment:", name: uniMagAttachmentNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceDetachment:", name: uniMagDetachmentNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "connectionLowVolume:", name: uniMagMonoAudioErrorNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "connectionStarting:", name: uniMagPoweringNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ConnectionTimeout:", name: uniMagTimeoutNotification, object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "uniMagDisconnected:", name: uniMagDidDisconnectNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "swipeStarting:", name: uniMagSwipeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "swipeTimeout:", name: uniMagTimeoutSwipeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dataProcessing:", name: uniMagDataProcessingNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "swipeInvalid:", name: uniMagInvalidSwipeNotification, object: nil)
        
        
        uniMagViewController.umsdk_activate()
        //uniMagViewController.connectReader()
        print("umsdk activate")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        swipeBtnOutlet.enabled = false
       
        
        ccLabel.text = "Credit Card Number"
        ccVal.placeholder = "credit card number"
        
        
        ccExpiryLabel.hidden = false
        ccExpVal.hidden = false
        ccExpUnderline.hidden = false
        
        cvvLabel.hidden = false
        cvvVal.hidden = false
        cvvUnderline.hidden = false
        
        orderIdLabel.hidden = false
        orderIdVal.hidden = false
        orderIdUnderline.hidden = false
        
        ownerNameLabel.hidden = false
        ownerNameVal.hidden = false
        ownerNameUnderline.hidden = false
        
        recurringNumberLabel.hidden = true
        recurringNumberVal.hidden = true
        recurringNumberUnderline.hidden = true
        
        startDateLabel.hidden = true
        startDateVal.hidden = true
        recurringDateUnderline.hidden = true
        
        recurringTypeLabel.hidden = true
        recurringTypeVal.hidden = true
        recurringTypeUnderline.hidden = true
        
        endDateLabel.hidden = true
        endDateVal.hidden = true
        endDateUnderline.hidden = true

        uniMagViewController.connectReader()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func uniMagConnected(notification: NSNotification) {
        dismissAlertView()
        JLToast.makeText("Reader Connected", duration: 3).show()
        swipeBtnOutlet.enabled = true

    }
    func swipeReceived(notification: NSNotification) {
        
       
            
                let data = notification.object as! NSData
                let msg : Dictionary<String, String> = self.uniMagViewController.getData(data) as NSDictionary as! Dictionary
                 do{
                    try DataMining(msg)
            
        }
        catch{
            print("caught: \(error)")

        }

    }
    
    func deviceAttachment(notification: NSNotification) {
        uniMagViewController.connectReader()
    }
    
    func deviceDetachment(notification: NSNotification) {
        JLToast.makeText("Reader Detached", duration: 3).show()
    }
    
    func connectionLowVolume(notification: NSNotification) {
        print("connectionLowVolume")
    }
    func connectionStarting(notification: NSNotification) {
        showAlertView("Alert!", _message: poweringReader)
        print("connectionStarting")
    }
    
    func ConnectionTimeout(notification: NSNotification) {
        dismissAlertView()
        JLToast.makeText("Connection Timed Out", duration: 3).show()

    }
    func uniMagDisconnected(notification: NSNotification) {
        JLToast.makeText("Reader Disconnected", duration: 3).show()
        swipeBtnOutlet.enabled = true
    }
    
    func swipeStarting(notification: NSNotification) {
        showAlertView("Alert!", _message: swipeCard)
        print("swipeStarting")
    }
    func swipeTimeout(notification: NSNotification) {
        dismissAlertView()
        JLToast.makeText("Swipe Timed Out", duration: 3).show()

    }
    
    func dataProcessing(notification: NSNotification) {
        print("dataProcessing")
    }
    func swipeInvalid(notification: NSNotification) {
        JLToast.makeText("Invalid Swipe", duration: 3).show()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

   private func DataMining(dictionary : Dictionary<String, String>) throws {
    print(dictionary["Track1"]?.componentsSeparatedByString("^"))
    
    self.ccVal.text = dictionary["Track1"]?.componentsSeparatedByString("^")[0].substringWithRange(Range<String.Index>(start: (dictionary["Track1"]?.componentsSeparatedByString("^")[0].startIndex.advancedBy(2))! , end: (dictionary["Track1"]?.componentsSeparatedByString("^")[0].startIndex.advancedBy(((dictionary["Track1"]?.componentsSeparatedByString("^")[0].characters.count)!)))!))
    
    
    self.ccExpVal.text = (dictionary["Track1"]?.componentsSeparatedByString("^")[2].substringWithRange(Range<String.Index>(start: (dictionary["Track1"]?.componentsSeparatedByString("^")[2].startIndex.advancedBy(2))! , end: (dictionary["Track1"]?.componentsSeparatedByString("^")[2].startIndex.advancedBy(4))!)))! + (dictionary["Track1"]?.componentsSeparatedByString("^")[2].substringWithRange(Range<String.Index>(start: (dictionary["Track1"]?.componentsSeparatedByString("^")[2].startIndex.advancedBy(0))! , end: (dictionary["Track1"]?.componentsSeparatedByString("^")[2].startIndex.advancedBy(2))!)))!
    
    self.ownerNameVal.text  = dictionary["Track1"]?.componentsSeparatedByString("^")[1].stringByTrimmingCharactersInSet(
        NSCharacterSet.whitespaceAndNewlineCharacterSet())
    
    //        self.textViewForData.text = msg
    //        DataMining(msg)
    self.dismissAlertView()

           }
    
    
    private func showAlertView(let _title : String, let _message : String){
        
         alertController = UIAlertController(title: _title, message:
            _message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive, handler:  {UIAlertAction -> Void in
            if _message == self.swipeCard{
               self.uniMagViewController.cancelTask()
            }
            else if _message == self.poweringReader{
                self.uniMagViewController.cancelTask()
            }
            
        }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func dismissAlertView(){
        alertController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
