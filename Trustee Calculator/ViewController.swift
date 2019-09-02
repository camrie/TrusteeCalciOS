//
//  ViewController.swift
//  Trustee Calculator
//
//  Created by Camrie Madsen on 9/1/19.
//  Copyright © 2019 Camrie Madsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var message: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        message.isHidden = true
    }
    
    @IBAction func calculate(_ sender: Any) {
        let amount = Double(self.amountField.text!)
        var total = 0.0;
//        if(amount!.isNaN || Double(amount!) < 0.0) {
        if(amount == nil || Double(amount!) < 0){
            message.text = "Please enter a positive number"
            message.isHidden = false
        } else {
            if (Double(amount!) >= 0.0 && Double(amount!) <= 5000.0) {
                total += 0.25 * amount! //25% of initial 5,000
                message.text = "The total is " + String(total)
                message.isHidden = false
            }
            else if(Double(amount!) > 5000 && Double(amount!) <= 50000) { //10% between 5001 & 50000
                let amount2 = Double(amount!) - 5000;
                total += 0.25 * 5000;
                total += 0.10 * amount2;
                message.text = "The total is " + String(total)
                message.isHidden = false
            } else if (Double(amount!) > 50000 && Double(amount!) <= 1000000) { //5% between 50001 and 1000000
                let amount2 = Double(amount!) - 50000;
                total += 0.25 * 5000;
                total += 0.10 * (50000-5000);
                total += 0.05 * amount2;
                message.text = "The total is " + String(total)
                message.isHidden = false
            } else if (Double(amount!) > 1000000) { //3% over 1,000,000
                let amount2 = Double(amount!) - 1000000;
                total += 0.25 * 5000;
                total += 0.10 * (50000-5000);
                total += 0.05 * (1000000-50000);
                total += 0.03 * amount2;
                message.text = "The total is " + String(total)
                message.isHidden = false
            }
        }
    }
    
}

