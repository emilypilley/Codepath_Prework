//
//  SettingsViewController.swift
//  Prework
//
//  Created by user187909 on 1/23/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipAmount: UISlider!
    @IBOutlet weak var showTipSlider: UISwitch!
    @IBOutlet weak var defaultTipSliderValue: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultTip = defaults.integer(forKey: "defaultTip") ?? 20

        defaultTipSliderValue.text = String(format: "%d%%", defaultTip)
        
        defaultTipAmount.value = Float(defaultTip)
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let defaultTip = Int(defaultTipAmount.value)
        
        defaultTipSliderValue.text = String(format: "%d%%", defaultTip)
        
        defaults.set(defaultTip, forKey: "defaultTip")
        defaults.synchronize()
        
        print(defaultTip)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
