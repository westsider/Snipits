//
//  Slider Control.swift
//  Snippets
//
//  Created by Warren Hansen on 8/2/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit


class SliderViewController: UIViewController {
    
    @IBOutlet weak var sliderControl: UISlider!
    
    let defaults = UserDefaults.standard
    
    // dont convert the user default to float!
    // retrieve the user default as float
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lastSliderValue = defaults.float(forKey: "MaxDistance2")
        let mStr = String(format: "%.1f", lastSliderValue)
        print("Last slider value \(mStr)")
        sliderControl.setValue(lastSliderValue, animated: true)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = sender.value
        let mStr = String(format: "%.1f", currentValue)
        print("New Slider Value \(mStr)")
        defaults.set(currentValue, forKey: "MaxDistance2")
    }
}
