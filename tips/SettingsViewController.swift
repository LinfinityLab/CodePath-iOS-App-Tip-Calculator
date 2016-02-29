//
//  SettingsViewController.swift
//  tips
//
//  Created by Weifan Lin on 2/5/16.
//  Copyright © 2016 Linfinity. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func defaultChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let index = defaultControl.selectedSegmentIndex
        
        defaults.setInteger(index, forKey: "defaultSeg")

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        defaultControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().objectForKey("defaultSeg") as! Int
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
