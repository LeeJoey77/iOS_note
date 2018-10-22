//
//  ViewController.swift
//  Closures
//
//  Created by admin on 2018/2/23.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //闭包closures 类似于 OC的 block, 闭包可以捕获(capture)并且存储代码块中指向常量或变量的指针
        //Global and nested functions 都是闭包的特例, 闭包有三种形式:
        //(1)Global functions 是有名字但是没有 capture 任何值的闭包
        //(2)Nested functions 是有名字并且 capture 封闭函数中值的闭包
        //(3)闭包语句是没有名字的,轻量级的语法(syntax), 可以 capture 周围 context中的常量和变量指针
        
        //一. 闭包的基本形式
        /**
            闭包的表达形式
            { (parameters) -> return type in
                statements
            }
            内联闭包(inline closure)
            闭包语句体由关键字 in 引出, in 表明参数和返回值定义完成, 闭包语句体开始
            可以为 inout 参数, 但是不能有默认值.可变数量参数也可以使用.元组可以作为参数和返回值
         */
        
        //用闭包实现 sorted(by: (String, String) throws -> Bool) 方法,参数 by 是一个闭包
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        var reversedNames: [String] = []
        //调用sorted(by: (String, String) throws -> Bool),参数 by 是一个闭包
        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        
        //闭包优化(optimizations)
        //(1)从 context 中推断参数和返回值类型
        //上述 sorted 例子中,因为 sorted(by:) 方法是由字符串数组调用,所以它的参数一定是 (String, String) -> Bool 函数类型的, 因此可以忽略不写简写为以下形式
        reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
        //inline closure 作为函数或者方法的参数时, 总是可以推断参数和返回值类型, 因此这种情况下都可以简写
        
        //(2) Single-Expression Closures, 单语句闭包的隐式返回
        //必须是单语句闭包, 且返回值类型明确
        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
        
        //(3) 简写参数名
        //对于 inline closures, Swift 提供简写参数名, $1, $2, ....
        //如果在闭包语句中使用简写参数名,可以忽略闭包的参数列表.参数类型和数量会从函数类型推断, 关键字 in 也可以省略
        reversedNames = names.sorted(by: { $0 > $1 })
        
        //(4) 运算符方法
        //Swift 的 String 类型定义了 string 特定的 > 方法的实现, 比较两个 String, 返回 Bool 值.类似这种特定的运算符方法可以直接使用
        reversedNames = names.sorted(by: >)
        
        
        //二. 尾随闭包(trailing closure)
        //如果用闭包作为函数参数,并且闭包语句较长,可以使用 trailing closure.
        //调用时,写在函数括号外,不用写 argument label
        
        //函数声明
        func someFunctionThatTakesAClosure(closure: () -> Void) {
            //函数实现
        }
        
        //函数调用: 使用 trailing closures
        someFunctionThatTakesAClosure() {
            //闭包实现
        }
        
        //函数调用: 不使用 trailing closures
        someFunctionThatTakesAClosure(closure: {
            //闭包实现
        })
        
        //例1.
        //上述 sorted(by:) 方法用 trailing closures 可以写为
        reversedNames = names.sorted() { $0 > $1 }
        //如果闭包语句是唯一的参数, 那么调用时函数后的括号()可以省略
        reversedNames = names.sorted { $0 > $1 }
        
        //例2.
        //以下例子将数组中的数字变为英文形式
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        //参数 number 的类型不必说明,因为类型会根据映射(map)的数组中的值推断
        //指定返回值类型为 String, 来表明输出数组中存储的数据类型
        let strings = numbers.map() { (number) -> String in
            //用参数给变量赋值,因为函数和闭包中的参数都是常量
            var number = number
            var output = ""
            repeat {
                //使用 !, 因为字典下标访问返回的是可选类型, 此处可以确定不为空所以强制解包
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        // strings 被推断为 [String] 类型
        //输出 ["OneSix", "FiveEight", "FiveOneZero"]
        
        
        //三. 闭包特性
        //1. 捕获值 Capturing Values
        //闭包可以 capture 周围 context 的常量和变量的指针, 访问并修改这个值
        //capture 的是 value 的指针, 因此在函数调用后不会消失, 下次调用时还可以使用
        //Swift 中闭包 capture 值的最简单例子是 nested function.一个 nested function 可以 capture 外部函数的参数,以及外部函数中定义的常量和变量
        
        //函数
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        
        //调用
        //capture 的是 value 的指针, 因此在函数调用后不会消失, 下次调用时还可以使用
        let incrementByTen = makeIncrementer(forIncrement: 10)
        incrementByTen()
        // returns a value of 10
        incrementByTen()
        // returns a value of 20
        incrementByTen()
        // returns a value of 30
        
        //再定义一个incrementBySeven, 它将会有自己新的独立的指针指向 runningTotal
        let incrementBySeven = makeIncrementer(forIncrement: 7)
        incrementBySeven()
        // returns a value of 7
        
        //incrementByTen 捕获的变量是独立的,不受影响
        incrementByTen()
        // returns a value of 40
        
        //如果把一个类的一个属性值赋给闭包, 闭包又 capture 这个实例变量,会造成闭包和实例变量的strong reference cycle. Swift 使用 capture lists 来打破循环引用
        
        //2. 闭包是指针类型
        //上述例子中, incrementBySeven 和 incrementByTen是常量,但是这些闭包仍然可以改变它所捕获的runningTotal的值,这是因为 functions 和 closures 是指针类型
        //incrementByTen 是常量,并非闭包本身是常量
        let alsoIncrementByTen = incrementByTen
        alsoIncrementByTen()
        // returns a value of 50

        //3. Escaping Closures
        //闭包作为参数, 但是在函数执行结束后调用.(不在主线程中立即执行的)
        class SomeClass {
            var x = 10
            //在参数类型前加 @escaping 表明这个闭包允许 escape
            //Escaping Closures 的一种实现方式是存储在一个函数外部定义的变量中, 使用外部变量存储时必须加 @escaping, 否则会编译报错
            var completionHandlersArray: [() -> Void] = []
            //escape 的闭包
            func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
                completionHandlersArray.append(completionHandler)
            }
            
            //没有 escape 的闭包
            func someFunctionWithNonescapingClosure(closure: () -> Void) {
                closure()
            }
            //没有逃逸的闭包, 没有逃逸的闭包不能写 argumentLabel
            func nonEscapingClosure(closure: (_ param1: Int) -> Int) -> Void {
                closure(1)
            }
            
            func doSomething() {
                //将一个闭包声明为 @escaping, 意味着在闭包内部必须明确的指向 self
                //没有声明为 @escaping, 意味着可以隐性的指向 self
                someFunctionWithEscapingClosure { self.x = 100 }
                someFunctionWithNonescapingClosure { x = 200 }
            }
        }
        
        //调用函数
        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        // Prints "200"
        //没有逃逸的闭包
        instance.nonEscapingClosure { (param1) -> Int in
            return param1 + 1
        }
        
        //调用completionHandler
        instance.completionHandlersArray.first?()
        print(instance.x)
        // Prints "100"
    
        //4. 自动闭包
        //自动闭包能动态的封装一个表达式为一个函数的参数，自动闭包不能带任何的参数,返回值是内部语句的返回值
        //通常会调用有自动闭包的函数,而不是实现它,不能过度使用
        //自动闭包让你可以delay evaluation, 因为闭包内部的代码在调用时才执行.
        //delay evaluation通常用于有副作用(如耗时)或者需要大量计算的代码
        
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // Prints "5"
        
        //customerProvider 是 () -> String 类型的
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        // Prints "5"
        
        //闭包调用时,才执行 remove 操作
        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        print(customersInLine.count)
        // Prints "4"
        
        //(1) @autoclosure
        //显式闭包(explicit closure)
        func serve(customer customerProvider: () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve(customer: { customersInLine.remove(at: 0) } )
        
        //在以上显式闭包类型前加 @autoclosure
        func serve1(customer customerProvider: @autoclosure () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve1(customer: customersInLine.remove(at: 0)) //不用写大括号 {}
        
        //(2) @autoclosure 和 @escaping 同时使用
        //在闭包类型前加 @autoclosure @escaping
        var customerProviders: [() -> String] = []
        //因为将customerProvider 添加到了外部的数组中,所以要将 @escaping
        func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
            customerProviders.append(customerProvider)
        }
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))
        
        print("Collected \(customerProviders.count) closures.")
        //"Collected 2 closures."
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())!")
        }
        //"Now serving Barry!"
        //"Now serving Daniella!"
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

