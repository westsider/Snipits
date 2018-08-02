//
//  Valid Email.swift
//  Snippets
//
//  Created by Warren Hansen on 7/30/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        var answer:Bool = false
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        answer = emailPredicate.evaluate(with:self)
        // super secure user allowed here
        if self.count > 20 {
            answer = true
        }
        return answer
    }
}
