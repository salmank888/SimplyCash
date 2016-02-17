//
//  ConfirmTransactionViewController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 15/02/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit

class ConfirmTransactionViewController: UIViewController {
    
    var transID:String!
    var orderID:String!
    var authCode:String!
    var saleAmount:String!
    var signature:UIImage!
    
    @IBOutlet weak var saleAmountVal: UILabel!

    @IBOutlet weak var transDateVal: UILabel!
    
    @IBOutlet weak var authNumberVal: UILabel!
    
    @IBOutlet weak var transactionIdVal: UILabel!
    @IBOutlet weak var orderId: UILabel!
    
    @IBOutlet weak var signatureVal: UIImageView!
    @IBAction func okBtn(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        saleAmountVal.text = saleAmount
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        transDateVal.text  = formatter.stringFromDate(NSDate())
        authNumberVal.text = authCode
        transactionIdVal.text = transID
        orderId.text = orderID
        
        signatureVal.image = signature
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
