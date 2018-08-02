//
//  Parse JSON.swift
//  Snippets
//
//  Created by Warren Hansen on 7/30/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation


/*
     call from Network Call
 
     NetworkCall.getPricesFor(ticker: "AAPL", debug: true) { (response) in
         debugPrint(response)
         ParseJSON.getJSON(json: response, debug: true)
     }
*/

class ParseJSON {
    
    class func getJSON(json: [String: Any], debug:Bool) {
        
        var priceArry:[(date:Date, close:Double)] = []
        guard let time = json["Time Series (Daily)"] as? NSDictionary else { return }
        
        for (key, value) in time {
            guard let stringDate:String = key as? String  else { return }
            guard let date = Utilities.convertToDateFrom(string: stringDate, debug: false) else { return }
            guard let value = value as? Dictionary<String, String>  else { return }
            guard let close = value["4. close"] else { return }
            let closeDouble = (close as NSString).doubleValue
            priceArry.append((date: date , close: closeDouble))
        }
        
        let dateSort = priceArry.sorted(by: {$0.date < $1.date})
        
        if debug {
            for each in dateSort {
                print("\(each.date) \t\(each.close)")
            }
        }
    }
}


