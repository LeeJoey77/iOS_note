//
//  ViewController.swift
//  Properties
//
//  Created by admin on 2018/2/27.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

protocol SomeProtocol {
    var number: Int {get set}
}

extension SomeProtocol {
    var number: Int {
        get {//在 get 方法中使用 get 方法, 会崩溃
            return self.number
        }
        set {
            
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //存储属性存储常量或变量作为实例的一部分，计算属性计算并返回一个值
        //存储属性只能用于 Class, struct, 计算属性可以用于 Class, struct, enum
        //存储属性可以是常量, 变量, 计算属性必须为变量
        
        //1. 存储属性
        struct FixedLengthRange {
            var firstValue: Int
            let length: Int
        }
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        rangeOfThreeItems.firstValue = 6
        
        //2. 常量 struct 的存储属性
        //值类型的实例被声明为常量的时, 它的所有属性(包括 var 属性)也就成了常量, 不能再改变
        //引用类型则不一样, 把一个引用类型的实例赋给一个常量后，仍然可以修改实例的变量属性
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//        rangeOfFourItems.firstValue = 1
        
        //3. 延迟存储属性(Lazy Stored Properties)
        //延迟存储属性必须声明为 var，因为lazy stored property的值在实例构造完成之前可能无法得到, 而 let 属性在 init 完成之前必须要有初始值，因此无法声明成lazy stored property。
        class DataImporter {
            /*
             DataImporter 是一个将外部文件中的数据导入的类。
             这个类的初始化会消耗不少时间。
             */
            var fileName = "data.txt"
        }
        
        class DataManager {
            lazy var importer = DataImporter()
            var data = [String]()
            // 这是提供数据管理功能
        }
        
        let manager = DataManager()
        manager.data.append("some data")
        manager.data.append("some more data")
        // DataImporter 实例的 importer 属性还没有被创建

        print(manager.importer.fileName)
        // DataImporter 实例的 importer 属性现在被创建了
        // 输出 "data.txt”
        
        //4. 存储属性和实例变量
        
        //5. 计算属性
        //必须使用 var 定义计算属性，因为它们的值不是固定的
        struct Point {
            var x = 0.0, y = 0.0
        }
        
        struct Size {
            var width = 0.0, height = 0.0
        }
        
        struct Rect: SomeProtocol {
            var origin = Point()
            var size = Size()
            var center: Point {//读写计算属性
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.y + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                set(newCenter) {
                    origin.x = newCenter.x - (size.width / 2)
                    origin.y = newCenter.y - (size.height / 2)
                }
            }
        }
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.center.x), \(square.center.y)), ")
        
        //6. 便捷 setter 声明
        //如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称newValue
        struct AlternativeRect {
            var origin = Point()
            var size = Size()
            var afd: Int {
                get {
                    
                    return 3
                }
                set {
                    newValue
                }
            }
            var center: Point {
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.y + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                set {
                    origin.x = newValue.x - (size.width / 2)
                    origin.y = newValue.y - (size.height / 2)
                }
            }
        }
        
        //7. 只读计算属性
        //只有 getter 没有 setter 的计算属性
        //只读计算属性的声明可以去掉get关键字和花括号
        struct Cuboid {
            var width = 0.0, height = 0.0, depth = 0.0
            var volume: Double {
                return width * height * depth
            }
        }
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
        
        //8. 属性观察器
        //每次属性被设置值的时候都会调用，即使新的值和现在的值相同
        //存储属性可以添加属性观察器, 除了 lazy stored property
        //可以通过重写属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。
        
        //注意:
        //不需要为无法重载的计算属性添加属性观察器，因为可以通过 setter 直接监控和响应值的变化。
        //可以为属性添加如下的一个或两个观察器:
        //willSet在设置新的值之前调用
        //didSet在新的值被设置之后立即调用
        //willSet观察器会将新的属性值作为固定参数传入，在willSet的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称newValue表示。
        //类似地，didSet观察器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名oldValue。
        
        //注意:
        //willSet和didSet观察器在属性初始化过程中不会被调用，它们只会当属性的值在初始化之外的地方被设置时被调用。

        class StepCounter {
            var totalSteps: Int = 0 {
                willSet(newTotalSteps) {
                    print("About to set totalSteps to \(newTotalSteps)")
                }
                didSet {
                    if totalSteps > oldValue {
                        print("Added \(totalSteps - oldValue) steps")
                    }
                }
            }
        }
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // About to set totalSteps to 200
        // Added 200 steps
        stepCounter.totalSteps = 360
        // About to set totalSteps to 360
        // Added 160 steps
        //注意：
        //如果在didSet观察器里为属性赋值，这个值会替换观察器之前设置的值。
        
        //9. 全局变量和局部变量
        //全局变量是在函数、方法、闭包或任何类型之外定义的变量，局部变量是在函数、方法或闭包内部定义的变量
        //前面章节提到的全局或局部变量都属于存储型变量，跟存储属性类似，它提供特定类型的存储空间，并允许读取和写入。
        //全局的常量或变量都是延迟计算的，跟延迟存储属性相似，不同的地方在于，全局的常量或变量不需要标记 lazy 特性。
        //局部范围的常量或变量不会延迟计算。
        
        //10. 类型属性
        //Swift 中，类型属性在类中定义，因此它的作用范围也就在类的范围内
        //Class, struct, enum 中使用关键字static 来定义类型属性, 不允许重写
        //Class 中可以使用关键字 class 允许子类重写父类的实现
        //和实例的存储属性不同，必须给存储型类型属性指定默认值，因为类型本身无法在初始化过程中使用构造器给类型属性赋值
        
        //值类型(struct, enum)可以定义 stored 类型属性和 computed 类型属性
        //Class 只能定义 computed 类型属性
        //必须使用 var 定义计算属性，因为它们的值不是固定的

        
        struct SomeStructure {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 1
            }
        }
        enum SomeEnumeration {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 6
            }
        }
        class SomeClass {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 27
            }
            class var overrideableComputedTypeProperty: Int {
                return 107 + SomeEnumeration.computedTypeProperty
            }
        }
        //对于 class, 使用关键字 class 修饰的计算属性允许子类重写
        class SomeSubClass: SomeClass {
            override class var overrideableComputedTypeProperty: Int {
                return 107 + SomeStructure.computedTypeProperty
            }
        }
        //注意:
        //例子中的计算型类型属性是只读的，但也可以定义可读可写的计算型类型属性，跟实例计算属性的语法类似。
        
        //12. 获取和设置类型属性的值
        //跟实例的属性一样，类型属性的访问也是通过点语法来进行
        
        print(SomeStructure.storedTypeProperty)
        // Prints "Some value."
        SomeStructure.storedTypeProperty = "Another value."
        print(SomeStructure.storedTypeProperty)
        // Prints "Another value."
        print(SomeEnumeration.computedTypeProperty)
        // Prints "6"
        print(SomeClass.computedTypeProperty)
        // Prints "27"
        print(SomeClass.overrideableComputedTypeProperty)
        print(SomeSubClass.overrideableComputedTypeProperty)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

