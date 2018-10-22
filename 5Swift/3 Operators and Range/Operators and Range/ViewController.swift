//
//  ViewController.swift
//  Operators and Range
//
//  Created by admin on 2018/1/26.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //一. 基本运算符(Basic Operators)
        //数字运算符，逻辑运算符等大多数标准的C语言运算符，数字运算符可以检测运算结果避免溢出(超出存储类型允许的值的范围)
        
        //1. 一元运算符(Unary operators)
        //赋值运算符(Assignment Operator): =
        let b = 7; var a = 10; a = b
        var (x, y) = (1, 2)
        /*
         和C ，OC 的赋值运算符不同，Swift中的赋值运算符不会返回一个值
         if x = y {
         //不合法的语句
         }
         */
        
        //2. 二元运算符(Binary operators)
        //和C ，OC 的数字运算符不同，Swift中的数字运算符不允许值溢出，可以使用Swift的溢出运算符来操作
        //(1) + 运算符, + 支持字符串拼接
        print("hello, " + "world") //输出：hello, world
        // + ， - 用于一元运算符时表示正负
        let minusSix = -6; let alsoMinusSix = +minusSix
        
        //(2) 求余运算符(Remainder Operator): %
        // -9 % 4 = -1       9 % -4 = -1
        
        
        //(3) 复合赋值运算符(Compound Assignment Operators)
        var aNum = 1; a += 2   //a = a + 2
        //复合运算符没有返回值，不能用来赋值
        // let b = a += 2  (不合法）
        
        //(4) 比较运算符: ==，>，<，！=，>=，<=, 比较运算符不能用于波尔值比较
        
        //3. 验证运算符(identity operators)
        //Swift 提供了两个验证运算符identity operators  (=== 和 !==)，用来检验两个对象的指针是否指向同一个实例变量
        
        //4. 元组的比较
        //两个元组包含元素的个数和对应元素的类型相同才能比较，从左到右逐个比较，比较出第一个后其余的忽略
        //元组比较只能用于比较小于七个元素的元组
        (1, "zebra") < (2, "apple")   //true， 1 < 2为真， zebra和apple没有比较
        (3, "apple") < (3, "bird")    //true， 3 = 3， apple 第一个字母小于 bird 第一个字母
        (4, "dog") == (4, "dog")      //true
        
        
        //5. 三元运算符(Ternary operators)
        //和C语言一样，Swift只有一个三元条件运算符 (a ? b : c)
        
        //计算tableView 行高，如果有header， 行高比内容高度高50， 没有高20
        let contentHeight = 40
        let hasHeader = true
        let rowHeight = contentHeight + (hasHeader ? 50 : 20)
        
        //6. 空合运算符(Nil-Coalescing Operator)
        // a ?? b ， a为可选类型
        //如果a不为nil解包a的值返回，否则返回b。如果a非空，不会再评估b的值(短路评估short-circuit evaluation)
        //相当于 a != nil ? a! : b
        
        let defaultColorName = "red"
        var userDefinedColorName: String?   //userDefinedColorName 为nil
        var colorNameToUse = userDefinedColorName ?? defaultColorName // colorNameToUse值为red
        
        
        //二. 区间运算符(Range Operators)
        let arr: Array<String> = []
        let rang: Range<String>
    
        //1. 闭区间运算符(Closed Range Operator)
        //表达形式: a...b, 包含a, b， a 不能大于 b, 适用于for in循环
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        // 1 times 5 is 5
        // 2 times 5 is 10
        // 3 times 5 is 15
        // 4 times 5 is 20
        // 5 times 5 is 25
    
        //2. 半开区间运算符(Half-Open Range Operator)
        //表达形式: a..<b, 包含a， 不包含b， a不能大于b。适用于数组遍历
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for i in 0..<count {
            print("Person\(i + 1) is called \(names[i])")
        }
        // Person 1 is called Anna
        // Person 2 is called Alex
        // Person 3 is called Brian
        // Person 4 is called Jack
        
        //3. 单边区间(One-Sided Ranges)
        //封闭范围运算符的特殊形式，从一边开始直到结束,包括开始值
        for name in names[2...] {
            print(name)
        }
        // Brian
        // Jack
        
        for name in names[...2] {
            print(name)
        }
        // Anna
        // Alex
        // Brian
        
        for name in names[..<2] {
            print(name)
        }
        // Anna
        // Alex
        
        let range = ...5
        //range 类型为PartialRangeThrough<Int>
        range.contains(7) //false
        range.contains(4) //true
        range.contains(-1) //true
        
        //三. 逻辑运算符(Logical Operators)
        //与或非: ！， &&，||
        // a && b, a 为false，不再判断b ， 短路评估short-circuit evaluation
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

