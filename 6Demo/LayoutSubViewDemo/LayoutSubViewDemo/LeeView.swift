//
//  LeeView.swift
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/21.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit

class LeeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let layer = LeeCALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 185, height: 185)
        layer.position = CGPoint(x: 160, y: 284)
        layer.backgroundColor = UIColor(red: 0, green: 146.0 / 255.0, blue: 1.0, alpha: 1).cgColor
        layer.setNeedsDisplay()
        self.layer.addSublayer(layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print(UIGraphicsGetCurrentContext())
    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
        print(ctx)
    }
    
}
