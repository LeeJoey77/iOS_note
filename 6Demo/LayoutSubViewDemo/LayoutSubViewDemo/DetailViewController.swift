//
//  DetailViewController.swift
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/11.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, CALayerDelegate {

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        DispatchQueue.once(token: "Deinit_Token") {[weak self] in
//            guard let strongSelf = self else { return }
//            //获取实例的类型
//            let object: AnyObject = object_getClass(strongSelf)!
//            //"\(object)": AntennaParameters.XXXXXX
//            //获取真正的类型名
//            let className = type(of: object).description().components(separatedBy: ".").last
//            DetailViewController.swizzleMethods(aClass: object as! AnyClass, origSel: Selector("deinit"), swizSel: Selector("myDeinit"))
//        }
//    }
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        DispatchQueue.once(token: "Deinit_Token") {[weak self] in
//            guard let strongSelf = self else { return }
//            //获取实例的类型
//            let object: AnyObject = object_getClass(strongSelf)!
//            //"\(object)": AntennaParameters.XXXXXX
//            //获取真正的类型名
//            let className = type(of: object).description().components(separatedBy: ".").last
//            DetailViewController.swizzleMethods(aClass: object as! AnyClass, origSel: Selector("deinit"), swizSel: Selector("myDeinit"))
//        }
//    }
    
    @IBOutlet weak var testBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
        let aView = LeeView(frame: UIScreen.main.bounds)
        aView.backgroundColor = UIColor(red: 249.0 / 255.0, green: 249.0 / 255.0, blue: 249.0 / 255.0, alpha: 1)
        view.addSubview(aView)
        
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
        layer.position = CGPoint(x: 160, y: 200)
        layer.backgroundColor = UIColor.red.cgColor
        //注意仅仅设置圆角，对于图形而言可以正常显示，但是对于图层中绘制的图片无法正确显示
        //如果想要正确显示则必须设置masksToBounds=YES，剪切子图层
//        layer.cornerRadius = 150 / 2
//        layer.masksToBounds = true
        //阴影效果无法和masksToBounds同时使用，因为masksToBounds的目的就是剪切外边框，
        //而阴影效果刚好在外边框
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 1
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        layer.delegate = self
        view.layer.insertSublayer(layer, at: 0)
        //调用图层setNeedDisplay,否则代理方法不会被调用
        layer.setNeedsDisplay()
//        let str = self.associatedObject_retain
//
//
//        let model = OCObjectModel()
//        model.getMethod()
    }

//    func display(_ layer: CALayer) {
//        
//    }
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        //layer 是自定义的图层
        ctx.saveGState()
        //图形上下文形变，解决图片倒立的问题
        ctx.scaleBy(x: 1, y: -1)
        ctx.translateBy(x: 0, y: -150)
        let image = UIImage(named: "qx")
        //注意这个位置是相对于图层而言的不是屏幕
        ctx.draw((image?.cgImage)!, in: CGRect(x: 0, y: 0, width: 150, height: 150))
        ctx.restoreGState()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let vc = storyboard?.instantiateViewController(withIdentifier: "AViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        let originNav = UIApplication.shared.keyWindow?.rootViewController
        if let nav = originNav as? UINavigationController {
            nav.popToRootViewController(animated: true)
        }
//        navigationController?.pushViewController(vc!, animated: true)
//        navigationController?.viewControllers.removeFirst()
    }
    
  
    deinit {
        print("\(self)")
    }
    
    func myDeinit() {
        print("")
    }
    
    private class func swizzleMethods(aClass: AnyClass, origSel: Selector, swizSel: Selector) {
        let origMethod = class_getInstanceMethod(aClass, origSel)
        let swizMethod = class_getInstanceMethod(aClass, swizSel)
        let isDidAddMethod = class_addMethod(aClass, origSel, method_getImplementation(swizMethod!), method_getTypeEncoding(swizMethod!))
        if isDidAddMethod {
            class_replaceMethod(aClass, swizSel, method_getImplementation(origMethod!), method_getTypeEncoding(origMethod!))
        }else {
            method_exchangeImplementations(origMethod!, swizMethod!)
        }
    }
    
    
}

protocol SelfAware: class {
    static func awake()
}

class NothingToSeeHere {
    static func harmlessFunction() {
        let typeCount = Int(objc_getClassList(nil, 0))
        let types = UnsafeMutablePointer<AnyClass>.allocate(capacity: typeCount)
        let autoreleasingTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)
        objc_getClassList(autoreleasingTypes, Int32(typeCount))
        for index in 0 ..< typeCount {
            (types[index] as? SelfAware.Type)?.awake()
        }
        types.deallocate(capacity: typeCount)
    }
}

extension UIViewController: SelfAware {
    static func awake() {
        UIViewController.classInit()
    }
    static func classInit() {
        swizzleMethod
    }
    @objc func swizzled_viewWillAppear(_ animated: Bool) {
        swizzled_viewWillAppear(animated)
        print("swizzled_viewWillAppear")
    }
    private static let swizzleMethod: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzled_viewWillAppear(_:))
        swizzlingForClass(UIViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
    private static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(forClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
        guard (originalMethod != nil && swizzledMethod != nil) else {
            return
        }
        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
    
}
extension UIApplication {
    private static let runOnce: Void = {
        NothingToSeeHere.harmlessFunction()
    }()

    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
}

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block: () -> Void) {
        objc_sync_enter(self);
        defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}
