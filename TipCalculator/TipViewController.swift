//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Satindar Dhillon on 4/13/15.
//  Copyright (c) 2015 Jaya. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
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
    
    @IBAction func billAmountChanged(sender: UITextField) {
        billAmount = Double((sender.text as NSString).doubleValue)
    }
    
    @IBAction func tipPercentageChanged(sender: UITextField) {
        tipPercentage = Double((sender.text as NSString).doubleValue)
    }
    
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var totalBill: UILabel!
    
    
    private func updateUI() {
        let tipAmount = billAmount * tipPercentage
        tip.text = String(format: "%0.2f", tipAmount)
        totalBill.text = String(format: "%0.2f", tipAmount + billAmount)
    }
    
}
