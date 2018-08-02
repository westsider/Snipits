//
//  Segmented Control.swift
//  Snippets
//
//  Created by Warren Hansen on 8/2/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    // dont convert the integer when saving to user defaults
    // get the segmented contol as an int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lastSegment = defaults.integer(forKey: "segment")
        print("Last segment was \(lastSegment)")
        segmentedControl.selectedSegmentIndex = lastSegment
        
    }
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            print("0 Segment Selected")
            defaults.set(0, forKey: "segment")
        case 1:
            print("1 Segment Selected")
            defaults.set(1, forKey: "segment")
        case 2:
            print("2 Segment Selected")
            defaults.set(2, forKey: "segment")
        case 3:
            print("3 Segment Selected")
            defaults.set(3, forKey: "segment")
        default:
            break
        }
    }
    
}
