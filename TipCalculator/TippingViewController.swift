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
    
    let numberFormatter = NSNumberFormatter()
    
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
        super.viewDidAppear(true)
        defaultTipRate()
        updateUI()
    }
    
    private func defaultTipRate() {
        let defaultTip = defaults.doubleForKey("defautTipPercentage")
        tipRateField.text = String(format: "%0.0f", defaultTip)
        tipRate = defaultTip
    }
    
    private func updateUI() {
        let tipAmount = billAmount * (tipRate / 100.0)
        tipLabel.text = "Tip Amount: \(formatCurrencyValue(tipAmount))"
        
        let totalAmount = billAmount * (1 + (tipRate / 100.0))
        totalLabel.text = "Total: \(formatCurrencyValue(totalAmount))"
    }
    
    private func formatCurrencyValue(value: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        return formatter.stringFromNumber(value)!
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}
