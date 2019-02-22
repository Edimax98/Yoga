//
//  TopCurvedView.swift
//  Yoga
//
//  Created by Даниил on 16/01/2019.
//  Copyright © 2019 SFB Tech. All rights reserved.
//

import UIKit

class TopCurvedView: UIView {


    override func draw(_ rect: CGRect) {
    
        let y:CGFloat = 20
        let curveTo:CGFloat = 0
        let fillColor = UIColor(red: 146 / 255, green: 62 / 255, blue: 1, alpha: 1)
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(4.0)
        fillColor.setFill()
        myBezier.fill()
    }
}
