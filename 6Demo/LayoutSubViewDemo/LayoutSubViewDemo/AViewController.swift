//
//  AViewController.swift
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/17.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit

class AViewController: UIViewController, CALayerDelegate {

    var layer: CALayer!
    var imageLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let uInt8Value: UInt8 = 255
        let twoThousand: UInt16 = 20_000
        let twoThousandAndOne = UInt16(uInt8Value) + twoThousand
        
        #if TEST
        print("haha")
        #if DEBUG
        print("release")
        #endif
        #endif
        class AClass<T> {
            var key: String?
            
            init(str: String) {
                key = str
            }
        }
        let cl = AClass<Bool>(str: "class")
        
        
        // Do any additional setup after loading the view.
        
//        let backGroundImage = UIImage(named: "123")
//        view.backgroundColor = UIColor.init(patternImage: backGroundImage!)
//
//        imageLayer = CALayer()
//        imageLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
//        imageLayer.position = CGPoint(x: 235.0, y: 376.0)
//        imageLayer.contents = UIImage(named: "mom.jpg")?.cgImage
//        view.layer.addSublayer(imageLayer)
//
//        translatonAnimation()
        
//        layer = CALayer()
//        layer.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
//        layer.bounds = CGRect(x: 50, y: 50, width: 100, height: 100)
//        layer.position = CGPoint(x: 100, y: 100)
//        layer.anchorPoint = CGPoint(x: 1, y: 1)
//        layer.delegate = self
//        layer.backgroundColor = UIColor.blue.cgColor
//        view.layer.addSublayer(layer)
//        layer.setNeedsDisplay()
//
//        let subLayer = CALayer()
//        subLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        subLayer.backgroundColor = UIColor.yellow.cgColor
//        layer.addSublayer(subLayer)
//        let image = UIImage(named: "qx")
//        subLayer.contents = image?.cgImage
//
//        var outCount: UInt32 = 0
//        let ivars = class_copyIvarList(object_getClass(self), &outCount)
//        print(ivars!)
        
//        let prices = [20, 30, 40]
//        let pris = prices.map({"\($0)"})
//        print(pris)
//        let strs = prices.map { (price) -> String in
//            return "$\(price)"
//        }
//        print(strs)
//
//        let values = [4, 6, 9]
//        let squares = values.map { (value) -> Int? in
//            return value * value
//        }
//        print(squares)
//
//        let array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//        let arr1 = array.map { $0 }
//        print(arr1)
//
//        let arr2 = array.compactMap { $0 }
//        print(arr2)
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        layer.delegate = nil
        print("deinit ~ \(self)")
    }
    
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.saveGState()
        ctx.scaleBy(x: 1, y: -1)
        ctx.translateBy(x: 0, y: -150)
        let image = UIImage(named: "qx")
        ctx.draw((image?.cgImage)!, in: CGRect(x: 0, y: 0, width: 150, height: 150))
        ctx.restoreGState()
        
    }
    
    func translatonAnimation() {
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        let key1 = NSValue(cgPoint: imageLayer.position)
        let key2 = NSValue(cgPoint: CGPoint(x: 320.5, y: 286.5))
        let key3 = NSValue(cgPoint: CGPoint(x: 340.5, y: 221.0))
        let key4 = NSValue(cgPoint: CGPoint(x: 317.5, y: 186.0))
        let key5 = NSValue(cgPoint: CGPoint(x: 234.0, y: 169.5))
        let key6 = NSValue(cgPoint: CGPoint(x: 238.0, y: 148.0))
        let key7 = NSValue(cgPoint: CGPoint(x: 205.5, y: 132.5))
        let key8 = NSValue(cgPoint: CGPoint(x: 210.5, y: 118.5))
        let key9 = NSValue(cgPoint: CGPoint(x: 283.5, y: 99.0))
        let values = [key1, key2, key3, key4, key5, key6, key7, key8, key9]
        keyframeAnimation.values = values
        keyframeAnimation.duration = 30.0
        keyframeAnimation.beginTime = CACurrentMediaTime()
        imageLayer.add(keyframeAnimation, forKey: "KCBasicAnimation_Translation")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
//        let touch = touches.first
//        let location = touch?.location(in: view)
//        print(location!)
//        translatonAnimation(location: location!)
    }
}
