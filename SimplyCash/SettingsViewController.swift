//
//  SettingsViewController.swift
//  SimplyCash
//
//  Created by Salman Khalid on 11/01/2016.
//  Copyright © 2016 Salman Khalid. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource{

    let settings = ["General Settings", "ACH Settings", "Credit Settings"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let settingsLabel = settings[indexPath.row]
        cell.textLabel!.text = settingsLabel
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let lSettings = settings[indexPath.row]
        if lSettings == "ACH Settings"{
            self.performSegueWithIdentifier("ACH_Segue", sender: indexPath)
        }
        else if lSettings == "General Settings"{
            self.performSegueWithIdentifier("GeneralSettings_Segue", sender: indexPath)
        }
        else if lSettings == "Credit Settings"{
            self.performSegueWithIdentifier("Credit_Segue", sender: indexPath)
        }
        
        
        print("Hey \(lSettings)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "ACH_Segue")
//        {
//            print("Hey \(segue.identifier)")
//        }
        
     //   if segue.identifier == "ACH_Segue"
     //   let destination = segue.destinationViewController as? ACHSettingsController

        

    }


}
