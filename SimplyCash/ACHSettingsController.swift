//
//  ACHSettingsController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 13/01/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit

class ACHSettingsController: UIViewController {

    @IBOutlet weak var midVal: UITextField!
    @IBOutlet weak var processorVal: UITextField!
    @IBOutlet weak var gatewayIdVal: UITextField!
    @IBOutlet weak var transactionCenterIdVal: UITextField!
    
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
        defaults.setObject(midVal.text, forKey: "ACH_MID")
        defaults.setObject(processorVal.text, forKey: "ACH_PROCESSOR")
        defaults.setObject(gatewayIdVal.text, forKey: "ACH_GATEWAYID")
        defaults.setObject(transactionCenterIdVal.text, forKey: "ACH_TRANSACTIONCENTERID")
        super.viewWillDisappear(animated)
    }
    
    func setControlSettings()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let ACH_MID = defaults.stringForKey("ACH_MID")
        {
            midVal.text = ACH_MID
        }
        if let ACH_PROCESSOR = defaults.stringForKey("ACH_PROCESSOR")
        {
            processorVal.text = ACH_PROCESSOR
        }
        if let ACH_GATEWAYID = defaults.stringForKey("ACH_GATEWAYID")
        {
            gatewayIdVal.text = ACH_GATEWAYID
        }
        if let ACH_TRANSACTIONCENTERID = defaults.stringForKey("ACH_TRANSACTIONCENTERID")
        {
            transactionCenterIdVal.text = ACH_TRANSACTIONCENTERID
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
    
/*    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nsSring = segue.identifier
        print("its id  \(segue.identifier)")
        if segue.identifier == "ACH_Segue"{
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(midVal.text, forKey: "ACH_MID")
        }
    }*/

}
