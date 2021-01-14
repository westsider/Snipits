//
//  User Defaults.swift
//  Snippets
//
//  Created by Warren Hansen on 8/2/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation
import UIKit

class MyDefaults {
    
    class func setDefauts() {

        let defaults = UserDefaults.standard
        defaults.set("Anand", forKey: "name")
        defaults.set(25, forKey: "age")
        defaults.set(true, forKey: "UseTouchID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        defaults.set("Paul Hudson", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let name = defaults.string(forKey: "name") ?? ""
        let age = defaults.integer(forKey: "Age")
        let useTouchID = defaults.bool(forKey: "UseTouchID")
        let pi = defaults.double(forKey: "Pi")
        
        print(name, age, useTouchID, pi)
    }
}

