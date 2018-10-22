//
//  ViewController.swift
//  Enumerations
//
//  Created by admin on 2018/2/26.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //1. 枚举语法
        enum SomeEnumeration {
            // enumeration definition goes here
        }
        
        //eg1.
        enum CompassPoint {
            case North
            case South
            case East
            case West
        }
        //注意：
        //不像 C 和 Objective-C 一样，Swift 的枚举成员在被创建时不会被赋予一个默认的整数值。在上面的CompassPoints例子中，North，South，East和West不是隐式的等于0，1，2和3。相反的，这些不同的枚举成员在CompassPoint的一种显示定义中拥有各自不同的值。
        
        //多个成员值可以出现在同一行上，用逗号隔开：
        enum Planet {
            case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
        }
        //每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如CompassPoint和Planet）必须以一个大写字母开头。给枚举类型起一个单数名字而不是复数名字，以便于读起来更加容易理解：
        var directionToHead = CompassPoint.West //directionToHead 是CompassPoint枚举类型
        
        //当directionToHead类型被推断为CompassPoint, 类型已知时, 可以用点语法为其赋值
        directionToHead = .East
        
        //2. 用Switch匹配枚举
        directionToHead = .South
        switch directionToHead {
        case .North:
            print("Lots of planets have a north")
        case .South:
            print("Watch out for penguins")
        case .East:
            print("Where the sun rises")
        case .West:
            print("Where the skies are blue")
        }
        // 输出 "Watch out for penguins”
        
        //匹配枚举值时, Switch 语句必须保证匹配到每一个 case 语句, 不能确保全部匹配用 default
        
        let somePlanet = Planet.Earth
        switch somePlanet {
        case .Earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
        //输出"Mostly harmless"
        
        //3. 相关值(Associated Values)
        enum Barcode {
            case UPCA(Int, Int, Int)
            case QRcode(String)
        }
        //以上代码可以这么理解：
        //“定义一个名为Barcode的枚举类型，它可以是一个（Int，Int，Int）元组类型相关值，或者一个字符串类型（String）相关值。”
        var productBarcode = Barcode.UPCA(8, 85909_51226, 3)
        print(productBarcode)
        //UPCA(8, 8590951226, 3)
        productBarcode = Barcode.QRcode("adfadfdadfad")
        print(productBarcode)
        //QRcode("adfadfdadfad")
        
        //switch 匹配有相关值的 case 语句, 可以将每个相关值提取出来作为一个常量或变量
        switch productBarcode {
        case .UPCA(let numberSystem, let identifier, let check):
            print("UPC-A with value of \(numberSystem), \(identifier), \(check)")
        case .QRcode(let productCode):
            print("QR code with value of \(productCode)")
        }
        // 输出 "QR code with value of ABCDEFGHIJKLMNOP.”

        //如果一个枚举成员的所有相关值被提取为常量，或者它们全部被提取为变量，为了简洁，你可以只放置一个var或者let标注在成员名称前：
        switch productBarcode {
        case let .UPCA(numberSystem, identifier, check):
            print("UPC-A with value of \(numberSystem), \(identifier), \(check)")
        case let .QRcode( productCode):
            print("QR code with value of \(productCode)")
        }
        //不需要使用相关值可以省略, 或者 (_)
        switch productBarcode {
        case .UPCA(_):
            print("UPC-A with value of")
        case .QRcode:
            print("QR code with value")
        }
        
        //4. 原始值（Raw Values）
        //作为相关值的替代，枚举成员可以被默认值（称为原始值）预先填充，其中这些原始值具有相同的类型。
        enum ASCLLControlCharacter: Character {
            case Tab = "\t"
            case LineFeed = "\n"
            case CarriageReturn = "\r"
        }
    
        //原始值在定义枚举时赋值, 成员原始值类型相同, 且不可改变. 相关值是在创建一个基于枚举成员的新常量或变量时才会被设置，并且每次创建时，它的值可以不同。
        //原始值可以是字符串，字符，或者任何整型值或浮点型值。
        //枚举中的成员和值都必须唯一
        //当整型值被用于原始值，如果其他枚举成员没有值时，它们会自动递增。
        
        enum PlanetOrder: Int {
            case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
        }
        let earthsOrder = PlanetOrder.Earth.rawValue
        print(earthsOrder)
        //输出: 3
        
        //用rawValue 构造函数创建特定原始值的枚举
        let possiblePlanet = PlanetOrder(rawValue: 7)
        print("The planet is \(possiblePlanet!)")
        //possiblePlanet 是 Planet? 类型
        
        let positionToFind = 9
        if let somePlanet = PlanetOrder(rawValue: positionToFind) {
            switch somePlanet {
            case .Earth:
                print("Mostly harmless")
            default:
                print("Not a safe place for humans")
            }
        }else {
            print("There isn't a planet at position \(positionToFind)")
        }
        
        //5. 递归枚举(Recursive Enumerations)
        //递归枚举是将自身作为一个或多个case 相关值的枚举.
        //可以在对应 case 语句前加关键字 indirect, 来表明这是一个递归枚举
        enum ArithmeticExpression {
            case number(Int)
            indirect case addition(ArithmeticExpression, ArithmeticExpression)
            indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
        }
        //也可以直接在枚举定义前加关键字 indirect
        indirect enum ArithmeticExpression1 {
            case number(Int)
            case addition(ArithmeticExpression1, ArithmeticExpression1)
            case multiplication(ArithmeticExpression1, ArithmeticExpression1)
        }
        
        //(5 + 4) * 2
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        //用递归函数来处理递归结构的数据
        func evaluate(_ expression: ArithmeticExpression) -> Int {
            switch expression {
            case let .number(value):
                return value
            case let .addition(left, right):
                return evaluate(left) + evaluate(right)
            case let .multiplication(left, right):
                return evaluate(left) * evaluate(right)
            }
        }
        print(evaluate(product))
        // Prints "18"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

