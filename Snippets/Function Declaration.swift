//
//  Function Declaration.swift
//  Snippets
//
//  Created by Warren Hansen on 9/25/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation

enum MyError: Error {
    case invalidRecipient
}

/**
 Creates a personalized greeting for a recipient.
 
 - Parameter recipient: The person being greeted.
 
 - Throws: `MyError.invalidRecipient`
 if `recipient` is "Derek"
 (he knows what he did).
 
 - Returns: A new string saying hello to `recipient`.
 */
func greeting(to recipient: String) throws -> String {
    guard recipient != "Derek" else {
        throw MyError.invalidRecipient
    }
    return "Greetings, \(recipient)!"
}
