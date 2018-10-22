//
//  ViewController.swift
//  Tuples and Optionals
//
//  Created by admin on 2018/1/26.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //一. 元组(Tuples)
        //元组适合临时的相关的数据，如函数返回值，不适合复杂的数据结构，复杂的数据结构用类(class)或结构体(structure)定义
        
        //1. 元组的定义
        //元组包含多个值，每个值的类型可以不同
        let http404Error = (404, "Not Found")
    
        //2. 获取元组中的元素
        let (statusCode, statusMessage) = http404Error
        print("The status code is \(statusCode)") //The status code is 404
        print("The status message is \(statusMessage)") //The status message is Not Found
        //只需要其中一个元素时，其它元素用(_)代替
        let (justTheStausCode, _) = http404Error
        print("The status code is \(justTheStausCode)")
        //用下标
        print("The status code is \(http404Error.0)")
        print("The status message is \(http404Error.1)")
        //3. 定义元组时可以给元组元素命名
        let http200Status = (statusNum: 200, description: "OK")
        print("The status code is \(http200Status.statusNum)")
        print("The status code is \(http200Status.description)")
        
        
        //二. 可选类型(Optionals)
        //表达形式: 类型名 + ?
        //可选类型表示有一个值，或者没有值
        
        //1. 类型转换中的可选类型
        //类型转换时不一定可以转换成功,返回值类型为可选类型
        let possibleNumber = "123"//只有字符串是明显的数字才可以转换为Int类型,否则为nil
        let str = "gagag"
        
        let convertedNumber = Int(possibleNumber)//convertedNumber 返回值类型为 Int？(可选整形), 表示可能包含一个Int值，或者没有值
        print(convertedNumber, Int(str))
        //输出: Optional(123), nil
        print(convertedNumber!)// 强制解包
        //输出: 123
        
        //2.可选类型中的 nil
        /*
          和OC 中的nil不同，OC 中的nil是一个指针，指向不存在的对象。
          Swift中的nil不是指针，代表某个值不存在，任何可选类型的值都可以设为nil，不只是对象
         
          可选类型的值可设为nil,非可选类型的变量或常量值不能设为nil
         */
        var serverResponseCode: Int? = 400
        serverResponseCode = nil
        //可选类型初始化时没有赋值，自动设为nil
        var surveyAnswer: String? //surveyAnswer = nil
        
        //3. if语句
        //可以用if语句判断一个可选类型是否有值
        if convertedNumber != nil {
            print("convertedNumber contains some integer value.")
        }
        
        //4. 强制解包(Forced Unwrapping)
        //当确定一个可选类型有值(不为 nil)时，可以在其名字后加 ！,强制解包
        //对一个变量或常量强制解包后,不能再强制解包.
        if convertedNumber != nil {
            print("\(convertedNumber!)")
        }
        //可选类型值为nil,强制解包会引起 run-time error.因此对可选类型强制解包时必须确保值不会为 nil
        let testNum: Int? = nil
//        print(testNum!)
        
        //5. 可选绑定(Optional Binding)
        //用可选绑定来确定一个可选类型是否有值，有值则赋给常量或变量, 否则为 nil ,常配合if语句,while语句使用
        //可选绑定生成的常量或变量只能在语句体内使用
        //guard 语句生成的常量或变量可以在语句体及之后的代码使用
        
        if let actualNumber = Int(possibleNumber) {
            print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
        }else {
            print("\"\(possibleNumber)\" could not be converted to an integer")
        }
        
        if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }//等价于以下语句
        
        if let firstNum = Int("4") {
            if let secondNum = Int("42") {
                if firstNum < secondNum && secondNum < 100 {
                    print("\(firstNum) < \(secondNum) < 100")
                }
            }
        }
        
        //6. 隐式解包可选类型(Implicitly Unwrapped Optionals)
        //表达形式: 类型名 + !
        //主要用于类的初始化
        //明确知道有值(不为空)的可选类型使用隐式解包，避免每次获取时检查类型和解包
        //一个变量以后有可能为空时，不要用隐式解包可选类型。在生命周期内需要判断是否为nil时，选用常规可选类型！
        //可选类型和隐式解包可选取值的区别,隐式解包可选相当于给了可选类型每次使用时自动解包的许可，而不用每次加 ！
    
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString = assumedString
        //可选类型值为nil,强制解包会引起 run-time error.因此对可选类型强制解包时必须确保值不会为 nil
//        var nilValue: String?; print(nilValue!)
        //隐式可选输出nil, 非可选类型没有赋值直接输出会报错 compile-time error
        var nilValue: Int!; print(nilValue)
        
        //隐式解包可选也是可选类型，可以使用if语句判断是否有值,也可以使用隐式解包可选类型与可选绑定
        if assumedString != nil {
            print(assumedString)
        }
        if let definiteString = assumedString {
            print(definiteString)
        }
       
        
        //三. 错误处理(Error Handling)
        //可选类型可以通过一个值存在还是为 nil，来表达一个函数成功或者失败。和可选类型不同，错误处理可以让你确定错误的根本原因，必要情况下可以把错误传到你代码的另一部分
        //函数声明中添加 throws 关键字，表明函数会报错。调用时函数名前加 try 关键字。
        //Swift会自动把错误传递到范围外的 catch 语句中
        
        func makeASandwich() throws {
            //
        }
        
        /*
         do {
             //没有错误时
             try makeASandwich()
             eatASandwich()
         } catch SandwichError.outOfCleanDishes {
             //没有洗盘子时
             washDishes()
         } catch SandwichError.missingIngredients(let ingredients) {
             //缺少配料时
             buyGroceries(ingredients)
         }
         */
        
        //四. 断言和先决条件(Assertions and Preconditions)
        //断言只能用于(Debug Builds)，先决条件可以用于(Debug Builds)和(Production Builds)
        
        let age = -3
//        assert(age >= 0, "A person's age can't be less than zero.")
        
        if age > 10 {
            print("You can ride the roller-coaster or the ferris wheel.")
        } else if age > 0 {
            print("You can ride the ferris wheel.")
        } else {
            //断点
//            assertionFailure("A person's age can't be less than zero.")
        }
        
        //先决条件，比如用于判断下标是否越界，是否向函数出入了一个合法值
        //如fatalError(_:file:line:)
        //自定义 view 时的使用
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

