//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Satindar Dhillon on 4/13/15.
//  Copyright (c) 2015 Jaya. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var defaultTipField: UITextField!
    
    @IBAction func tipPercentageChanged(sender: UITextField) {
        let tipPercentage = Double((sender.text as NSString).doubleValue)
        defaultTipField.text = String(format: "%0.0f", tipPercentage)
        defaults.setDouble(tipPercentage, forKey: "defautTipPercentage")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultTip = defaults.doubleForKey("defautTipPercentage")
        defaultTipField.text = String(format: "%0.0f", defaultTip)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}
