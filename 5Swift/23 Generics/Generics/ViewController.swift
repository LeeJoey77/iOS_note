//
//  ViewController.swift
//  Generics
//
//  Created by admin on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

//7
//定义协议 Container, 声明一个相关类型 Item
private protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//12. 有泛型 where 语句的相关类型
//相关类型可以有 where 语句
private protocol Container1 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}
//对于继承的协议可以用泛型 where 语句给继承的类型添加约束
private protocol ComparableContainer: Container1 where Item: Comparable { }


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //泛型(Generics)
        //泛型可用于函数,类型(Class, struct, enum),下标. Swift 中的 Array<Element>, Dictionary<Key, Value> 等都是泛型
        
        //1. 泛型函数
        //类型参数, 写在函数名后, 用 <>
        //指定一个类型参数后, 可以用它定义函数参数, 返回值类型, 函数体内的类型标注, 多个用逗号隔开
        //类型参数命名: 对于有实际意义的可以取 descriptive names 比如 Dictionary<Key, Value>, 无意义的用T, U, V 等
        //函数调用时类型参数由具体参数替代
        //两个参数必须为相同类型
        func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        var someInt = 3
        var anotherInt = 107
        swapTwoValues(&someInt, &anotherInt)
        // someInt is now 107, and anotherInt is now 3
        
        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, &anotherString)
        // someString is now "world", and anotherString is now "hello"
        
        //2. 泛型类型
        //除了泛型函数, Swift 可以定义泛型类型, Class, struct, enum
        
        //用泛型定义一个"后进先出"的有序集合类型 stack
        //非泛型版本
        struct IntStack {
            var items = [Int]()
            mutating func push(_ item: Int) {
                items.append(item)
            }
            mutating func pop() -> Int {
                return items.removeLast()
            }
        }
        
        //泛型版本
        struct Stack<Element> {
            var items = [Element]()
            mutating func push(_ item: Element) {
                items.append(item)
            }
            mutating func pop() -> Element {
                return items.removeLast()
            }
        }
        //两个方法都是 mutating, 因为他们都需要修改 struct 的 item 数组
        //Element 类型参数, 紧跟在 struct 后边, 用尖括号<Element>
        
        //创建 stack 实例
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        let fromTheTop = stackOfStrings.pop()
        
        //3. 扩展泛型类型
        //扩展泛型类型时不用写类型参数列表, 但是类型参数列表在扩展体里可以使用
        //为 stack 增加一个只读计算属性
//        extension Stack {
//            var topItem: Element? {
//                return items.isEmpty ? nil : items[items.count - 1]
//            }
//        }
        
        //访问最后一个元素
//        if let topItem = stackOfStrings.topItem {
//            print("The top item on the stack is \(topItem).")
//        }
        // Prints "The top item on the stack is tres."
        
        //4. 类型限制
        //泛型函数和泛型类型的类型限制指定一个类型参数必须继承于特定的类, 服从特定协议或协议组合
        //例如字典的 key 限制为服从 Hashable 协议的 String
        
        //5. 类型限制语法
        //SomeClass: 某个类型, SomeProtocol: 某个协议
//        func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//            // function body goes here
//        }
        
        
        //寻找数组中第一个匹配的字符串
        //非泛型版本
        func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
            for (index, value) in array.enumerated() {
                if value == valueToFind {
                    return index
                }
            }
            return nil
        }
        
        let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
        if let foundIndex = findIndex(ofString: "llama", in: strings) {
            print("The index of llama is \(foundIndex)")
        }
        // Prints "The index of llama is 2"
        
        //泛型版本
        //限制类型服从 Equatable 协议, 不是所有的类的值都可以比较,不服从 Equatable 协议时不会编译
        func findIndex1<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
            for (index, value) in array.enumerated() {
                if value == valueToFind {
                    return index
                }
            }
            return nil
        }
        let doubleIndex = findIndex1(of: 9.3, in: [3.14159, 0.1, 0.25])
        // doubleIndex is an optional Int with no value, because 9.3 isn't in the array
        let stringIndex = findIndex1(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
        // stringIndex is an optional Int containing a value of 2

        //6. 相关类型
        //定义一个协议时, 有时是必要的声明一个或多个相关类型作为协议的定义
        //相关类型作为协议中使用的一个类型的占位符, 实际的类型在 adopt 协议时确定.相关类型使用关键字 associatedtype
    
        //7. 相关类型执行
        //Container 协议没有规定 items 怎么存储, 存储元素类型.只是声明了三个函数, 服从协议的类型必须执行这三个函数, 也可以添加其它功能
        struct Stack1<Element>: Container {
            
            //Stack 原有方法
            var items = [Element]()
            mutating func push(_ item: Element) {
                items.append(item)
            }
            mutating func pop() -> Element {
                return items.removeLast()
            }
        
            //Container 协议中的方法
            mutating func append(_ item: Element) {
                self.push(item)
            }
            var count: Int {
                return items.count
            }
            subscript(i: Int) -> Element {
                return items[i]
            }
        }
        
        //8. 扩展现有的类型具体化一个相关类型
        //可以扩展一个现有的类型服从协议, Swift 中的 Array 类型符合上面定义的 Container 协议, 因此可以定义一个空扩展让 Array 服从Container 协议
//        extension Array: Container {}

        //9. 给相关类型添加限制
        //可以给协议中的相关类型添加约束让服从类型满足这些约束.
        //给 Item 添加一个可相等的约束
//        protocol Container {
//            associatedtype Item: Equatable
//            mutating func append(_ item: Item)
//            var count: Int { get }
//            subscript(i: Int) -> Item { get }
//        }
        
        //10. 在协议的相关类型约束中使用协议
        //一个协议可以作为自己的定义的一部分
        //Suffix 有两个限制, 必须服从 SuffixableContainer 协议, 它的 Item 类型必须和container’s 的 Item 类型相同
//        protocol SuffixableContainer: Container {
//            associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
//            func suffix(_ size: Int) -> Suffix
//        }
        
        //扩展 stack 服从 SuffixableContainer 协议
//        extension Stack: SuffixableContainer {
//            func suffix(_ size: Int) -> Stack {
//                var result = Stack()
//                for index in (count-size)..<count {
//                    result.append(self[index])
//                }
//                return result
//            }
//            // Inferred that Suffix is Stack.
//        }
//        var stackOfInts = Stack<Int>()
//        stackOfInts.append(10)
//        stackOfInts.append(20)
//        stackOfInts.append(30)
//        let suffix = stackOfInts.suffix(2)
        // suffix contains 20 and 30
        
        //10. 泛型 where 语句
        //类型限制可以给泛型函数, 下标, 类型相关的类型参数添加限制.
        //也可以给相关类型添加限制, 给相关类型添加限制使用 where 语句, 限制可以是服从某个协议, 或者某种类型参数和类型参数相同
        //where 语句写在大括号之前
//        func allItemsMatch<C1: Container, C2: Container>
//            (_ someContainer: C1, _ anotherContainer: C2) -> Bool
//            where C1.Item == C2.Item, C1.Item: Equatable {
//
//                // Check that both containers contain the same number of items.
//                if someContainer.count != anotherContainer.count {
//                    return false
//                }
//
//                // Check each pair of items to see if they're equivalent.
//                for i in 0..<someContainer.count {
//                    if someContainer[i] != anotherContainer[i] {
//                        return false
//                    }
//                }
//
//                // All items match, so return true.
//                return true
//        }
//        var stackOfStrings = Stack<String>()
//        stackOfStrings.push("uno")
//        stackOfStrings.push("dos")
//        stackOfStrings.push("tres")
//
//        var arrayOfStrings = ["uno", "dos", "tres"]
//
//        if allItemsMatch(stackOfStrings, arrayOfStrings) {
//            print("All items match.")
//        } else {
//            print("Not all items match.")
//        }
        // Prints "All items match."
        
        //11. 有 where 语句的扩展
        //可以将泛型的 where 语句作为延展的一部分
//        extension Stack where Element: Equatable {
//            func isTop(_ item: Element) -> Bool {
//                guard let topItem = items.last else {
//                    return false
//                }
//                return topItem == item
//            }
//        }
//
//        if stackOfStrings.isTop("tres") {
//            print("Top element is tres.")
//        } else {
//            print("Top element is something else.")
//        }
        // Prints "Top element is tres."
        
        //12. Container1 协议
        
        //13. extension Container

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//13. 泛型下标
//下标可以是泛型,并且可以包含 where 语句.where 语句写在下标语句体大括号之前
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
