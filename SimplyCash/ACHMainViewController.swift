//
//  ACHMainViewController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 01/02/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit


class ACHMainViewController: UIViewController, NSURLConnectionDelegate, NSXMLParserDelegate, UITextFieldDelegate {

    @IBAction func transactionType(sender: AnyObject) {
        
        if sender.selectedSegmentIndex == 0
        {
            JLToast.makeText("Sale", duration: 3).show()
 
        }
        else if sender.selectedSegmentIndex == 1{
            JLToast.makeText("Void", duration: 3).show()
                   }
        else if sender.selectedSegmentIndex == 2{
            JLToast.makeText("Recurring", duration: 3).show()
 
        }

    }
    @IBOutlet weak var ownerNameVal: UITextField!
    @IBOutlet weak var saleAmountVal: UITextField!
    @IBOutlet weak var orderIdVal: UITextField!
    @IBOutlet weak var routingNumberVal: UITextField!
    @IBOutlet weak var directDepositVal: UITextField!
    @IBOutlet weak var checkNumberVal: UITextField!

    @IBOutlet weak var checkingCB: CheckboxButton!
    
    @IBOutlet weak var savingCB: CheckboxButton!
    
    var accountType : String = "C"
    var currentString = ""


    
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
        SwiftSpinner.show("Processing..")
        self.CallSoapService(saleAmountVal.text!, orderId: orderIdVal.text!, aba: routingNumberVal.text!, dda: directDepositVal.text!, checkNum: checkNumberVal.text!, accountType: accountType, ownerName: ownerNameVal.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

            checkingCB.on = true
        
            self.saleAmountVal.delegate = self

        
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

    func CallSoapService(saleAmount :String, orderId :String, aba :String, dda :String, checkNum :String, accountType: String, ownerName :String)
    {
        /*
        <?xml version="1.0" encoding="utf-8"?>
        <RESPONSE>
        <FIELDS>
        <FIELD KEY="status">1</FIELD>
        <FIELD KEY="auth_code" />
        <FIELD KEY="avs_code" />
        <FIELD KEY="cvv2_code" />
        <FIELD KEY="auth_response">Pending</FIELD>
        <FIELD KEY="order_id">Azhar Keyed17</FIELD>
        <FIELD KEY="reference_number">86538</FIELD>
        <FIELD KEY="error" />
        </FIELDS>
        </RESPONSE>
        */
        let soapMessage = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><TRANSACTION><FIELDS><FIELD KEY=\"transaction_center_id\">\(defaults.stringForKey("ACH_TRANSACTIONCENTERID")!)</FIELD><FIELD KEY=\"Processor\">\(defaults.stringForKey("ACH_PROCESSOR")!)</FIELD><FIELD KEY=\"MID\">\(defaults.stringForKey("ACH_MID")!)</FIELD><FIELD KEY=\"gateway_id\">\(defaults.stringForKey("ACH_GATEWAYID")!)</FIELD><FIELD KEY=\"operation_type\">ach_debit</FIELD><FIELD KEY=\"order_id\">\(orderId)</FIELD><FIELD KEY=\"ach_category_text\">Web Payments</FIELD><FIELD KEY=\"total\">\(saleAmount)</FIELD><FIELD KEY=\"aba\">\(aba)</FIELD><FIELD KEY=\"dda\">\(dda)</FIELD><FIELD KEY=\"ach_account_type\">\(accountType)</FIELD><FIELD KEY=\"close_date\">06/23/2009</FIELD><FIELD KEY=\"ach_name\">\(ownerName)</FIELD><FIELD KEY=\"owner_name\">\(ownerName)</FIELD><FIELD KEY=\"owner_street\">NP</FIELD><FIELD KEY=\"owner_city\">NP</FIELD><FIELD KEY=\"owner_state\">NP</FIELD><FIELD KEY=\"owner_zip\">NP</FIELD><FIELD KEY=\"owner_country\">US</FIELD></FIELDS></TRANSACTION>"
        
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
        print("End document")
    }

}
