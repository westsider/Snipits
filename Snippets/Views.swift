//
//  UIView.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 26/01/2018.
//  Copyright © 2018 Matteo Manferdini. All rights reserved.
//

import UIKit

extension CGRect {
    func shifted(by x: CGFloat) -> CGRect {
        var newRect = self
        newRect.origin.x += x
        return newRect
    }
}

@IBDesignable class RoundImageView: UIImageView {}

@IBDesignable class RoundTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.shifted(by: 12.0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.shifted(by: 12.0)
    }
}

@IBDesignable class RoundTextView: UITextView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
}

@IBDesignable class Triangle: UIView {
    
    @IBInspectable var color: UIColor = .red
    
    @IBInspectable var firstPointX: CGFloat = 0
    
    @IBInspectable var firstPointY: CGFloat = 0
    
    @IBInspectable var secondPointX: CGFloat = 0.5
    
    @IBInspectable var secondPointY: CGFloat = 1
    
    @IBInspectable var thirdPointX: CGFloat = 1
    
    @IBInspectable var thirdPointY: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: self.firstPointX * rect.width, y: self.firstPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.secondPointX * rect.width, y: self.secondPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.thirdPointX * rect.width, y: self.thirdPointY * rect.height))
        aPath.close()
        self.color.set()
        self.backgroundColor = .clear
        aPath.fill()
    }
}

@IBDesignable class Circle: UIView {
    
    @IBInspectable var counterColor: UIColor = UIColor.red
    
    override func draw(_ rect: CGRect) {
        
        let arcWidth: CGFloat = 32
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        let startAngle: CGFloat = 0
        
        let endAngle: CGFloat = 360
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        path.fill()
        
    }
}

@IBDesignable class CircleBackgroundView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.width / 2
        layer.masksToBounds = true
    }
}

