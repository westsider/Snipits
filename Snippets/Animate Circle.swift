//
//  Animate Circle.swift
//  Snippets
//
//  Created by Warren Hansen on 8/22/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

/*
         @IBOutlet weak var circleView: UIView!
 
         @IBOutlet weak var buttonText: UIButton!
 
         let animateCircle = AnimateCircle()
 
         var toggleCircle:Bool = false
 
         @IBAction func buttonWasPressed(_ sender: UIButton) {
 
             toggleCircle ? buttonText.setTitle("stop", for: .normal) : buttonText.setTitle("animate", for: .normal)
             toggleCircle ? animateCircle.startUp(viewToModel: circleView, toggleStop: toggleCircle) : animateCircle.startUp(viewToModel: circleView, toggleStop: toggleCircle)
             toggleCircle = toggleCircle ? false : true
         }
 */
import UIKit

class AnimateCircle {
    
    let outerRimLayer = CAShapeLayer()
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    let fadeAnimation = CABasicAnimation(keyPath: "opacity")
    
    func startUp(viewToModel:UIView, toggleStop:Bool) {
        
        if toggleStop {
            outerRimLayer.removeAnimation(forKey: "drawLineAnimation")
            outerRimLayer.removeAnimation(forKey: "FadeAnimation")
            outerRimLayer.removeFromSuperlayer()
            return
        }
        
        var outerRim: UIBezierPath{
            let bezierPath = UIBezierPath()
            let arcCenter = CGPoint(x: viewToModel.frame.size.height / 2 , y: viewToModel.frame.size.width / 2)
            bezierPath.addArc(withCenter: arcCenter, radius: (viewToModel.frame.size.width / 2) - 10, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
            return bezierPath
        }
        
        outerRimLayer.path = outerRim.cgPath
        let customColor:CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        outerRimLayer.strokeColor = customColor
        outerRimLayer.fillColor = UIColor.clear.cgColor
        outerRimLayer.lineWidth = 10.0
        outerRimLayer.lineDashPattern = [2,3]
        viewToModel.layer.addSublayer(outerRimLayer)
        
        animation.fromValue = 0.0
        animation.byValue = 1.0
        animation.duration = 4.0
        animation.fillMode = kCAFillModeForwards
        animation.repeatDuration = .infinity
        outerRimLayer.add(animation, forKey: "drawLineAnimation")
        
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.25
        fadeAnimation.duration = 4.0
        fadeAnimation.repeatCount = Float.greatestFiniteMagnitude
        outerRimLayer.add(fadeAnimation, forKey: "FadeAnimation")
    }
}
