//
//  ACHMainViewController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 01/02/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit


class ACHMainViewController: UIViewController, NSURLConnectionDelegate, NSXMLParserDelegate, UITextFieldDelegate, UIPopoverPresentationControllerDelegate,PopoverDelegate {

    
    var achSaleRequest = false
    var achVoidRequest = false
    var achRecurringRequest = false
    @IBOutlet weak var transactionTypeOutlet: UISegmentedControl!
    @IBAction func transactionType(sender: AnyObject) {
        
        if sender.selectedSegmentIndex == 0
        {
            JLToast.makeText("Sale", duration: 3).show()
            
            achSaleRequest = true
            achVoidRequest = false
            achRecurringRequest = false
            
            saleAmountLabel.hidden = false
            saleAmountVal.hidden = false
            saleAmountUnderline.hidden = false
            
            orderIdLabel.text = "Order Id"
            orderIdVal.placeholder = "order id"
            
            routingNumberLabel.hidden = false
            routingNumberVal.hidden = false
            routingNumberUnderline.hidden = false
            
            ddaLabel.hidden = false
            directDepositVal.hidden = false
            ddaUnderline.hidden = false
            
            checkNumLabel.hidden = false
            checkNumberVal.hidden = false
            checkNumberUnderline.hidden = false
            
            accountTypeLabel.hidden = false
            checkingCB.hidden = false
            checkingLabel.hidden = false
            savingCB.hidden = false
            savingLabel.hidden = false
            
            ownerNameLabel.hidden = false
            ownerNameVal.hidden = false
            ownerNameUnderline.hidden = false
            
            recurringNumberLabel.hidden = true
            recurringNumVal.hidden = true
            recurringNumberUnderline.hidden = true
            
            startDateLabel.hidden = true
            startDateVal.hidden = true
            startDateUnderline.hidden = true
            
            recurringTypeLabel.hidden = true
            recurringTypeVal.hidden = true
            recurringTypeUnderline.hidden = true
            
            endDateLabel.hidden = true
            endDateVal.hidden = true
            endDateUnderline.hidden = true
 
        }
        else if sender.selectedSegmentIndex == 1{
            JLToast.makeText("Void", duration: 3).show()
            achSaleRequest = false
            achVoidRequest = true
            achRecurringRequest = false
            
            
            saleAmountLabel.hidden = true
            saleAmountVal.hidden = true
            saleAmountUnderline.hidden = true
            
            
            orderIdLabel.text = "Reference/Transaction Number"
            orderIdVal.placeholder = "reference number"
            
            
            routingNumberLabel.hidden = true
            routingNumberVal.hidden = true
            routingNumberUnderline.hidden = true
            
            ddaLabel.hidden = true
            directDepositVal.hidden = true
            ddaUnderline.hidden = true
            
            checkNumLabel.hidden = true
            checkNumberVal.hidden = true
            checkNumberUnderline.hidden = true
            
            accountTypeLabel.hidden = true
            checkingCB.hidden = true
            checkingLabel.hidden = true
            savingCB.hidden = true
            savingLabel.hidden = true
            
            ownerNameLabel.hidden = true
            ownerNameVal.hidden = true
            ownerNameUnderline.hidden = true
            
            recurringNumberLabel.hidden = true
            recurringNumVal.hidden = true
            recurringNumberUnderline.hidden = true
            
            startDateLabel.hidden = true
            startDateVal.hidden = true
            startDateUnderline.hidden = true
            
            recurringTypeLabel.hidden = true
            recurringTypeVal.hidden = true
            recurringTypeUnderline.hidden = true
            
            endDateLabel.hidden = true
            endDateVal.hidden = true
            endDateUnderline.hidden = true
            }
        else if sender.selectedSegmentIndex == 2{
            JLToast.makeText("Recurring", duration: 3).show()
            achSaleRequest = false
            achVoidRequest = false
            achRecurringRequest = true
            
            saleAmountLabel.hidden = false
            saleAmountVal.hidden = false
            saleAmountUnderline.hidden = false
            
            orderIdLabel.text = "Order Id"
            orderIdVal.placeholder = "order id"
            
            routingNumberLabel.hidden = false
            routingNumberVal.hidden = false
            routingNumberUnderline.hidden = false
            
            ddaLabel.hidden = false
            directDepositVal.hidden = false
            ddaUnderline.hidden = false
            
            checkNumLabel.hidden = false
            checkNumberVal.hidden = false
            checkNumberUnderline.hidden = false
            
            accountTypeLabel.hidden = false
            checkingCB.hidden = false
            checkingLabel.hidden = false
            savingCB.hidden = false
            savingLabel.hidden = false
            
            ownerNameLabel.hidden = false
            ownerNameVal.hidden = false
            ownerNameUnderline.hidden = false
            
            recurringNumberLabel.hidden = false
            recurringNumVal.hidden = false
            recurringNumberUnderline.hidden = false
            
            startDateLabel.hidden = false
            startDateVal.hidden = false
            startDateUnderline.hidden = false
            
            recurringTypeLabel.hidden = false
            recurringTypeVal.hidden = false
            recurringTypeUnderline.hidden = false
            
            endDateLabel.hidden = false
            endDateVal.hidden = false
            endDateUnderline.hidden = false
 
        }

    }
   
    @IBOutlet weak var saleAmountLabel: UILabel!
    
    @IBOutlet weak var saleAmountUnderline: UIView!
    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var orderIdUnderline: UIView!
    @IBOutlet weak var routingNumberLabel: UILabel!
    @IBOutlet weak var routingNumberUnderline: UIView!
    @IBOutlet weak var ddaLabel: UILabel!
    @IBOutlet weak var ddaUnderline: UIView!
    @IBOutlet weak var checkNumLabel: UILabel!
    @IBOutlet weak var checkNumberUnderline: UIView!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var checkingLabel: UILabel!
    @IBOutlet weak var savingLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerNameUnderline: UIView!


    
    @IBOutlet weak var recurringNumberLabel: UILabel!
    
    @IBOutlet weak var recurringNumberUnderline: UIView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startDateUnderline: UIView!
    
    @IBOutlet weak var recurringTypeLabel: UILabel!
    
    @IBOutlet weak var recurringTypeUnderline: UIView!
    
    @IBOutlet weak var endDateLabel: UILabel!
    
    @IBOutlet weak var endDateUnderline: UIView!
    
    
    
    
    @IBOutlet weak var ownerNameVal: UITextField!
    @IBOutlet weak var saleAmountVal: UITextField!
    @IBOutlet weak var orderIdVal: UITextField!
    @IBOutlet weak var routingNumberVal: UITextField!
    @IBOutlet weak var directDepositVal: UITextField!
    @IBOutlet weak var checkNumberVal: UITextField!

    @IBOutlet weak var checkingCB: CheckboxButton!
    
    @IBOutlet weak var savingCB: CheckboxButton!
    
    @IBAction func onStartDateBeginEditing(sender: AnyObject) {
        
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        startDateVal.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("startDatePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        

    }
    
  
    func startDatePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
//        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        startDateVal.text = dateFormatter.stringFromDate(sender.date)
        
        print(sender.date)
        
    }
    
    @IBAction func onEndDateBeginEditing(sender: AnyObject) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        endDateVal.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("endDatePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)

    }
    
    // 7
    func endDatePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        //        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        endDateVal.text = dateFormatter.stringFromDate(sender.date)
        
        print(sender.date)
        
    }
    
    
    @IBAction func onRecurringValBeginEditing(sender: AnyObject) {
        
        self.performSegueWithIdentifier("popover_segue", sender: self)
        
    }
    
    func adaptivePresentationStyleForPresentationController(
        controller: UIPresentationController) -> UIModalPresentationStyle {
            return .None
    }
    
    @IBOutlet weak var endDateVal: UITextField!
    @IBOutlet weak var recurringTypeVal: UITextField!
    @IBOutlet weak var startDateVal: UITextField!
    @IBOutlet weak var recurringNumVal: UITextField!
    
    var accountType : String = "C"
    var currentString = ""


    @IBOutlet weak var submitBtnOutlet: UIButton!
    
    @IBAction func checkingAccTypeVal(sender: CheckboxButton) {
        if sender.on {
            accountType = "C"
            savingCB.on = false
        }
        else{
            accountType = "S"
            savingCB.on = true
        }
    }
    
    @IBAction func savingAccTypeVal(sender: CheckboxButton) {
        if sender.on {
            accountType = "S"
            checkingCB.on = false
        }
        else{
            accountType = "C"
            checkingCB.on = true
        }
 
    }
    
    @IBAction func achSubmitBtn(sender: AnyObject) {
        SwiftSpinner.show("Processing...")
        if achSaleRequest == true{
            let ach = ACH(operation_type:"ach_debit", ach_orderID: orderIdVal.text!, ach_saleAmnt: saleAmountVal.text!, aba: routingNumberVal.text!, dda: directDepositVal.text!, checkNumber: checkNumberVal.text!, ach_account_type: accountType, owner_name: ownerNameVal.text!)
        self.CallSoapService(ach.getDirectPostString())
        }
        else if achVoidRequest == true{
            let ach = ACH(operation_type:"ach_void", referenceNUM: orderIdVal.text!)
            self.CallSoapService(ach.getDirectVoidPostString())

            
        }else if achRecurringRequest == true{
            
            let ach = ACH(operation_type:"ach_debit", ach_orderID: orderIdVal.text!, ach_saleAmnt: saleAmountVal.text!, aba: routingNumberVal.text!, dda: directDepositVal.text!, checkNumber: checkNumberVal.text!, ach_account_type: accountType, owner_name: ownerNameVal.text!, recurring_number : recurringNumVal.text!, recurring_start_date : startDateVal.text!,
                recurring_type : recurringTypeVal.text!, recurring_end_date : endDateVal.text!)
            self.CallSoapService(ach.getDirectPostString() + ach.getDirectRecurringPostString())
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if(transactionTypeOutlet.selectedSegmentIndex == 0)
        {
            
            achSaleRequest = true
            achVoidRequest = false
            achRecurringRequest = false
            
            recurringNumberLabel.hidden = true
            recurringNumVal.hidden = true
            recurringNumberUnderline.hidden = true
            
            startDateLabel.hidden = true
            startDateVal.hidden = true
            startDateUnderline.hidden = true
            
            recurringTypeLabel.hidden = true
            recurringTypeVal.hidden = true
            recurringTypeUnderline.hidden = true
            
            endDateLabel.hidden = true
            endDateVal.hidden = true
            endDateUnderline.hidden = true

        }
        
            checkingCB.on = true
        
            self.saleAmountVal.delegate = self

        
        self.submitBtnOutlet.layer.borderWidth = 3
        self.submitBtnOutlet.layer.borderColor = UIColor.whiteColor().CGColor
        self.submitBtnOutlet.layer.cornerRadius = 10
        self.submitBtnOutlet.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "signature_segue") {
            let svc = segue.destinationViewController as! SIgnatureViewController;
            
            svc.transID = ReferenceNumber
            svc.orderID = OrderId
            svc.authCode = AuthCode
            svc.saleAmount = saleAmountVal.text!

            
        }
        else if(segue.identifier == "popover_segue") {
            let svc = segue.destinationViewController as! PopoverListViewController;
            
            svc.delegate = self
            let controller = svc.popoverPresentationController
            
            if controller != nil {
                controller?.delegate = self
            }
            
            
        }
        else if(segue.identifier == "ach_void_segue") {
            let svc = segue.destinationViewController as! ConfirmTransactionViewController;
            
            svc.transID = ReferenceNumber

            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    //Textfield delegates
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            currentString += string
            print(currentString)
            formatCurrency(currentString)
        default:
            var currentStringArray = Array(currentString.characters)
            if string == "" && currentStringArray.count != 0 {
                currentStringArray.removeLast()
                currentString = ""
                for character in currentStringArray {
                    currentString += String(character)
                }
                formatCurrency(currentString)
            }
        }
        return false
    }
    
    func formatCurrency(string: String) {
        print("format \(string)")
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
//        formatter.locale = NSLocale(localeIdentifier: "en_US")
        let numberFromField = (NSString(string: currentString).doubleValue)/100
        saleAmountVal.text = formatter.stringFromNumber(numberFromField)
        print(saleAmountVal.text )
    }
    
    var mutableData:NSMutableData  = NSMutableData()
    
    var currentElementName:String = ""
    var Status:String = ""
    var AuthResponse:String = ""
    var OrderId:String = ""
    var ReferenceNumber:String = ""
    var AuthCode:String = ""
    var AVSCode:String = ""
    var CVV2Code:String = ""
    
    var gatewayValues = [String:String]()
    let defaults = NSUserDefaults.standardUserDefaults()

    func CallSoapService(postDataString : String)
    {

//        let soapMessage = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><TRANSACTION><FIELDS><FIELD KEY=\"transaction_center_id\">\(defaults.stringForKey("ACH_TRANSACTIONCENTERID")!)</FIELD><FIELD KEY=\"Processor\">\(defaults.stringForKey("ACH_PROCESSOR")!)</FIELD><FIELD KEY=\"MID\">\(defaults.stringForKey("ACH_MID")!)</FIELD><FIELD KEY=\"gateway_id\">\(defaults.stringForKey("ACH_GATEWAYID")!)</FIELD><FIELD KEY=\"operation_type\">ach_debit</FIELD><FIELD KEY=\"order_id\">\(orderId)</FIELD><FIELD KEY=\"ach_category_text\">Web Payments</FIELD><FIELD KEY=\"total\">\(saleAmount)</FIELD><FIELD KEY=\"aba\">\(aba)</FIELD><FIELD KEY=\"dda\">\(dda)</FIELD><FIELD KEY=\"ach_account_type\">\(accountType)</FIELD><FIELD KEY=\"close_date\">06/23/2009</FIELD><FIELD KEY=\"ach_name\">\(ownerName)</FIELD><FIELD KEY=\"owner_name\">\(ownerName)</FIELD><FIELD KEY=\"owner_street\">NP</FIELD><FIELD KEY=\"owner_city\">NP</FIELD><FIELD KEY=\"owner_state\">NP</FIELD><FIELD KEY=\"owner_zip\">NP</FIELD><FIELD KEY=\"owner_country\">US</FIELD></FIELDS></TRANSACTION>"
        


                let soapMessage = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><TRANSACTION><FIELDS><FIELD KEY=\"transaction_center_id\">\(defaults.stringForKey("ACH_TRANSACTIONCENTERID")!)</FIELD><FIELD KEY=\"Processor\">\(defaults.stringForKey("ACH_PROCESSOR")!)</FIELD><FIELD KEY=\"MID\">\(defaults.stringForKey("ACH_MID")!)</FIELD><FIELD KEY=\"gateway_id\">\(defaults.stringForKey("ACH_GATEWAYID")!)</FIELD>\(postDataString)</FIELDS></TRANSACTION>"
        
        let urlString = "https://secure.1stpaygateway.net/secure/gateway/xmlgateway.aspx"
        
        let url = NSURL(string: urlString)
        
        let theRequest = NSMutableURLRequest(URL: url!)
        
        let msgLength = soapMessage.characters.count
        
        //  theRequest.addValue("http://www.w3schools.com/xml/CelsiusToFahrenheit", forHTTPHeaderField: "SOAPAction")
        theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        theRequest.addValue(String(msgLength), forHTTPHeaderField: "Content-Length")
        theRequest.HTTPMethod = "POST"
        theRequest.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) // or false
        
        let connection = NSURLConnection(request: theRequest, delegate: self, startImmediately: true)
        connection!.start()
        
        //        if (connection == true) {
        //            var mutableData : Void = NSMutableData.initialize()
        //        }
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        mutableData.length = 0;
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        mutableData.appendData(data)
    }
    var CelsiusToFahrenheitResult:String = ""
    var strXMLData:String = ""
    var currentElement:String = ""
    var passData:Bool=false
    var passName:Bool=false
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        let xmlParser = NSXMLParser(data: mutableData)
        let dta = NSString(data: mutableData, encoding: NSUTF8StringEncoding)
        print("the string is: \(dta)")
        
        gatewayValues = [:]
        xmlParser.delegate = self
        xmlParser.parse()
        xmlParser.shouldResolveExternalEntities = true
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement=elementName;
        currentElementName = ""
        if(elementName=="FIELD")
        {
            for(key,value) in attributeDict {
                print("\(key) : \(value)")
                currentElementName = value;
            }
            passData=true;
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement="";
        if(elementName=="FIELD")
        {
            currentElementName = ""
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        /*if(passName){
        strXMLData=strXMLData+"\n\n"+string
        }
        print("Value =  \(string)")
        if(passData)
        {
        print(string)
        }*/
        if(!currentElementName.isEmpty)
        {
            gatewayValues[currentElementName] = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print("failure error: %@", parseError)
    }
    
    func parserDidEndDocument(parser: NSXMLParser)
    {
        SwiftSpinner.hide()
        if achVoidRequest == true{
          
            let error = gatewayValues["error1"] == nil ? "" : gatewayValues["error1"]
            let status = gatewayValues["status1"] == nil ? "" : gatewayValues["status1"]

            if(!error!.isEmpty)
            {
                let alert = UIAlertView()
                alert.title = "Alert"
                alert.message = error!
                alert.addButtonWithTitle("OK")
                alert.show()
            }
            else if(status == "1")
            {
                Status = gatewayValues["status1"] == nil ? "" : gatewayValues["status1"]!
                ReferenceNumber = gatewayValues["reference_number1"] == nil ? "" : gatewayValues["reference_number1"]!

                
                
                //            let alert = UIAlertView()
                //            alert.title = "Payment Successful"
                //            alert.message = "Reference Number: \(ReferenceNumber)"
                //            alert.addButtonWithTitle("OK")
                //            alert.show()
                    self.performSegueWithIdentifier("ach_void_segue", sender: self)

       
            }
            else {
                
                let alert = UIAlertView()
                alert.title = "Alert"
                alert.message = "Void Failed. Transaction cannot be voided"
                alert.addButtonWithTitle("OK")
                alert.show()
            }
            
        }
        else{
        let error = gatewayValues["error"] == nil ? "" : gatewayValues["error"]
        if(!error!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = error!
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        else
        {
            Status = gatewayValues["status"] == nil ? "" : gatewayValues["status"]!
            AuthResponse = gatewayValues["auth_response"] == nil ? "" : gatewayValues["auth_response"]!
            OrderId = gatewayValues["order_id"] == nil ? "" : gatewayValues["order_id"]!
            ReferenceNumber = gatewayValues["reference_number"] == nil ? "" : gatewayValues["reference_number"]!
            AuthCode = gatewayValues["auth_code"] == nil ? "" : gatewayValues["auth_code"]!
            AVSCode = gatewayValues["avs_code"] == nil ? "" : gatewayValues["avs_code"]!
            CVV2Code = gatewayValues["cvv2_code"] == nil ? "" : gatewayValues["cvv2_code"]!
            
            
//            let alert = UIAlertView()
//            alert.title = "Payment Successful"
//            alert.message = "Reference Number: \(ReferenceNumber)"
//            alert.addButtonWithTitle("OK")
//            alert.show()

            self.performSegueWithIdentifier("signature_segue", sender: self)
    
            }
        }
        print("End document")
    }
    
    func updateRecurringTypeVal(data: String) {
        // Uses the data passed back
        
        recurringTypeVal.text = data
    }

}
