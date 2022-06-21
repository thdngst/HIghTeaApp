//
//  UIView+Extension.swift
//  High Tea Buddy App
//
//  Created by Rebecca on 9/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradient(colour1: UIColor, colour2: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colour1.cgColor, colour2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 15
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
