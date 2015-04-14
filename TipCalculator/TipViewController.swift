//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Satindar Dhillon on 4/13/15.
//  Copyright (c) 2015 Jaya. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var billAmount: Double = 0.0 {
        didSet {
            updateUI()
        }
    }
    
    var tipPercentage: Double = 0.0 {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var tipAmountField: UITextField!
    
    @IBAction func billAmountChanged(sender: UITextField) {
        billAmount = Double((sender.text as NSString).doubleValue)
        sender.text = String(format: "%0.2f", billAmount)
    }
    
    @IBAction func tipPercentageChanged(sender: UITextField) {
        tipPercentage = Double((sender.text as NSString).doubleValue)
        sender.text = String(format: "%0.0f", tipPercentage)
    }
    
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var totalBill: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultTip = defaults.doubleForKey("defautTipPercentage")
        tipAmountField.text = String(format: "%0.0f", defaultTip)
        tipPercentage = defaultTip
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(true)
        let defaultTip = defaults.doubleForKey("defautTipPercentage")
        tipAmountField.text = String(format: "%0.0f", defaultTip)
        tipPercentage = defaultTip
    }
    
    private func updateUI() {
        let tipAmount = billAmount * (tipPercentage / 100.0)
        let calculatedTip = String(format: "%0.2f", tipAmount)
        tip.text = "Tip: \(calculatedTip)"
        let total = String(format: "%0.2f", tipAmount + billAmount)
        totalBill.text = "Total Amount: \(total)"
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
}
