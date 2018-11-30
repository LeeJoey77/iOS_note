//
//  ViewController.swift
//  Generics
//
//  Created by admin on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

//7
//定义协议 Container, 声明一个 Associated Types  Item
private protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//12. 有泛型 where 语句的 Associated Types
// Associated Types 可以有 where 语句
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
        //泛型可用于 Function, Class, Struct, Enum, subscript, protocol
        //对于 Function, Class, Struct, Enum, subscript, 泛型表现为 Type Parameters
        //对于 protocol, 泛型表现为 Associated Types
        //Swift 中的 Array<Element>, Dictionary<Key, Value> 等都是泛型
        
        
        //1. 泛型函数
        //形式: 函数名后跟 <Type Parameters>
        
        //type parameter 作用: 指定一个 type parameter 后, 可以用它定义函数参数, 作为返回值类型,
        //或者作为函数体内的 type annotation, 如果有多个 type parameter, 用逗号隔开.
        
        //type parameter 命名: 对于有实际意义的可以取 descriptive names,
        //比如 Dictionary<Key, Value>, 无意义的用T, U, V 等.
        
        //泛型函数调用: 函数调用时 type parameter 由具体参数替代
        
        //例: 定义一个交换两个值的函数
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
        //除了泛型函数, Swift 还可以对 Class, struct, enum 自定义泛型类型.
        //形式: 类型名后跟 <Type Parameters>
        //使用: 类型名后跟 <Type Parameters>
        
        //例: 用泛型定义一个"后进先出"的有序集合类型 stack
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
        //两个方法都是 mutating, 因为他们都需要修改 struct 的 items 属性
        
        //创建 stack 实例
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        let fromTheTop = stackOfStrings.pop()
        
        //3. 扩展泛型类型
        //扩展泛型类型时不用提供 type parameter 列表作为 extension 定义的一部分,
        //original type 定义中的 type parameter 列表在扩展体里仍然可以使用
        
        //例: 为 stack 增加一个只读计算属性 topItem, 返回最上边的 item 但是不 pop 它
        //extension Stack {
        //    var topItem: Element? {//Stack 定义时的 type parameter 在 extension 中可用
        //        return items.isEmpty ? nil : items[items.count - 1]
        //    }
        //}
        
        //if let topItem = stackOfStrings.topItem {
        //    print("The top item on the stack is \(topItem).")
        //}
        // Prints "The top item on the stack is tres."
        
        //4. 类型约束(Type Constraints)
        //有时给泛型函数, 泛型类型的 type parameter 添加类型约束是有用的.
        //类型约束指定一个 type parameter 必须继承于特定的类, 服从特定协议或协议组合
        
        //例: 字典的 key 限制为服从 Hashable 协议的 String
        
        //5. 类型约束语法
        //形式: 在 type parameter 名后跟 class or protocol, 用 : 隔开
        
        //例: 定义一个泛型函数, type parameter  T 继承于 SomeClass, U 服从 SomeProtocol
        //func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
        //    // function body goes here
        //}
        
        //类型约束应用:
        
        //例: 寻找数组中第一个匹配的字符串
        //func findIndex1<T>(of valueToFind: T, in array:[T]) -> Int? {
        //    for (index, value) in array.enumerated() {
        //        if value == valueToFind {
        //            return index
        //        }
        //    }
        //    return nil
        //}
        //报错两个 T 类型的数不能用 ==, 不是所有的类的值都可以比较, Swift 标准库里提供了 Equatable 协议,
        //任何服从 Equatable 协议的类型都实现了 ==, !=, Swift 的标准类型都支持 Equatable 协议
        
        //可改为:
        func findIndex1<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
            for (index, value) in array.enumerated() {
                if value == valueToFind {
                    return index
                }
            }
            return nil
        }
        let doubleIndex = findIndex1(of: 9.3, in: [3.14159, 0.1, 0.25])
        let stringIndex = findIndex1(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

        /*---------------------------------------------------------------------*/
        //对于 protocol, 泛型表现为 Associated Types

        //6.  Associated Types (Associated Types)
        //定义一个协议时, 有时是有用的声明一个或多个 Associated Types 作为协议的定义
        // Associated Types 作为协议中使用的一个类型的占位符
        //实际的类型在 adopt 协议时确定
        // Associated Types 使用关键字 associatedtype
    
        //7.  Associated Types 应用:
        
        //例: Container 协议
        // Container 协议没有规定 items 怎么存储, 存储元素类型.
        //只是声明了三个函数, 服从协议的类型必须执行这三个函数, 也可以添加其它功能
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
        
        //8. 扩展现有的类型(给有相关值的协议)指定一个 Associated Types
        //可以通过扩展让一个现有的类型服从一个协议, 包括有相关值的协议.
        
        //例如Swift 中的 Array 类型符合上面定义的 Container 协议, 这意味着可以定义一个空扩展让 Array 服从Container 协议,
        //服从 Container 协议后, Array 的 append 方法和 subscript 方法, 可以让 Swift 推断 Container 中 Item 的类型
        
        //extension Array: Container {}

        //9. 给 Associated Types 添加约束
        //可以给协议中的 Associated Types 添加约束, 让 Associated Types 满足这些约束.
        
        //例: 下例中给 Container 协议的 Associated Types  Item 添加一个 equatable 约束
        //protocol Container {
        //    associatedtype Item: Equatable
        //    mutating func append(_ item: Item)
        //    var count: Int { get }
        //    subscript(i: Int) -> Item { get }
        //}
        
        //10. 在协议的 Associated Types 约束中使用协议
        //一个协议可以作为自己的 requirement 的一部分
        
        //protocol SuffixableContainer: Container {
        //    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
        //    func suffix(_ size: Int) -> Suffix
        //}
        //在 SuffixableContainer 协议中, Suffix 和 Container 中的 Item 一样是一个 Associated Types .
        //Suffix 有两个限制: 必须服从 SuffixableContainer 协议, 它的 Item 类型必须和container’s 的 Item 类型相同
        //对 Item 的约束是泛型 where 语句
        
        //扩展 Stack 服从 SuffixableContainer 协议
        //extension Stack: SuffixableContainer {
        //    func suffix(_ size: Int) -> Stack {
        //        var result = Stack()
        //        for index in (count-size)..<count {
        //            result.append(self[index])
        //        }
        //        return result
        //    }
        //    // Inferred that Suffix is Stack.
        //}
        //var stackOfInts = Stack<Int>()
        //stackOfInts.append(10)
        //stackOfInts.append(20)
        //stackOfInts.append(30)
        //let suffix = stackOfInts.suffix(2)
        
        //上例中 Stack 的 Associated Types  Suffix 同样也是 Stack, 所有 suffix 的返回值类型是 Stack.
        //另外, 服从 SuffixableContainer 协议的类型, 也可以有一个和自己不同类型的 Associated Types  Suffix,
        //意味着 suffix 可以返回不同的类型.
        //例如,下例中非泛型的 IntStack 服从 SuffixableContainer 协议, suffix 类型为 Stack<Int>
        //而不是 IntStack
        //extension IntStack: SuffixableContainer {
        //    func suffix(_ size: Int) -> Stack<Int> {
        //        var result = Stack<Int>()
        //        for index in (count-size)..<count {
        //            result.append(self[index])
        //        }
        //        return result
        //    }
        //    // Inferred that Suffix is Stack<Int>.
        //}
        
        //10. 泛型 where 语句(Generic Where Clauses)
        //类型约束可以给泛型函数, 泛型下标, 泛型类型(Class, Struct, Enum)的 type parameter 添加约束.
        //同样的, 也可以给 protocol 的 Associated Types 添加约束, 给 Associated Types 添加约束使用 generic where 语句.
        //可以使用 generic where 语句让 Associated Types 服从某个协议, 或者某个 type parameter, associated types x必须相同.
        
        //形式: where 语句写在函数体开始大括号之前, 中间写对 associated types 的约束
        
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
