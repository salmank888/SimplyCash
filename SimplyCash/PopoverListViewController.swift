//
//  PopoverListViewController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 27/02/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit

class PopoverListViewController: UIViewController, UITableViewDataSource {

    var recurringValueTypes = ["daily", "weekly", "biweekly", "monthly", "bimonthly", "quarterly", "semiannually", "annually"]
    
    var delegate: PopoverDelegate?

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recurringValueTypes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("popoverView_cell", forIndexPath: indexPath) as UITableViewCell
        let recurringTypeLabel = recurringValueTypes[indexPath.row]
        cell.textLabel!.text = recurringTypeLabel
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        delegate?.updateRecurringTypeVal(recurringValueTypes[indexPath.row])

        self.dismissViewControllerAnimated(false, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
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
