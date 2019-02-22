//
//  UIViewExtension.swift
//  Yoga
//
//  Created by Даниил on 16/01/2019.
//  Copyright © 2019 SFB Tech. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.frame.height)
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = [0.45]
        gradient.startPoint = CGPoint(x: 1.0,y: 0.0)
        gradient.endPoint = CGPoint(x: 0.3,y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }

    func dropShadow(color: UIColor = .black, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
            
            layer.masksToBounds = false
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = opacity
            layer.shadowOffset = offSet
            layer.shadowRadius = radius
            
            layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//            layer.shouldRasterize = true
//            layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
        
        func makeCornerRadius(_ radius: CGFloat) {
            layer.cornerRadius = radius
            layer.masksToBounds = true
        }
}
