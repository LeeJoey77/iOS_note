//
//  ViewController.swift
//  Function
//
//  Created by Leelulu on 2018/2/9.
//  Copyright © 2018年 Leelulu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //函数(Function)
        //函数表达形式:
        //func functionName(argumentLabel parameterName: type) -> return type {
        //        函数体
        //}
        //argumentLabel 在函数调用时使用, 没有则默认 parameterName 为 argumentLabel
        
        //1. 函数类型
        //(1) 无参函数
        func sayHelloWorld() -> String {
            return "hello, world"
        }
        print(sayHelloWorld())
        
        //(2) 有参函数
        func greet(person: String) -> String {
            return "hello, " + person + "!"
        }
        func greetAgain(person: String) -> String {
            return "hello again, " + person + "!"
        }
        func greet(person: String, alreadyGreeted: Bool) -> String {
            if alreadyGreeted {
                return greetAgain(person: person)
            } else {
                return greet(person: person)
            }
        }
        print(greet(person: "Anna", alreadyGreeted: true))
        
        //(3) 无返回值函数
        func greetPer(person: String) {
            print("hello, \(person)!")
        }
        greetPer(person: "Dave")
        
        //2. 可以用下划线接收返回值,忽略返回值
        func ignoreReturnValue() {
            let _ = greet(person: "Tom")
        }
        
        //3. 元组返回类型
        func minMax(array: [Int]) -> (min: Int, max: Int) {
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        
        //(1) 获取元素有名字的元组时,返回值可以用点语法直接使用
        let bounds = minMax(array: [-2, 5, 19, 10])
        print("min is \(bounds.min), max is \(bounds.max)")
        
        //(2) 可选元组返回类型
        //如果元组作为返回值时,整个元组可能为 nil时,使用可选元组作为返回值类型
        //可选元组和包含可选类型元素的元组:
        //可选元组如: (Int, Int)?     包含可选类型元素的元组: (Int?, Int?)
        //Swift 不会对数组进行安全检查,上述例子中元组元素为两个 Int值, 如果传入的参数数组为空,取值时会报错,为了保证安全,使用可选类型的元组
        func minMax1(arr: [Int]) -> (min: Int, max: Int)? {
            if arr.isEmpty { return nil }
            var currentMin = arr[0]
            var currentMax = arr[0]
            for value in arr[1..<arr.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        //可以使用可选绑定来检查元组值是否为 nil
        if let bounds = minMax1(arr: [8, -5, 17, 105, 3, 71]) {
            print("min is \(bounds.min) and max is \(bounds.max)")
        }
        
        //4. 函数参数(function parameter)
        //每个 function parameter 都由一个 argument label 和一个 parameter name 组成.
        //argument label 用于函数调用, parameter name 用于函数实现.argument label不存在时, 默认 parameter name 作为  argument label
        
        //(1)设置 argument label
        //添加在 parameter name 前,用空格隔开
        func someFunction(argumentLabel parameterName: Int) {
            //在函数体中, parameterName 指向参数的值,在调用时只写 argumentLabel
        }
        
        //类比 OC, (NSString *)greet1Person:(NSStrin *)person from:(NSString *)hometown;
        func greet1(person: String, from hometown: String) -> String {
            return "Hello \(person)! Glad you could visit from \(hometown)."
        }
        print(greet1(person: "Bill", from: "Cupertino"))
        
        //(2)忽略 argument label
        //在 parameter name 前加 underscore(_)
        func anotherFunction(_ firstParameterName: String, seconParameterName: String) {
            
        }
        anotherFunction("first", seconParameterName: "second")
        
        //(3)参数默认值
        //可以给参数设置默认值,在参数类型后直接赋值, 如果一个参数有默认值,调用时可以忽略这个参数
        //没有默认参数值的通常写在前边
        func someFunction1(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
            
        }
        someFunction1(parameterWithoutDefault: 4, parameterWithDefault: 5)
        someFunction1(parameterWithoutDefault: 3)
        
        //(4)可变数量的参数(variadic parameter)
        //可变数量的参数可以是零个或多个特定类型的值, 当调用函数时传入的参数数量可变就使用 variadic parameter.
        //可变数量的参数,在函数内部以不可变数组的形式访问
        //一个函数最多只能有一个可变数量的参数
        //形式: 在参数类型名后加(...)
        func arithmeticMean(_ numbers: Double...) -> Double {
            var total: Double = 0
            //可变数量的参数,在函数内部以不可变数组的形式访问
            for number in numbers {
                total += number
            }
            return total / Double(numbers.count)
        }
        arithmeticMean(1, 2, 3, 4, 5)
        arithmeticMean(3, 8.5, 18.7)
        
        //(5) inout 参数
        //函数参数默认是常量,在函数体内部不能改变,强行改变会引起 compile-time error
        //如果想修改一个函数参数的值,并且让这个值在函数调用后依然有效,使用 inout 参数
        // inout 的参数只能是变量, 常量和字符串不能修改因此不能作为 inout 参数.
        //inout 参数不能有默认值, 可变数量的参数不能作为 inout 参数
        //声明时:
        //在参数类型之前加 intout
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        var someInt = 3
        var anotherInt = 107
        //调用时:
        //在变量名前加ampersand(&)表明它可以被函数修改
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // Prints "someInt is now 107, and anotherInt is now 3"
        //inout 参数和 return 不同. inout 参数可以影响函数体外的变量
        
        //5. 函数类型(function type)
        //(1)函数类型可以像其它数据类型一样被使用
        //以下两个函数有相同的类型, (Int, Int) -> Int
        func addTwoInts(_ a: Int, _ b: Int) -> Int {
            return a + b
        }
        func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
            return a * b
        }
        
        //声明一个(Int, Int) -> Int 函数类型变量
        var mathFunction: (Int, Int) -> Int = addTwoInts
        print("Result: \(mathFunction(2, 3))")  //"Result: 5"
        mathFunction = multiplyTwoInts
        print("Result: \(mathFunction(2, 3))")  //"Result: 6"
        
        //也可以不声明类型,使用类型推断
        let anotherMathFunction = addTwoInts
        
        //(2)函数类型作为参数类型
        func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
            print("Result: \(mathFunction(a, b))")
        }
        printMathResult(addTwoInts, 3, 5)
        
        //(3)函数类型作为返回值类型
        func stepForward(_ input: Int) -> Int {
            return input + 1
        }
        func stepBackward(_ input: Int) -> Int {
            return input - 1
        }
        
        func chooseStepFunction(backward: Bool) -> (Int) -> Int {
            return backward ? stepBackward : stepForward
        }
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        print(moveNearerToZero(currentValue)) //2
        
        //6. 嵌套函数(Nested Functions)
        //之前的函数都是全局函数 Global functions
        //可以将chooseStepFunction(backward:)重写为嵌套形式
        func chooseStepFunc(backward: Bool) -> (Int) -> Int {
            func stepForward1(input: Int) -> Int { return input + 1 }
            func stepBackward1(input: Int) -> Int { return input - 1 }
            return backward ? stepBackward1 : stepForward1
        }
        var currentValue1 = -4
        //返回值为函数
        let moveToZero = chooseStepFunc(backward: currentValue1 > 0)
        while currentValue1 != 0 {
            print("\(currentValue1)..")
            currentValue1 = moveToZero(currentValue1)
        }
        print("zero!")
        // -4...
        // -3...
        // -2...
        // -1...
        // zero!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

