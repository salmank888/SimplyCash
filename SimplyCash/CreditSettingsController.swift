//
//  CreditSettingsController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 13/01/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit

class CreditSettingsController: UIViewController {

    @IBOutlet weak var midVal: UITextField!
    @IBOutlet weak var processorVal: UITextField!
    @IBOutlet weak var gatewayIDVal: UITextField!
    @IBOutlet weak var transactionCenterIDVal: UITextField!
    @IBOutlet weak var tidVal: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setControlSettings()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated:Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(midVal.text, forKey: "Credit_MID")
        defaults.setObject(processorVal.text, forKey: "Credit_PROCESSOR")
        defaults.setObject(gatewayIDVal.text, forKey: "Credit_GATEWAYID")
        defaults.setObject(transactionCenterIDVal.text, forKey: "Credit_TRANSACTIONCENTERID")
        defaults.setObject(tidVal.text, forKey: "Credit_TID")
        super.viewWillDisappear(animated)
    }
    
    func setControlSettings()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let Credit_MID = defaults.stringForKey("Credit_MID")
        {
            midVal.text = Credit_MID
        }
        if let Credit_PROCESSOR = defaults.stringForKey("Credit_PROCESSOR")
        {
            processorVal.text = Credit_PROCESSOR
        }
        if let Credit_GATEWAYID = defaults.stringForKey("Credit_GATEWAYID")
        {
            gatewayIDVal.text = Credit_GATEWAYID
        }
        if let Credit_TRANSACTIONCENTERID = defaults.stringForKey("Credit_TRANSACTIONCENTERID")
        {
            transactionCenterIDVal.text = Credit_TRANSACTIONCENTERID
        }
        if let Credit_TID = defaults.stringForKey("Credit_TID")
        {
            tidVal.text = Credit_TID
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
