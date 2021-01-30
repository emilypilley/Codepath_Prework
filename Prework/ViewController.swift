//
//  ViewController.swift
//  Prework
//
//  Created by user187909 on 1/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let defaultTip = defaults.double(forKey: "defaultTip")
        
        tipControl.setTitle(String(format: "%.0f%%", defaultTip), forSegmentAt: 2)
        
        adjustTipLabels()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        adjustTipLabels()
    }
    
    func adjustTipLabels(){
        
        // get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18]
        var tip = 15.0
        
        if (tipControl.selectedSegmentIndex == 2){
            tip = bill * defaults.double(forKey: "defaultTip")/100.0
        }
        else {
            tip = bill *
                tipPercentages[tipControl.selectedSegmentIndex]
        }
        let total = bill + tip
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // update total amount label
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

