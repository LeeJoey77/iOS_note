//
//  LeeCALayer.swift
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/21.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit

class LeeCALayer: CALayer {

    override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        ctx.setFillColor(red: 135.0 / 255.0, green: 232.0 / 255.0, blue: 84.0 / 255.0, alpha: 1)
        ctx.setStrokeColor(red: 135.0 / 255.0, green: 232.0 / 255.0, blue: 84.0 / 255.0, alpha: 1)
        ctx.move(to: CGPoint(x: 94.5, y: 33.5))
        
        ctx.addLine(to: CGPoint(x: 104.02, y: 47.29))
        ctx.addLine(to: CGPoint(x: 120.18, y: 52.16))
        ctx.addLine(to: CGPoint(x: 109.91, y: 65.51))
        ctx.addLine(to: CGPoint(x: 110.37, y: 82.34))
        ctx.addLine(to: CGPoint(x: 94.5, y: 76.7))
        ctx.addLine(to: CGPoint(x: 78.63, y: 82.34))
        ctx.addLine(to: CGPoint(x: 79.09, y: 65.51))
        ctx.addLine(to: CGPoint(x: 68.82, y: 52.16))
        ctx.addLine(to: CGPoint(x: 84.98, y: 47.39))
        ctx.drawPath(using: CGPathDrawingMode.fillStroke)
    }
    
    
    
    
}
