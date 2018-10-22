//
//  ViewController.swift
//  Control Flow
//
//  Created by admin on 2018/2/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //while, if, guard, switch, for in, where break, continue
        
        //一. For in
        //用于遍历 Strings, Array, dictionary, Set, ranges等
        //for in 循环中的局部变量如 name 是一个 let 值,每次创建循环都会创建, 如果用不到局部变量的值,可以用下划线代替
        //1. for in 遍历数组
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print(name)
        }
        
        //2. for in 遍历字典
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        
        //3. for in 遍历 range
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        //4. 不用局部变量的值, 用 _ 代替
        let base = 3
        let power = 10
        var answer = 1
        for _ in 1...power {
            answer *= base
        }
        
        let minutes = 60
        for tickMark in 0..<minutes {
            print(tickMark)
        }
        
        //5. 间隔遍历
        //开区间用 stride(from:to:by:), 不包括最后一位
        let minuteInterval = 5
        for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
            print(tickMark) //(0, 5, 10, 15 ... 45, 50, 55)
        }
        //闭区间用 stride(from:through:by:), 包括最后一位
        let hours = 12
        let hourInterval = 3
        for tickMark in stride(from: 0, through: 12, by: hourInterval) {
            print(tickMark) //0, 3, 6, 9, 12
        }
        
        
        //二. while
        //分为 while 和 repeat-while
        //while
        //while condition {
        //    statements
        //}
        
        //repeat-while
        //repeat {
        //  statements
        //} while condition
        
        
        //三. Switch 和 if
        //1. switch 执行一次匹配语句停止,不需要写 break, 但仍然可以使用break 跳出语句
        //case(包括 default) 语句中至少有一条语句,不允许为空
        //fallthrough 相当于 break当前语句,继续往下判断
        let someCharacer: Character = "z"
        switch someCharacer {
        case "a":
            print("The first letter of the alphabet")
        case "z":
            print("The last letter of the alphabet")
            fallthrough
        default:
            print("Some other character")
        }
        
        //2. 一个case 匹配多个值, 用逗号隔开
        let anotherCharacter: Character = "a"
        switch anotherCharacter {
        case "a", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("The letter a")
        default:
            print("Not the letter A")
        }
        
        //3. case使用ranges匹配
        let approximateCount = 62
        let countedThings = "moons orbiting Saturn"
        let naturalCount: String
        switch approximateCount {
        case 0:
            naturalCount = "no"
        case 1..<5:
            naturalCount = "a few"
        case 5..<12:
            naturalCount = "several"
        case 12..<100:
            naturalCount = "dozens of"
        case 100..<1000:
            naturalCount = "hundreds of"
        default:
            naturalCount = "many"
        }
        print("There are \(naturalCount) \(countedThings).")
        // Prints "There are dozens of moons orbiting Saturn."
        
        //4.  case 使用tuples匹配
        //可以用通配符 _ , 匹配任意值
        //Swift 允许所有的 case 都匹配,但是只会执行第一个匹配的,其它的忽略
        let somePoint = (0, 0)
        switch somePoint {
        case (0, 0):
            print("\(somePoint) is at the origin")
        case (_, 0):
            print("\(somePoint) is on the x-axis")
        case (0, _):
            print("\(somePoint) is on the y-axis")
        case (-2...2, -2...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        // Prints "(1, 1) is inside the box"
        
        //5.  case值绑定,switch case 可以为它比较的值命名一个临时变量或常量在 case 语句中使用
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        // Prints "on the x-axis with an x value of 2"
        
        //6. where, 可以用于在 case 语句中添加判断条件
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        // Prints "(1, -1) is on the line x == -y"
        
        //7. 复合 case 语句
        //一个 case 匹配多个值, 每个值称为一个 pattern, 可换行
        let someCharacter: Character = "e"
        switch someCharacter {
        case "a", "e", "i", "o", "u":
            print("\(someCharacter) is a vowel")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("\(someCharacter) is a consonant")
        default:
            print("\(someCharacter) is not a vowel or a consonant")
        }
        // Prints "e is a vowel"
        
        //8. 复合 case 语句值绑定(value bindings)
        //每个 pattern 必须包含一个相同的 binding, 每个 binding必须从每个 pattern 中获取一个相同类型的值,确保在 case 语句体中,始终可以得到一个相同类型的值.
        //如下例每个 pattern 中都有一个binding 对应 distance 常量, distance 在每个 pattern 中都可以得到一个相同类型的值
        let stillAnotherPoint = (9, 0)
        switch stillAnotherPoint {
        case (let distance, 0), (0, let distance):
            print("On an axis, \(distance) from the origin")
        default:
            print("Not on an axis")
        }
        // Prints "On an axis, 9 from the origin"
        
        //9. 控制流传递语句(Control Transfer Statements)
        //可以改变代码的执行顺序,把控制流从一部分代码转到另一部分,
        //Swift 中有五个控制流传递语句: continue, break, fallthrough, return, throw
        //continue, break, fallthrough 用于一般控制流
        //return 用于函数 Functions
        //throw 用于函数中抛出错误
        
        //(1) continue, 结束当前这一次遍历
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
        for aChar in puzzleInput {
            if charactersToRemove.contains(aChar) {
                continue
            }else {
                puzzleOutput.append(aChar)
            }
        }
        print(puzzleOutput)
        
        //(2) break, 用于 conditional 语句或者 loop 中,结束整个控制流
        let numberSymbol: Character = "三"  // Chinese symbol for the number 3
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
        }
        
        //(3) 条件 binding, 必须用可选类型
        if let integerValue = possibleIntegerValue {
            print("The integer value of \(numberSymbol) is \(integerValue).")
        } else {
            print("An integer value could not be found for \(numberSymbol).")
        }
        // Prints "The integer value of 三 is 3."
        
        //(4) fallthrough
        //Swift case 语句匹配成功自动结束不需要写 break, 如果要继续向下匹配用 fallthrough
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
        // Prints "The number 5 is a prime number, and also an integer."
        
        //(5) 标签语句
        //break, continue 可用于 conditional 和 loop, 在嵌套中为了区分break 作用于那个 control flow,可以给 loop 或者 conditional 语句加一个标签
        //在控制流关键词前加一个标签 label后面加一个冒号
        //label name: while condition {
        //    statements
        //}
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        gameLoop: while square != finalSquare {
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            switch square + diceRoll {
            case finalSquare:
                // diceRoll will move us to the final square, so the game is over
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                // diceRoll will move us beyond the final square, so roll again
                continue gameLoop
            default:
                // this is a valid move, so find out its effect
                square += diceRoll
                square += board[square]
            }
        }
        print("Game over!")
        //上例中 break, 可以终止 switch也可以终止 loop,用 label 明确是终止 loop 而不是 switch.
        //continue 只作用于 loop, 后边可以不注明跳出那个控制流
        
        //10. guard 语句
        //用法类似于 if, 和 if 不同的是后边必须有一个 else 语句,满足条件,执行 guard 语句之后的代码,否则执行 else 中的代码
        func greet(person: [String: String]) {
            guard let name = person["name"] else {
                return
            }
            print("Hello \(name)!")
            
            guard let location = person["location"] else {
                print("I hope the weather is nice near you.")
                return
            }
            
            print("I hope the weather is nice in \(location).")
            
        }
        greet(person: ["name": "John"])
        // Prints "Hello John!"
        // Prints "I hope the weather is nice near you."
        greet(person: ["name": "Jane", "location": "Cupertino"])
        // Prints "Hello Jane!"
        // Prints "I hope the weather is nice in Cupertino."
        //11. 检查 API 的可得性
        //Swift 内置支持检查,编码器使用SDK(software development kit) 中的信息来判断代码中使用的 API(application programming interface)在部署目标中可得,如果不可得会编译报错
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

