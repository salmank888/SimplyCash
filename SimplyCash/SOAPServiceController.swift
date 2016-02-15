//
//  SOAPServiceController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 21/01/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit
//import SwiftSpinner

class SOAPServiceController: UIViewController, NSURLConnectionDelegate, NSXMLParserDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.show("Processing..")
        /*
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        // do your task
        //self.CallSoapService()
        dispatch_async(dispatch_get_main_queue()) {
        // update some UI
        }
        }*/
        self.CallSoapService()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    func CallSoapService()
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
        let soapMessage = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><TRANSACTION><FIELDS><FIELD KEY=\"transaction_center_id\">84845</FIELD><FIELD KEY=\"Processor\">sandbox_echeck</FIELD><FIELD KEY=\"MID\">9927147173</FIELD><FIELD KEY=\"gateway_id\">92d16e37-9ecf-4656-9219-8cc4faf98d9d</FIELD><FIELD KEY=\"operation_type\">ach_debit</FIELD><FIELD KEY=\"order_id\">Azhar Keyed24</FIELD><FIELD KEY=\"ach_category_text\">Web Payments</FIELD><FIELD KEY=\"total\">1.00</FIELD><FIELD KEY=\"aba\">031200213</FIELD><FIELD KEY=\"dda\">7596321546</FIELD><FIELD KEY=\"ach_account_type\">C</FIELD><FIELD KEY=\"close_date\">06/23/2009</FIELD><FIELD KEY=\"ach_name\">Citibank </FIELD><FIELD KEY=\"owner_name\">Bob Tester</FIELD><FIELD KEY=\"owner_street\">123 Test Rd.</FIELD><FIELD KEY=\"owner_street2\"></FIELD><FIELD KEY=\"owner_city\">Cityville</FIELD><FIELD KEY=\"owner_state\">NJ</FIELD><FIELD KEY=\"owner_zip\">08035</FIELD><FIELD KEY=\"owner_country\">US</FIELD><FIELD KEY=\"owner_email\"></FIELD><FIELD KEY=\"owner_phone\">555-555-5555</FIELD></FIELDS></TRANSACTION>"
        
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
        }
        print("End document")
    }
}

