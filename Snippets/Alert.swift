//
//  Alert.swift
//  Snippets
//
//  Created by Warren Hansen on 2/7/19.
//  Copyright © 2019 Warren Hansen. All rights reserved.
//

import UIKit

class Alert {
    
    class func showBasic(title:String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if let topVC = UIApplication.getTopViewController() {
            topVC.present(alert, animated: true)
        }
    }
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

//class Alert {
//
//    class func showBasic(title:String, message: String) {
//
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
//    }
//
//}
//
//// this is to call an alert from the model
//extension UIApplication {
//
//    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
//
//        if let nav = base as? UINavigationController {
//            return topViewController(base: nav.visibleViewController)
//        }
//
//        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
//            return topViewController(base: selected)
//        }
//
//        if let presented = base?.presentedViewController {
//            return topViewController(base: presented)
//        }
//
//        return base
//    }
//}

