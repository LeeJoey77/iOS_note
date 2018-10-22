//
//  ViewController.swift
//  Initialization
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

func globalFunc() -> String {
    return "mother"
}

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        let testView = TestView.init(str: "aafdf", frame: CGRect.init(x: 10, y: 120, width: UIScreen.main.bounds.width - 20, height: 50))
        //        let testView = Bundle.main.loadNibNamed("TestView", owner: nil, options: nil)!.first as! TestView
        //        testView.frame = CGRect.init(x: 10, y: 120, width: UIScreen.main.bounds.width - 20, height: 50)
        self.view.addSubview(testView)
        super.viewDidLoad()
        
        
        
        //和 OC 的 init 方法不同,Swift 的初始化方法没有返回值,Swift 中 init 方法的作用是确保新的实例在使用之前被正确初始化
        
        //1. 为存储属性设置初始值
        //Class 和 struct被创建之前, 它们的存储属性必须被赋值. 存储属性不能处于不确定状态
        //可以在 init 方法中给存储属性赋值, 也可以在定义时赋默认值,推荐使用默认值
        
        //(1) Initializers
        struct Fahrenheit {
            var temperature: Double
            init() {
                temperature = 32.0
            }
        }
        _ = Fahrenheit()
        
        //(2) 默认属性值
        struct Fahrenheit1 {
            var temper = 32.0
        }
        _ = Fahrenheit1(temper: 2)
        _ = Fahrenheit1()
        
        //2. 自定义初始化
        struct Celsius {
            var temperatureInCelsius: Double
            init(fromFahrenheit fahrenheit: Double) {
                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
            }
            init(fromKelvin kelvin: Double) {
                temperatureInCelsius = kelvin - 273.15
            }
        }
        let boilingPointOfWater = Celsius.init(fromKelvin: 212.0)
//      可简写为  let boilingPointOfWater = Celsius(fromKelvin: 212.0)
        let  freezingPointOfWater = Celsius(fromKelvin: 273.15)

        //3. 初始化时给常量赋值
        //初始化时可以给常量赋值,只能在定义的类中, 不能被子类赋值
        class SurveyQuestion {
            let text: String
            var response: String?
            init(text: String) {
                self.text = text
            }
            func ask() {
                print(text)
            }
        }
        let beetsQuestion = SurveyQuestion(text: "How about beets?")
        beetsQuestion.ask()
        beetsQuestion.response = "I also like beets. (But not with cheese.)"
        
        //4. 默认 Initializers
        //使用条件: 所有属性都有默认值, 没有自定义初始化方法的struct, Class
        class ShoppingListItem {
            var name: String? = ""
            var quantity = 1
            var purchased = false
        }
        var item = ShoppingListItem()
        
        //5. struct 的默认成员构造器
        //使用条件: 所有属性都有默认值, 没有自定义初始化方法的struct
        struct Size {
            var width = 0.0, height = 0.0
        }
        let twoByTwo = Size(width: 2.0, height: 2.0)
        
        //6. 值类型的构造器代理
        //构造器调用其它构造器作为实例初始化的一部分, 这一过程叫做构造器代理, 避免代码重复
        //构造器代理的实现规则和形式在 value types 和 Class中有所不同:
        //1. 值类型(struct, enum)不支持继承，只能代理给本身提供的其它构造器
        //2. 类可以继承自其它类，必须保证其继承的所有存储型属性在构造时也能正确的初始化
        
        struct Size1 {
            var width = 0.0, height = 0.0
        }
        struct Point {
            var x = 0.0, y = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size1()
            init() {} //自定义构造器, 相当于默认构造器
            init(origin: Point, size: Size1) {
                self.origin = origin
                self.size = size
            }//自定义构造器, 相当于成员构造器
            init(center: Point, size: Size1) {
                let originX = center.x - (size.width / 2)
                let originY = center.y - (size.height / 2)
                //值类型可以使用 self.init 在自定义的构造器内部, 引用该类型的其它构造器
                self.init(origin: Point(x: originX, y: originY), size: size)
            }
        }
        let basicRect = Rect()
        let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                              size: Size1(width: 5.0, height: 5.0))
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                              size: Size1(width: 3.0, height: 3.0))
        
        //也可以用 Extension 添加自定义初始化方法, 上例用 Extension时, 不用写 init()和init(origin: Point, size: Size1) 方法
        
        //7. Class 的继承和构造
        //Swift 中有两种 Class 的构造器: 指定构造器, 便利构造器
        //指定构造器: 是 Class 中最主要的构造器,一个指定构造器将初始化本类中提供的所有属性，并调用父类的构造器来实现父类存储属性的初始化,每一个类都必须拥有至少一个指定构造器
        //便利构造器: 是 Class 中次要、辅助的构造器, 你可以定义便利构造器来调用本类中的指定构造器，并为其参数提供默认值。
        //指定构造器和便利构造器之间的代理调用规则:
        //1. 指定构造器必须调用其直接父类的的指定构造器
        //2. 便利构造器必须调用同一类中定义的其它构造器
        //3. 便利构造器必须最终以调用一个指定构造器结束
        //简便记忆的方法是：指定构造器必须总是向上代理, 便利构造器必须总是横向代理
        
        //9. 构造器的继承和重载
        //子类不会默认继承父类的构造器,使用父类的构造器需要在子类中重载父类的构造器
        //重载指定构造器，需要调用父类的实现
        //重载便利构造器，必须调用本类中提供的其它指定构造器
        
        //10. 自动继承构造器
        //子类不会默认继承父类的构造器。但是特定条件下父类构造器可以被自动继承:
        //1. 如果子类没有指定构造器，它将自动继承父类所有的指定构造器
        //2. 如果子类提供了所有父类指定构造器的实现,它将自动继承所有父类的便利构造器
        
        //11. 指定构造器和便利构造器语法
        //指定构造器
//        init(parameters) {
//            statements
//        }
        //便利构造器，在init关键字前加 convenience 关键字
//        convenience init(parameters) {
//            statements
//        }
        class Food {
            var name: String
            init(name: String) {
                self.name = name
            }
            convenience init() {
                self.init(name: "[Unnamed]")
            }
        }
        let namedMeat = Food(name: "Bacon")
        let mysteryMeat = Food()
        
        class RecipeIngredient: Food {
            var quantity: Int
            
            init(name: String, quantity: Int) {
                self.quantity = quantity
                super.init(name: name)
            }
            
            override convenience init(name: String) {
                self.init(name: name, quantity: 1)
            }
        }
        let oneMysteryItem = RecipeIngredient()
        let oneBacon = RecipeIngredient(name: "Bacon")
        let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
        
        class ShoppingListItem1: RecipeIngredient {
            var purchased = false
            var description: String {
                var output = "\(quantity) x \(name.lowercased())"
                output += purchased ? " ✔" : " ✘"
                return output
            }
        }
        var breakfastList = [
            ShoppingListItem1(),
            ShoppingListItem1(name: "Bacon"),
            ShoppingListItem1(name: "Eggs", quantity: 6),
            ]
        breakfastList[0].name = "Orange juice"
        breakfastList[0].purchased = true
        for item in breakfastList {
            print(item.description)
        }
        // 1 x orange juice ✔
        // 1 x bacon ✘
        // 6 x eggs ✘
        
        //12. 可失败构造器
        //Class, struct, enum 的构造过程中有可能失败，可以为其定义一个或多个可失败构造器
        
        //可失败构造器语法: 在init 后面加添问号(init?)
        //在构建对象的过程中，创建一个其自身类型为可选类型的对象。通过return nil 语句，来表明可失败构造器在何种情况下“失败”。
        //构造器没有返回值, 它的作用是为了能确保对象自身能被正确构建, return nil 只是表明构造失败, 其它条件下不能使用 return
        struct Animal {
            let species: String
            init?(species: String) {
                if species.isEmpty { return nil }
                self.species = species
            }
        }
        let someCreature = Animal(species: "Giraffe")
        // someCreature 的类型是 Animal? 而不是 Animal
        if let giraffe = someCreature {
            print("An animal was initialized with a species of \(giraffe.species)")
        }
        // 打印 "An animal was initialized with a species of Giraffe"
        
        let anonymousCreature = Animal(species: "")
        // anonymousCreature 的类型是 Animal?, 而不是 Animal
        if anonymousCreature == nil {
            print("The anonymous creature could not be initialized")
        }
        // 打印 "The anonymous creature could not be initializ
        
        //13. 枚举类型的可失败构造器
        //可以通过构造可失败构造器来获取枚举类型中特定的枚举成员。还能在参数不满足你所期望的条件时，导致构造失败。
        enum TemperatureUnit {
            case Kelvin, Celsius, Fahrenheit
            init?(symbol: Character) {
                switch symbol {
                case "K":
                    self = .Kelvin
                case "C":
                    self = .Celsius
                case "F":
                    self = .Fahrenheit
                default:
                    return nil
                }
            }
        }
        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // 打印 "This is a defined temperature unit, so initialization succeeded."
        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        // 打印 "This is not a defined temperature unit, so initialization failed."
        
        //14.带原始值的枚举类型的可失败构造器
        //带原始值的枚举类型自带一个可失败构造器init?(rawValue:),参数 rawValue 类型和原始值类型一致，如果匹配则构造成功，否则构造失败
        enum TemperatureUnit1: Character {
            case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
        }
        let fahrenheitUnit1 = TemperatureUnit1(rawValue: "F")
        if fahrenheitUnit1 != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // prints "This is a defined temperature unit, so initialization succeeded."
        let unknownUnit1 = TemperatureUnit1(rawValue: "X")
        if unknownUnit1 == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        // prints "This is not a defined temperature unit, so initialization failed."
        
        //15. 构造失败的传递
        //Class, struct, enum 中的可失败构造器可以横向代理给本类的其它可失败构造器
        //子类的可失败构造器也能向上代理父类的可失败构造器
        //这两种情况中, 如果代理给另一个构造器构造失败, 整个构造过程失败
        
        //注意：可失败构造器也可以代理给非可失败构造器, 通过这个方法，你可以为已有的构造过程加入构造失败的条件
        class Product {
            let name: String
            init?(name: String) {
                if name.isEmpty { return nil }
                self.name = name
            }
        }
        
        class CartItem: Product {
            let quantity: Int
            init?(name: String, quantity: Int) {
                if quantity < 1 { return nil }
                self.quantity = quantity
                super.init(name: name)
            }
        }
        if let twoSocks = CartItem(name: "sock", quantity: 2) {
            print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
        }
        // Prints "Item: sock, quantity: 2"
        
        if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
            print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
        } else {
            print("Unable to initialize zero shirts")
        }
        // Prints "Unable to initialize zero shirts"
        
        if let oneUnnamed = CartItem(name: "", quantity: 1) {
            print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
        } else {
            print("Unable to initialize one unnamed product")
        }
        // Prints "Unable to initialize one unnamed product"

        
        //16. 重写一个可失败构造器
        //子类重写父类的可失败构造器, 可以使用可失败构造器或者非可失败构造器, 使用非可失败构造器时重写时要对父类的可失败构造器解包

        class Document {
            var name: String?
            //name 为 nil
            init() {}
            init?(name: String) {
                if name.isEmpty { return nil }
                self.name = name
            }
        }
        class AutomaticallyNamedDocument: Document {
            override init() {
                super.init()
                self.name = "[Untitled]"
            }
            override init(name: String) {
                //用父类的非可失败构造器,重写父类的可失败构造器
                super.init()
                if name.isEmpty {
                    self.name = "[Untitled]"
                } else {
                    self.name = name
                }
            }
        }
        
        class UntitledDocument: Document {
            override init() {
                //用父类的可失败构造器, 重写父类的可失败构造器
                super.init(name: "[Untitled]")!
            }
        }
        
        //18. 可失败构造器 init!
        //可以用 init? 创建可失败构造器,也可以用 init! 隐式解包创建
        //可以在 init？构造器中调用 init！构造器, 反之亦然
        //可以用 init？覆盖 init!, 反之亦然
        //可以用 init代理调用init!, 可能触发错误
        
        //19. 必要构造器
        //在类的构造器前添加 required 表明所有该类的子类都必须实现该构造器：
        class SomeClass {
            required init() {

            }
        }
        //子类重写父类的必要构造器时，必须写 required
        //重写必要构造器时, 不需要写 override
        
        class SomeSubclass: SomeClass {
            required init() {

            }
        }
        //注意: 如果子类继承的构造器能满足必要构造器的要求, 则不必重写
        
        //20. 用闭包和函数给属性设置默认值
        ///
        class SomeClass1 {
            let otherProperty: Double = 0.0
            let someProperty: Int = {
                // 在这个闭包中给 someProperty 创建一个默认值
                // 返回值必须和 someProperty 类型相同
                return 2
            }()
            
            let anotherProperty: String = globalFunc()
            
            func instanceMethod() {
                
            }
        }
        //闭包结尾大括号后面的 (), 表明立刻执行此闭包。如果没有 () 相当于是将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。
        //使用闭包给属性赋值，在闭包执行时，实例的其它属性还没有初始化, 因此不能在闭包里访问其它属性, 即使这个属性有默认值, 同样，也不能使用隐式的 self 属性, 或者调用其它的实例方法。
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

