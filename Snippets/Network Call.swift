//
//  Network Call.swift
//  Snippets
//
//  Created by Warren Hansen on 7/30/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation

/// Standard Network Call
/*
    NetworkCall.getPricesFor(ticker: "AAPL", debug: true) { (response) in
        debugPrint(response)
    }
*/
class NetworkCall {
    
    class func getPricesFor(ticker:String, debug:Bool, callback: @escaping ([String: Any]) -> ()) {
        
        let alphaApiKey = "your-API-Key"
        //let url2 = URL(string: "https://learnappmaking.com/ex/users.json")!
        guard let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=\(ticker)&apikey=\(alphaApiKey)") else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print("\(error.debugDescription)")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Big problems with json serialization")
                return
            }

            callback(json)
        }
        task.resume()
    }
}
