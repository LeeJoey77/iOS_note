//
//  ViewController.swift
//  Protocols
//
//  Created by admin on 2018/3/30.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

//2
protocol FullyNamed {
    var fullName: String { get }
}

//3
protocol RandomNumberGenerator {
    func random() -> Double
}

//4
protocol Togglable {
    mutating func toggle()
}

//5
protocol SomeProtocol {
    init(someParameter: Int)
}

//9
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

//14. 检验是否服从协议
//使用 is 和 as 操作符来检查协议的一致性或转化协议类型, 检查和转化的语法和类型相同

//is 操作符用来检查实例是否遵循了某个协议
//as? 返回一个可选值，当实例遵循协议时，返回该协议类型;否则返回nil
//as! 强制转换,会引发错误
protocol HasArea {
    var area: Double { get }
}

//15. 可选协议规定
//协议中的要求不一定实现,可以定义为 optional.
//协议和可选要求都要写 @objc
//@objc 协议只能被继承自 OC 类或者其它 @objc classes的类 adopt, 不能被 struct 和 enum 继承
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

//16. 协议扩展
//协议可以通过扩展给服从的类型提供方法, 构造器, 下标, 计算属性的实现. 这允许你在协议中定义行为, 而不是在每个服从的类中, 或者是使用全局函数
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}


//17. 协议的默认实现
//可以使用协议扩展, 给协议中的计算属性和方法提供默认的实现.如果服从的类有自己的实现,则会使用自己的
extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

//18. 为协议扩展添加约束
//定义协议扩展时, 可以指定服从类型必须满足的条件
//使用 where 关键字, 还可以使用 == , != 等运算符
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //协议(Protocol)用于定义完成某项任务或功能所必须的方法和属性，协议不提供具体实现
        //Class，struct，enum 通过提供协议所要求的方法和属性的具体实现来采用(adopt)协议
        
        //1. 语法
        //父类写在前边
//        class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
//            // 类的内容
//        }
        
        //2. 属性要求
        //协议中的实例属性和类型属性必须指明属性是只读的还是读写, 它的实现可以是存储属性或计算属性
        //协议中的属性必须为变量, 读写属性在类型后加 { get set }, 只读属性在类型后加 { get }
        //如果协议中的属性是读写的, 它的实现不能是一个常量存储属性或只读计算属性
//        protocol SomeProtocol {
//            var mustBeSettable: Int { get set }
//            var doesNotNeedToBeSettable: Int { get }
//        }
        
        struct Person: FullyNamed {
            var fullName: String
        }
        let john = Person(fullName: "John Appleseed")
        
        class Starship: FullyNamed {
            var prefix: String?
            var name: String
            init(name: String, prefix: String? = nil) {
                self.name = name
                self.prefix = prefix
            }
            var fullName: String {
                return (prefix != nil ? prefix! + " " : "") + name
            }
        }
        var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
        
        //3. 方法要求
        //协议中的实例方法或类方法, 支持变长参数(variadic parameter)，不支持参数默认值(default value)
        //            protocol SomeProtocol {
        //                func someTypeMethod()
        //            }
        
        class LinearCongruentialGenerator: RandomNumberGenerator {
            var lastRandom = 42.0
            let m = 139968.0
            let a = 3877.0
            let c = 29573.0
            func random() -> Double {
                lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
                return lastRandom / m
            }
        }
        let generator = LinearCongruentialGenerator()
        print("Here's a random number: \(generator.random())")
        
        //4. 变异方法要求
        //对于值类型(struct, enum), 默认在它的实例方法中不能修改其属性值，如果需要修改,在func之前添加关键字 mutating
        //对 Class 实现 mutating 方法时, 不用写 mutating
        enum OnOffSwitch : Togglable {
            case on, off
            mutating func toggle() {
                switch self {
                case .off:
                    self = .on
                case .on:
                    self = .off
                }
            }
        }
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()
        
        //5. 构造器
        //语法和普通构造器写法一样, 不用写大括号和构造体
        //protocol SomeProtocol {
        //    init(someParameter: Int)
        //}
        
        /*
        6. 构造器要求的类实现
        用类实现时, 协议中的构造器可以作为指定构造器或者便利构造器, 并且都要加 required 关键字
        使用 required 表明所有子类都必须实现该方法, 因此它们也服从该协议
        如果构造器前有 final 关键字, 不需要加 required , 因为它没有子类*/
        class SomeClass: SomeProtocol {
            required init(someParameter: Int) {
                
            }
        }
        
        //如果子类重写了父类的指定构造器, 并且该构造器遵循了某个协议的规定, 方法前加 required 和 override
        class SomeSuperClass {
            init(someParameter: Int) {
            }
        }
        
        class SomeSubClass: SomeSuperClass, SomeProtocol {
            // "required" from SomeProtocol conformance; "override" from SomeSuperClass
           required override init(someParameter: Int) {
            // initializer implementd here
            
            }
        }
        
        /*
        7. 可失败构造器的规定
        协议中的可失败构造器，其实现可以为可失败构造器或非可失败构造器
        协议中的非可失败构造器，其实现可以为非可失败构造器或隐式解包的可失败构造器（init!）*/

        /*
        8. 协议类型
        尽管协议本身并不实现任何功能，但是协议可以被当做类型来使用
        使用场景:
        协议类型作为函数、方法或构造器中的参数类型或返回值类型
        协议类型作为常量、变量或属性的类型
        协议类型作为数组、字典或其他容器中的元素类型
        注意: 协议是一种类型，因此协议类型的名称应与其他类型(Int，Double，String)的写法相同，使用驼峰式写法*/
        
        class Dice {
            let sides: Int
            //generator 属性可以赋值为任何服从 RandomNumberGenerator 协议的实例
            let generator: RandomNumberGenerator
            init(sides: Int, generator: RandomNumberGenerator) {
                self.sides = sides
                self.generator = generator
            }
            func roll() -> Int {
                return Int(generator.random() * Double(sides)) + 1
            }
        }
        //Dice类提供了一个名为roll的实例方法用来模拟骰子的面值
        var d6 = Dice(sides: 6,generator: LinearCongruentialGenerator())
        for _ in 1...5 {
            print("Random dice roll is \(d6.roll())")
        }
        
        //9. 代理模式
        //代理是一种设计模式，它允许 Class, struct 将它们的一些功能委托给其它类型的实例
        //代理的实现: 定义协议来封装需要被委托的函数和方法, 然后让遵循者实现这些功能
        //代理的作用:对某个 action 做出反应, 从外部数据源获取数据
        
        //为了防止 strong reference cycles, 代理被声明为 weak references
        //协议继承于 AnyObject, 表明协议是 class-only 的, 则协议的代理必须是 weak reference
        class SnakesAndLadders: DiceGame {
            let finalSquare = 25
            let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
            var square = 0
            var board: [Int]
            init() {
                board = Array(repeating: 0, count: finalSquare + 1)
                board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
                board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
            }
            //代理不一定玩游戏, 所以用可选类型
            weak var delegate: DiceGameDelegate?
            func play() {
                square = 0
                delegate?.gameDidStart(self)
                gameLoop: while square != finalSquare {
                    let diceRoll = dice.roll()
                    delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
                    switch square + diceRoll {
                    case finalSquare:
                        break gameLoop
                    case let newSquare where newSquare > finalSquare:
                        continue gameLoop
                    default:
                        square += diceRoll
                        square += board[square]
                    }
                }
                delegate?.gameDidEnd(self)
            }
        }

        class DiceGameTracker: DiceGameDelegate {
            var numberOfTurns = 0
            func gameDidStart(_ game: DiceGame) {
                numberOfTurns = 0
                if game is SnakesAndLadders {
                    print("Started a new game of Snakes and Ladders")
                }
                print("The game is using a \(game.dice.sides)-sided dice")
            }
            func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
                numberOfTurns += 1
                print("Rolled a \(diceRoll)")
            }
            func gameDidEnd(_ game: DiceGame) {
                print("The game lasted for \(numberOfTurns) turns")
            }
        }
        
        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.delegate = tracker
        game.play()
        // Started a new game of Snakes and Ladders
        // The game is using a 6-sided dice
        // Rolled a 3
        // Rolled a 5
        // Rolled a 4
        // Rolled a 5
        // The game lasted for 4 turns

        //10. 通过扩展服从协议
        //可以让现有的类服从协议,即使不知道这个类的源码
//        protocol TextRepresentable {
//            var textualDescription: String { get }
//        }
//        extension Dice: TextRepresentable {
//            var textualDescription: String {
//                return "A \(sides)-sided dice"
//            }
//        }
        
        //扩展之后 Dice 的实例就可以 be treated as TextRepresentable
//        let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
//        print(d12.textualDescription)
        // Prints "A 12-sided dice"
        
        
        //11. 有条件的服从协议
        //泛型可以有条件的服从协议, 可以在扩展中列出服从协议的限制条件, 用 where 引出
//        extension Array: TextRepresentable where Element: TextRepresentable {
//            var textualDescription: String {
//                let itemsAsText = self.map { $0.textualDescription }
//                return "[" + itemsAsText.joined(separator: ", ") + "]"
//            }
//        }
//        let myDice = [d6, d12]
//        print(myDice.textualDescription)
        // Prints "[A 6-sided dice, A 12-sided dice]"

        //12. 通过扩展 adopt 协议
        //如果一个类型符合一个协议的所有要求, 但是没有声明 adopt 协议, 可以用空扩展中使它 adopt 协议
//        struct Hamster {
//            var name: String
//            var textualDescription: String {
//                return "A hamster named \(name)"
//            }
//        }
//        extension Hamster: TextRepresentable {}
        
        //扩展之后 Hamster 的实例就可以 be treated as TextRepresentable
//        let simonTheHamster = Hamster(name: "Simon")
//        let somethingTextRepresentable: TextRepresentable = simonTheHamster
//        print(somethingTextRepresentable.textualDescription)
        // Prints "A hamster named Simon"
        
        //13. 协议类型 collection
        //协议可以作为类型存储在集合里
//        let things: [TextRepresentable] = [game, d12, simonTheHamster]
//        for thing in things {
//            print(thing.textualDescription)
//        }
        // A game of Snakes and Ladders with 25 squares
        // A 12-sided dice
        // A hamster named Simon
        
        //13. 协议继承
        //协议能够继承一到多个其他协议, 并且可以增加新的要求
        //语法与类的继承相似，多个协议间用逗号，分隔
//        protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
//            // 协议定义
//        }
        
        //如下所示，PrettyTextRepresentable协议继承了TextRepresentable协议
//        protocol PrettyTextRepresentable: TextRepresentable {
//            var prettyTextualDescription: String { get }
//        }
        //adopt PrettyTextRepresentable协议的类,既要实现 PrettyTextRepresentable 的要求，也要实现 TextRepresentable 的要求

        //14. 类专属协议
        //可以在协议的继承列表中添加 AnyObject, 来限制协议只能由 class 来 adopt
//        protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
//            // class-only protocol definition goes here
//        }
        
        //13. 协议合成(protocol composition )
        //多个协议可以合成一个 protocol composition, 但是 protocol composition不是一个新的协议类型
        /*
         protocol Named {
         var name: String { get }
         }
         protocol Aged {
         var age: Int { get }
         }
         struct Person: Named, Aged {
         var name: String
         var age: Int
         }
         func wishHappyBirthday(to celebrator: Named & Aged) {
         print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
         }
         let birthdayPerson = Person(name: "Malcolm", age: 21)
         wishHappyBirthday(to: birthdayPerson)
         // Prints "Happy birthday, Malcolm, you're 21!"
        
        wishHappyBirthday 函数的参数 celebrator 类型为protocol<Named，Aged>。可以传入任意遵循这两个协议的类型的实例
        
        协议合成并不会生成一个新协议类型，而是将多个协议合成为一个临时的协议，超出范围后立即失效。
        */
        
        //14. 检验是否服从协议
        //使用 is 和 as 操作符来检查协议的一致性或转化协议类型, 检查和转化的语法和类型相同
        
        //is 操作符用来检查实例是否遵循了某个协议
        //as? 返回一个可选值，当实例遵循协议时，返回该协议类型;否则返回nil
        //as! 强制转换,会引发错误
        //服从 HasArea协议
        class Circle: HasArea {
            let pi = 3.1415927
            var radius: Double
            var area: Double { return pi * radius * radius }
            init(radius: Double) { self.radius = radius }
        }
        //服从 HasArea协议
        class Country: HasArea {
            var area: Double
            init(area: Double) { self.area = area }
        }
        //不服从 HasArea协议
        class Animal {
            var legs: Int
            init(legs: Int) { self.legs = legs }
        }
        //把上边三个类型的实例添加到数组
        let objects: [AnyObject] = [
            Circle(radius: 2.0),
            Country(area: 243_610),
            Animal(legs: 4)
        ]
        
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("Area is \(objectWithArea.area)")
            } else {
                print("Something that doesn't have an area")
            }
        }
        // Area is 12.5663708
        // Area is 243610.0
        // Something that doesn't have an area
    
        //objects数组中元素的类型并不会因为向下转型而改变，它们仍然是Circle，Country，Animal类型。然而，当它们被赋值给objectWithArea常量时，则只被视为HasArea类型，因此只有area属性能够被访问
        
        //15. 可选协议规定
        //协议中的要求不一定实现,可以定义为 optional.
        //协议和可选要求都要写 @objc
        //@objc 协议只能被继承自 OC 类或者其它 @objc classes的类 adopt, 不能被 struct 和 enum 继承
        
        //如果方法或属性是 optional, 类型自动变为可选类型, 例如 (Int) -> String 类型的方法, 类型变为 ((Int) -> String)?
        //可选协议要求可以用可选链调用, 防止服从协议的类没有实现协议的要求
        //检查可选方法是否实现, 调用时在方法名后加 ?
        class Counter {
            var count = 0
            var dataSource: CounterDataSource?
            func increment() {
                if let amount = dataSource?.increment?(forCount: count) {
                    count += amount
                } else if let amount = dataSource?.fixedIncrement {
                    count += amount
                }
            }
        }

        //16. 协议扩展
        //协议可以通过扩展给服从的类型提供方法, 构造器, 下标, 计算属性的实现. 这允许你在协议中定义行为, 而不是在每个服从的类中, 或者是使用全局函数
        let generator1 = LinearCongruentialGenerator()
        print("Here's a random number: \(generator1.random())")
        // Prints "Here's a random number: 0.37464991998171"
        print("And here's a random Boolean: \(generator1.randomBool())")
        // Prints "And here's a random Boolean: true"
        //协议扩展只能给服从的类型添加实现, can’t make a protocol extend or inherit from another protocol, 协议继承必须在协议声明中
        
        
        //17. 协议的默认实现
        //可以使用协议扩展, 给协议中的计算属性和方法提供默认的实现.如果服从的类有自己的实现,则会使用自己的

        //18. 为协议扩展添加约束
        //定义协议扩展时, 可以指定服从类型必须满足的条件
        //使用 where 关键字, 还可以使用 == , != 等运算符

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



