//
//  ViewController.swift
//  tips
//
//  Created by Weifan Lin on 2/5/16.
//  Copyright © 2016 Linfinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    

    @IBOutlet weak var numPplLabel: UILabel!
    @IBOutlet weak var splittedLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splittedLabel.text = "$0.00"
        numPplLabel.text = "1"
        
        stepper.wraps = true
        stepper.value = 1
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingchanged(sender: AnyObject) {
        setValues()
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    @IBAction func stepperValueChanged(sender: UIStepper) {
        numPplLabel.text = Int(sender.value).description
        setValues()
    }
    
    func setValues() {

        let tipPercentages = [0.15, 0.20, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        let numPpl = NSString(string: numPplLabel.text!).doubleValue
        let splitted = total / Double(numPpl)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splittedLabel.text = String(format: "$%.2f", splitted)
    }
    

}

