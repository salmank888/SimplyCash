//
//  SIgnatureViewController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 06/02/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit

class SIgnatureViewController: UIViewController, NSURLConnectionDelegate, NSXMLParserDelegate {
    
    var transID:String!
    
    var imageDataString:String!

    @IBAction func saveBtn(sender: AnyObject) {
        
        SwiftSpinner.show("Processing..")
        
        // Getting the Signature Image from self.drawSignatureView using the method getSignature().
        let signatureImage = self.signatureViewOutlet.getSignature()
        
        var imageData = UIImagePNGRepresentation(signatureImage)
        
        imageDataString = imageData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)

        CallSoapService(transID, signatureString: imageDataString, processor: "fifththird")

    }

    @IBAction func clearBtn(sender: AnyObject) {
        // This is how the signature gets cleared
        self.signatureViewOutlet.clearSignature()
    }
    
    @IBAction func cancelBtn(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signature_main_segue", sender:self)

    }
    
    @IBOutlet weak var signatureViewOutlet: YPDrawSignatureView!
    @IBOutlet weak var referenceNumVal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true


        // Do any additional setup after loading the view.
        
        referenceNumVal.text = transID
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
    
    var mutableData:NSMutableData  = NSMutableData()
    
    var currentElementName:String = ""
    var Status:String = ""

    
    var gatewayValues = [String:String]()
    let defaults = NSUserDefaults.standardUserDefaults()

    func CallSoapService(referenceNumber :String, signatureString :String, processor :String)
    {

        
       
        
        
        let soapMessage =  "<?xml version=\"1.0\" encoding=\"UTF-8\"?><TRANSACTION><FIELDS><FIELD KEY=\"merchant\">\(defaults.stringForKey("ACH_TRANSACTIONCENTERID")!)</FIELD><FIELD KEY=\"Processor\">\(processor)</FIELD><FIELD KEY=\"gateway_id\">\(defaults.stringForKey("ACH_GATEWAYID")!)</FIELD><FIELD KEY=\"reference_number\">\(referenceNumber)</FIELD><FIELD KEY=\"signature\">\(signatureString)</FIELD><FIELD KEY=\"operation_type\">add_signature</FIELD></FIELDS></TRANSACTION>"
        
        
//        StringBuilder transUrl = new StringBuilder();
//        transUrl.append("<TRANSACTION><FIELDS><FIELD KEY=\"merchant\">");
//        transUrl.append(get_merchant());
//        transUrl.append("</FIELD><FIELD KEY=\"gateway_id\">");
//        transUrl.append(get_gateway_id());
//        transUrl.append("</FIELD><FIELD KEY=\"operation_type\">");
//        transUrl.append(get_operation_type());
//        transUrl.append("</FIELD><FIELD KEY=\"reference_number\">");
//        transUrl.append(get_reference_number());
//        transUrl.append("</FIELD><FIELD KEY=\"processor\">");
//        transUrl.append(get_processor());
//        transUrl.append("</FIELD><FIELD KEY=\"signature\">");
//        transUrl.append(get_signature());
//        transUrl.append("</FIELD>");
//        transUrl.append("</FIELDS></TRANSACTION>");
        
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
//            AuthResponse = gatewayValues["auth_response"] == nil ? "" : gatewayValues["auth_response"]!
//            OrderId = gatewayValues["order_id"] == nil ? "" : gatewayValues["order_id"]!
//            ReferenceNumber = gatewayValues["reference_number"] == nil ? "" : gatewayValues["reference_number"]!
//            AuthCode = gatewayValues["auth_code"] == nil ? "" : gatewayValues["auth_code"]!
//            AVSCode = gatewayValues["avs_code"] == nil ? "" : gatewayValues["avs_code"]!
//            CVV2Code = gatewayValues["cvv2_code"] == nil ? "" : gatewayValues["cvv2_code"]!
            
                        let alert = UIAlertView()
                        alert.title = "Payment Successful"
                        alert.message = "Reference Number: \(transID)"
                        alert.addButtonWithTitle("OK")
                        alert.delegate = self

                        alert.show()
            
        }
        print("End document")
    }
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        
        switch buttonIndex {
            
        default:
            self.performSegueWithIdentifier("signature_main_segue", sender: self)
            
        }
    }

}
