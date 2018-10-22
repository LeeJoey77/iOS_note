//
//  ViewController.swift
//  Automatic Reference Counting
//
//  Created by admin on 2018/4/16.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. 类实例之间的 Strong Reference Cycles
        class Person {
            let name: String
            init(name: String) { self.name = name }
            var apartment: Apartment?
            deinit { print("\(name) is being deinitialized") }
        }
        class Apartment {
            let unit: String
            init(unit: String) { self.unit = unit }
            var tenant: Person?
            deinit { print("Apartment \(unit) is being deinitialized") }
        }
        
        var john: Person?
        var unit4A: Apartment?
        john = Person.init(name: "John Appleseed")
        unit4A = Apartment.init(unit: "4A")
        
        //john ---> Person 实例, john?.apartment ---> nil
        //unit4A ---> Apartment 实例, unit4A?.tenant ---> nil
        //没有形成循环引用
        
        john?.apartment = unit4A
        unit4A?.tenant = john
        //john?.apartment ---> unit4A
        //unit4A?.tenant ---> john
        //两者形成循环引用
        
        john = nil
        unit4A = nil
        //john ---> nil, john?.apartment ---> unit4A
        //unit4A ---> nil, unit4A?.tenant ---> john
        //循环引用依然存在
        
        //2. 解决循环引用 weak, unowned
        //另一个实例先被释放时, 用 weak; 另一个实例有相同或更长的生命周期用 unowned
        //ARC 自动将 weak reference 置为 nil, 当实例释放时. 因此 weak reference 必须为可选类型的变量
        //unowned reference 必须有值, 因此 ARC 不能将  unowned reference 置为 nil, 所以必须为非可选类型(常量或变量)
        //ARC 将 weak reference 置为 nil时, 属性观察者不会触发
        
        //weak
        class Person1 {
            let name: String
            init(name: String) { self.name = name }
            var apartment: Apartment?
            deinit { print("\(name) is being deinitialized") }
        }
        
        class Apartment1 {
            let unit: String
            init(unit: String) { self.unit = unit }
            weak var tenant: Person?
            deinit { print("Apartment \(unit) is being deinitialized") }
        }
        var john1: Person?
        var unit4A1: Apartment?
        
        john1 = Person(name: "John Appleseed")
        unit4A1 = Apartment(unit: "4A")
        
        john1!.apartment = unit4A1
        unit4A1!.tenant = john1
        
        //一个 Person1 不一定有 Apartment1, 一个 Apartment1 也不一定有 Person1.
        //john1?.apartment ---> unit4A1
        //unit4A1?.tenant  (weak)---> john1.
        //没有形成循环引用
        
        john1 = nil
        // Prints "John Appleseed is being deinitialized"
        
        //john ---> ni, Person1 实例被释放
        //unit4A1!.tenant ---> nil
        
        //unowned
        //使用 unowned, 只有当你确定在实例没有被释放时 reference 会一直指向它
        
        class Customer {
            let name: String
            var card: CreditCard?
            init(name: String) {
                self.name = name
            }
            deinit { print("\(name) is being deinitialized") }
        }
    
        class CreditCard {
            let number: UInt64
            unowned let customer: Customer
            init(number: UInt64, customer: Customer) {
                self.number = number
                self.customer = customer
            }
            deinit { print("Card #\(number) is being deinitialized") }
        }
        //Customer 不一定有 CreditCard, CreditCard 一定和 Customer 相关.
        
        var tom: Customer?
        tom = Customer.init(name: "Tom Johnson")
        tom?.card = CreditCard.init(number: 1234_5678_9012_3456, customer: tom!)
        //tom ---> Customer 实例
        //tom?.card ---> CreditCard 实例
        //CreditCard.customer (unowned)---> tom
        
        tom = nil
        //tom ---> nil
        //Customer 实例被释放
        //CreditCard 实例被释放
        
        // Prints "John Appleseed is being deinitialized"
        // Prints "Card #1234567890123456 is being deinitialized"
        
        //3. Unowned References 和隐式解包
        //两个实例都可以为 nil, 用 weak
        //一个可以为 nil, 一个不能为 nil, 用 unowned
        //两个都不能为 nil, 一个用 unowned, 一个用隐式解包
        
        class Country {
            let name: String
            var capitalCity: City!
            init(name: String, capitalName: String) {
                self.name = name
                self.capitalCity = City(name: capitalName, country: self)
            }
        }
        class City {
            let name: String
            unowned let country: Country
            init(name: String, country: Country) {
                self.name = name
                self.country = country
            }
        }
        //每个国家都有首都, 每个城市都属于一个国家
        //Country 实例没有完成初始化之前不能使用 self, 为了解决这一需求,将 capitalCity 类型写为 City!. 写为隐式解包意味着capitalCity 有个默认值 nil
        //创建Country 实例时, 在 init 方法给 name 赋值完成时, 实例即完成初始化可以使用 self
        
        var country = Country(name: "Canada", capitalName: "Ottawa")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
        
        //4. 闭包的Strong Reference Cycles
        //当把一个闭包传给一个实例的属性, 闭包又捕获了这个实例的时候,也会出现循环引用
       
        class HTMLElement {
            let name: String
            let text: String?
            lazy var asHTML: () -> String = {
                if let text = self.text {
                    return "<\(self.name)>\(text)</\(self.name)>"
                } else {
                    return "<\(self.name) />"
                }
            }
            
            init(name: String, text: String? = nil) {
                self.name = name
                self.text = text
            }
            
            deinit {
                print("\(name) is being deinitialized")
            }
        }
        let heading = HTMLElement(name: "h1")
        let defaultText = "some default text"
        heading.asHTML = {
            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
        }
        print(heading.asHTML())
        // Prints "<h1>some default text</h1>"
        
        //Swift 使用closure capture list 来解决循环引用
//        lazy var someClosure: (Int, String) -> String = {
//            [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
//            // closure body goes here
//        }
        //参数, 返回值类型可以推断的省略
//        lazy var someClosure: () -> String = {
//            [unowned self, weak delegate = self.delegate!] in
//            // closure body goes here
//        }
        
        //5. 闭包的 weak 和 unowned
        //捕获值和闭包总是同时释放时用 unowned
        //捕获值可能比闭包先释放时用 weak, 捕获的 reference 被设置为 nil
        //如果捕获的 reference不会为 nil, 用 unowned
        
        class HTMLElement1 {
            
            let name: String
            let text: String?
            
            lazy var asHTML: () -> String = {
                [unowned self] in
                if let text = self.text {
                    return "<\(self.name)>\(text)</\(self.name)>"
                } else {
                    return "<\(self.name) />"
                }
            }
            
            init(name: String, text: String? = nil) {
                self.name = name
                self.text = text
            }
            
            deinit {
                print("\(name) is being deinitialized")
            }
            
        }
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        // Prints "<p>hello, world</p>"
        paragraph = nil
        // Prints "p is being deinitialized"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

