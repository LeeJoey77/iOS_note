//
//  ViewController.swift
//  Classes and Structures
//
//  Created by admin on 2018/2/26.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Swift 中类和结构体的共同点：
        //1. 定义属性用于存储值
        //2. 定义方法用于提供功能
        //3. 定义下标用于访问值
        //4. 定义构造器用于生成初始化值
        //5. 通过扩展以增加默认实现的功能
        //6. 符合协议以对某类提供标准功能
        
        //Class 不同于 Struct 的特点:
        //1. 允许一个类继承另一个类的特征
        //2. 类型转换(Type casting)允许在运行时检查和解释一个类实例的类型
        //3. 解构器允许一个类实例释放任何其所被分配的资源
        //4. 引用计数允许对一个类的多次引用
        
        //1. 定义类和结构体
        //类和结构体定义方式类似
        class SomeClass {
            
        }
        
        struct SomeStruct {
            
        }
        
        //每定义一个类和结构体, 相当于定义了一个 Swift类型. 所以名字要UpperCamelCase 方式命名(如 SomeClass 和SomeStructure等)
        //属性和方法命名用 lowerCamelCase (如framerate和incrementCount)
        
        struct Resolution {
            var width = 0
            var height = 0
        }
        
        class VideoMode {
            var resolution = Resolution()
            var interlaced = false
            var frameRate = 0.0
            var name: String?
        }
        
        //2. 类和结构体实例
        //直接加括号生成的实例, 其属性均会被初始化为默认值
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        
        
        //属性访问, 点语法
        print("The width of someResolution is \(someResolution.width)")
        // 输出 "The width of someResolution is 0"
        
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        // 输出 "The width of someVideoMode is 0"
        
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        // 输出 "The width of someVideoMode is now 1280"
        
        //注意： 与 Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性。上面的最后一个例子，就是直接设置了someVideoMode中resolution属性的width这个子属性，以上操作并不需要重新设置resolution属性。
        
        //3. 结构体类型的成员逐一构造器(Memberwise Initializers for structure Types)
        //所有结构体都有一个自动生成的成员逐一构造器
        //类没有默认的成员逐一构造器
        let vga = Resolution(width:640, height: 480)
        
        //4. 结构体和枚举是值类型
        /*值类型被赋给一个变量(常量)或者被传递给一个函数的时候，实际上是值的拷贝。
         
         在 Swift 中所有的基本类型---整数（Integer）、浮点数（floating-point）、布尔值（Booleans）、字符串（string)、数组（array）和字典（dictionaries），都是值类型，并且都是以结构体的形式在后台所实现。
         
         在 Swift 中，所有的结构体和枚举都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。
        */
        
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        //Resolution是值类型，所以cinema的值其实是hd的一个拷贝副本，而不是hd本身
        cinema.width = 2048
        print("cinema is now  \(cinema.width) pixels wide")
        // 输出 "cinema is now 2048 pixels wide"
        print("hd is still \(hd.width ) pixels wide")
        // 输出 "hd is still 1920 pixels wide"
        
        //枚举也是值类型
        enum CompassPoint {
            case North, South, East, West
        }
        var currentDirection = CompassPoint.West
        let rememberDirection = currentDirection
        currentDirection = .East
        if rememberDirection == .West {
            print("The remembered direction is still .West")
        }
        // 输出 "The remembered direction is still .West"
        
        //5. Class 是引用类型
        //与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，操作的是引用，其并不是拷贝。因此，引用的是已存在的实例本身而不是其拷贝。
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        // 输出 "The frameRate property of theEighty is now 30.0"
        
        //需要注意的是tenEighty和alsoTenEighty被声明为常量（（constants）而不是变量。然而你依然可以改变tenEighty.frameRate和alsoTenEighty.frameRate,因为这两个常量本身不会改变。它们并不存储这个VideoMode实例，在后台仅仅是对VideoMode实例的引用。所以，改变的是被引用的基础VideoMode的frameRate参数，而不改变常量的值。
        
        //6. 恒等运算符
        //因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例。
        //判读两个常量或变量是否引用同一个类实例,可以用恒等运算符: 等价于(===), 不等价于(!==)
        if tenEighty === alsoTenEighty {
            print("tenTighty and alsoTenEighty refer to the same Resolution instance.")
        }
        //输出 "tenEighty and alsoTenEighty refer to the same Resolution instance."
        
        //请注意“等价于"（用三个等号表示，===） 与“等于"（用两个等号表示，==）的不同：
        
        //“等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
        //“等于”表示两个实例的值“相等”或“相同”，判定时要遵照类设计者定义的评判标准，因此相比于“相等”，这是一种更加合适的叫法。
        
        //7. 指针
        //一个 Swift 常量或者变量引用一个引用类型的实例与 C 语言中的指针类似，不同的是并不直接指向内存中的某个地址，不用使用 * 号。Swift 中这些引用与其它的常量或变量的定义方式相同。
        
        //8. 类和结构体的选择
        //结构体的适用场景:
        //结构体的主要目的是用来封装少量相关简单数据值。
        //有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
        //任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
        //结构体不需要去继承另一个已存在类型的属性或者行为。
        
        //合适的结构体候选者包括：
        //几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
        //一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
        //三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
        
        //在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。
        
        //9.  Strings, Arrays, Dictionaries的赋值和拷贝行为
        //Swift 中字符串（String）,数组（Array）和字典（Dictionary）类型均以结构体的形式实现, 是值类型. 这意味着当用它们给其它常量或变量,函数赋值时,都会被复制.
        //Objective-C中字符串（NSString）,数组（NSArray）和字典（NSDictionary）类型均以类的形式实现，是引用类型。
        //注意: 实际 copy 由系统管理优化,只有确有必要，实际（actual）拷贝才会被执行。Swift 管理所有的值拷贝以确保性能最优化的性能
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

