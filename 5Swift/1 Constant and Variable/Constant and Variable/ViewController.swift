//
//  ViewController.swift
//  Constant and Variable
//
//  Created by admin on 2018/1/26.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
         Swift 是一门类型安全(Type Safety)的语言，编译时会检查进行类型检查(type checks)，类型不匹配会报错,然而这并不意味着要声明每一个常量或变量的类型，编码器会通过所赋值的类型进行类型推断(Type inference),但是必须声明是常量还是变量
         */
        
        //一、常量、变量
        //1.常量let，变量var
        //声明时进行初始化,不需要写数据类型，会根据值的类型进行Type inference
        //整数推断为Int
        let maximumNumberOfLoginAttempts = 10
        //浮点型推断为 Double,必须有小数点
        var currentLoginAttempt = 1.0
        //可以在一行中声明多个常量或变量
        var x = 1, y = 2, z:String
        
        //2.类型标注，指定变量类型，声明时没有初始化时使用 (冒号+空格)
        var welcomeMessage: String = "Hello world!"
        var red = 1.0, blue, green: Double
        
        //3.命名不能包含空格，数学符号，-，箭头，Unicode保留字符，制表符等，不能以数字开头变量名不能相同，定义后不能改变数据类型，不能将常量变为变量，反之亦然。
        //不要使用Swift保留关键字作为变量名，必须使用时在变量名前后加单引号
        var `var`: String//(避免使用)
        
        //二、print 常量，变量
        //默认换行，terminator设为空不会换行
        print(maximumNumberOfLoginAttempts, separator: welcomeMessage, terminator: "")
        print(currentLoginAttempt)
        //字符串插入变量或常量，用括号裹起来，前边加反斜杠
        print("The current value of friendlyWelcome is \(red + 1)")
        
        //三、注释，多行注释\* *\可以嵌套
        //四、分号，不需要写分号，但是一行写多句代码需要写分号
        let cat = "🐱"; print(cat)
        
        //五、Int，整数的定义尽量使用Int，自动适配系统字节，64位系统，定义的就是64字节数据。32位系统，定义的就是32字节数据。保证代码一致性和互用性
        //Int （signed and unsigned integers）整数（正数，负数和零）
        //UInt （unsigned integer ）,无符号整数（正数和零），***避免使用***
        //Integer，支持8，16，32，64字节格式，需要手动匹配，例如8字节无符号数据类型要在前面加 UInt8
        let minValue = UInt8.min //八字节最小值，0
        let maxValue = UInt8.max //八字节最大值，255
        
        //六、浮点型，Double 64字节浮点型，Float 32 字节浮点型。两种都可以时优先使用Double
        
        //七、进制
        //Int, Float-Point decimal(十) 无前缀,binary(二) 0b,octal(八) 0o,hexadecimal 0x(十六)
        let decimalInteger = 17 //十进制17
        let binaryInteger = 0b10001 //二进制17
        let octalInteger = 0o21 //八进制17
        let hexadecimal = 0x11 //十六进制17
        
        //进制之间转换：八进制 Int范围：-127~127， UInt范围：0~255
        //let cannotbeNegative: UInt8 = -1   //超出范围报错
        //let tooBig: UInt8 = UInt8.max + 1
        //不同进制运算
        let twoThousand: UInt16 = 2000
        let one: UInt8 = 1
        let twoThousandAndOne = twoThousand + UInt16(one)
        
        //八. 类型转换
        //Int 和 Float-Point转换
        let three = 3
        let pointOneFourOneFiveNine = 0.14159
        let pi = Double(three) + pointOneFourOneFiveNine
        let integerpi = Int(pi) //integerpi = 3
        
        //类型重命名Type Aliases
        typealias AudioSample = UInt16
        var maxAmplitudeFound = AudioSample.max
        
        //波尔值
        let orangesAreOrange = true
        let turnipsAreDelicious = false
        if turnipsAreDelicious {
            print("Mmm, tasty turnips!")
        } else {
            print("Eww, turnips are horrible.")
        }
        //不能直接用 1 代表 true,但可以写成以下形式用于if语句
        /*
         let i = 1
         if i {
         // this example will not compile, and will report an error
         }
         */
        let i = 1
        if i == 1 {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

