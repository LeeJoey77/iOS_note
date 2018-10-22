//
//  ViewController.swift
//  Extensions
//
//  Created by admin on 2018/3/30.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //扩展(Extensions)
        //扩展可以给现有的Class, struct, enum 或者 protocol 类型增加新的功能, 包括没有源码的类型, 但是不能重写现有方法.类似于 OC 的category, 不同的是 extensions 没有名字
        
        //1. 增加实例(类型)计算属性
        //2. 定义实例(类型)方法
        //3. 提供新的初始化方法
        //4. 定义下标
        //5. 定义并使用新的嵌套类型
        //6. 让现有的类型服从一个协议, 并实现协议的方法
        
        //1. 扩展语法
//        extension SomeType {
//            // new functionality to add to SomeType goes here
//        }

        //让现有类型服从协议, 并实现协议的方法
//        extension SomeType: SomeProtocol, AnotherProtocol {
//            // implementation of protocol requirements goes here
//        }
       
        //2. 给现有类型增加计算属性
        //扩展只能添加计算属性, 不能添加存储属性或者属性观察者
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        // Prints "One inch is 0.0254 meters"
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
        // Prints "Three feet is 0.914399970739201 meters"
        
        
        //3. 构造器
        //扩展可以增加新的便利构造器, 但是不能增加指定构造器和析构器, 指定构造器和析构器只能在原始类中实现
        
        //如果向一个值类型添加一个构造器, 该值类型的存储属性有默认值，而且没有定义任何定制构造器（custom initializers）时，你可以在值类型的扩展构造器中调用默认构造器(default initializers)和成员构造器(memberwise initializers)。但是如果你已经把构造器写成值类型原始实现的一部分，上述规则不再适用。
        
        //如果用扩展给另一个文件中的 struct 添加一个构造器, 新的构造器在调用原有文件的构造器之前不能使用 self
        
        struct Size {
            var width = 0.0, height = 0.0
        }
        struct Point {
            var x = 0.0, y = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size()
        }
        let defaultRect = Rect()
        let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
//        extension Rect {
//            init(center: Point, size: Size) {
//                let originX = center.x - (size.width / 2)
//                let originY = center.y - (size.height / 2)
//                self.init(origin: Point(x: originX, y: originY), size: size)
//            }
//        }
        
//        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
//                              size: Size(width: 3.0, height: 3.0))
        // centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
        
        //4. 方法
        //扩展可以添加实例方法和类型方法
        3.repetitions {
            print("hello, world")
        }
        
        //5. 可变实例方法(Mutating Instance Methods)
        //通过扩展添加的实例方法,可以修改实例本身.
        //struct, enum中修改 self 或属性,要将实例方法标记为 mutating
        
        var someInt = 3
        someInt.square()
        //someInt is now 9
        
        //6. 下标
        let aNum = 746381295
        print(aNum[0])
        //输出5
        print(aNum[1])
        
        //7. 嵌套类型
        //扩展可以给现有的 Class, struct, enum 添加嵌套类型
        func printIntegerKinds(_ numbers: [Int]) {
            for number in numbers {
                switch number.kind {
                case .negative:
                    print("- ", terminator: "")
                case .zero:
                    print("0 ", terminator: "")
                case .positive:
                    print("+ ", terminator: "")
                }
            }
            print("")
        }
        printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
        // Prints "+ + - 0 - 0 + "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


extension Int {
    //4
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    //5
    mutating func square() {
        self = self * self
    }
    
    //6
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
    
    //7. 嵌套枚举
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}


















