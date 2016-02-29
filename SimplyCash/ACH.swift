//
//  ACH.swift
//  SimplyCash
//
//  Created by Salman Khalid on 29/02/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import Foundation

class ACH {
    
    var operation_type : String = ""
    var ach_orderID_text : String = ""
    var ach_saleAmnt_text : String = ""
    var aba : String = ""
    var dda: String = ""
    var checkNumber : String = ""
    var ach_account_type : String = ""
    var owner_name : String = ""
    var recurring_number : String = ""
    var recurring_start_date : String = ""
    var recurring_type : String = ""
    var recurring_end_date : String = ""
    var reference_Num : String = ""



    
    

    init(operation_type : String, ach_orderID : String, ach_saleAmnt: String, aba : String, dda : String, checkNumber : String, ach_account_type : String, owner_name : String)  {
        self.operation_type = operation_type
        self.ach_orderID_text = ach_orderID
        self.ach_saleAmnt_text = ach_saleAmnt
        self.aba = aba
        self.dda = dda
        self.checkNumber = checkNumber
        self.ach_account_type = ach_account_type
        self.owner_name = owner_name


    }
    
    
    convenience init(operation_type : String, ach_orderID : String, ach_saleAmnt: String, aba : String, dda : String, checkNumber : String, ach_account_type : String, owner_name : String, recurring_number : String, recurring_start_date : String,
        recurring_type : String, recurring_end_date : String){

            self.init(operation_type : operation_type, ach_orderID : ach_orderID, ach_saleAmnt: ach_saleAmnt, aba : aba, dda : dda, checkNumber : checkNumber, ach_account_type : ach_account_type, owner_name : owner_name)

        
        self.recurring_number = recurring_number
        self.recurring_start_date = recurring_start_date
        self.recurring_type = recurring_type
        self.recurring_end_date = recurring_start_date
            
    }
    init(operation_type : String, referenceNUM : String)  {
        self.operation_type = operation_type
        self.reference_Num = referenceNUM
    }
    
    deinit{
        
    }
    
    func getDirectPostString() -> String {
        return ("<FIELD KEY=\"operation_type\">\(self.operation_type)</FIELD><FIELD KEY=\"order_id\">\(self.ach_orderID_text)</FIELD><FIELD KEY=\"ach_category_text\">Web Payments</FIELD><FIELD KEY=\"total\">\(self.ach_saleAmnt_text)</FIELD><FIELD KEY=\"aba\">\(self.aba)</FIELD><FIELD KEY=\"dda\">\(self.dda)</FIELD><FIELD KEY=\"total_additional_fields\">1</FIELD><FIELD KEY=\"field_name1\">CheckNumber</FIELD><FIELD KEY=\"field_value1\">\(self.checkNumber)</FIELD><FIELD KEY=\"ach_account_type\">\(ach_account_type)</FIELD><FIELD KEY=\"ach_name\">\(self.owner_name)</FIELD><FIELD KEY=\"owner_name\">\(self.owner_name)</FIELD><FIELD KEY=\"owner_street\">NP</FIELD><FIELD KEY=\"owner_city\">NP</FIELD><FIELD KEY=\"owner_state\">NP</FIELD><FIELD KEY=\"owner_zip\">NP</FIELD><FIELD KEY=\"owner_country\">US</FIELD>")
    }
    
    func getDirectRecurringPostString() -> String {
        return ("<FIELD KEY=\"recurring\">\(self.recurring_number)</FIELD><FIELD KEY=\"recurring_start_date\">\(self.recurring_start_date)</FIELD><FIELD KEY=\"recurring_type\">\(self.recurring_type)</FIELD><FIELD KEY=\"recurring_end_date\">\(self.recurring_end_date)</FIELD>")
    }
    
    func getDirectVoidPostString() -> String {
        return ("<FIELD KEY=\"operation_type\">\(self.operation_type)</FIELD><FIELD KEY=\"total_number_transactions\">1</FIELD><FIELD KEY=\"reference_number1\"> \(self.reference_Num)</FIELD>")
    }
}