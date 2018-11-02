//
//  Round Numbers.swift
//  Snippets
//
//  Created by Warren Hansen on 11/1/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation

class RoundNumbers {
    // round double
    func roundTo(value: Double, places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (value * divisor).rounded() / divisor
    }
    // print(roundTo(value: 1.239, places: 2))
    
    // round decimal
    var b:Decimal = 1.4490783972364
    func roundDecimal(forValue: inout Decimal)-> Decimal {
        var drounded: Decimal = Decimal()
        NSDecimalRound(&drounded, &forValue, 2, .plain)
        return drounded
    }
    // print(roundDecimal(forValue: &b))
}
