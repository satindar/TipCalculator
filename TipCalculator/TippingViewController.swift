//
//  TippingViewController.swift
//  TipCalculator
//
//  Created by Satindar Dhillon on 4/14/15.
//  Copyright (c) 2015 Jaya. All rights reserved.
//

import UIKit

class TippingViewController: UIViewController {
    let defaults = NSUserDefaults.standardUserDefaults()
    var tipRate = 0.0
    var billAmount = 0.0
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipRateField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBAction func billAmountFieldChanged(sender: UITextField) {
        billAmount = Double((sender.text as NSString).doubleValue)
        updateUI()
    }
    
    @IBAction func tipRateFieldChanged(sender: UITextField) {
        tipRate = Double((sender.text as NSString).doubleValue)
        updateUI()
    }
    
    @IBAction func billAmountSliderMoved(sender: UISlider) {
        billAmount = Double(sender.value) * 500
        billAmountField.text = String(format: "%0.2f", billAmount)
        updateUI()
    }
    
    @IBAction func tipRateIncremented(sender: UIButton) {
        tipRate += 1.0
        tipRateField.text = String(format: "%0.0f", tipRate)
        updateUI()
    }
    
    @IBAction func tipRateDecremented(sender: UIButton) {
        tipRate -= 1.0
        tipRateField.text = String(format: "%0.0f", tipRate)
        updateUI()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(true)
        let defaultTip = defaults.doubleForKey("defautTipPercentage")
        tipRateField.text = String(format: "%0.0f", defaultTip)
        tipRate = defaultTip
    }
    
    private func updateUI() {
        let tipAmount = String(format: "%0.2f", billAmount * (tipRate / 100.0))
        tipLabel.text = "Tip Amount: $\(tipAmount)"
        
        let totalAmount = String(format: "%0.2f", billAmount * (1 + (tipRate / 100.0)))
        totalLabel.text = "Total: $\(totalAmount)"
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}
