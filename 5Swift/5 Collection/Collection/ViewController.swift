//
//  ViewController.swift
//  Collection
//
//  Created by admin on 2018/1/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //一. 数组(Array)
        //同 OC 一样, array 是有序的, 其它两个无序
        //可变 var, 不可变 let
        //Array(Dictionarie, Sett)类型写法: Array<存储数据类型> 或者 [存储数据类型] 一般使用第二种
        //1. 数组初始化方法,创建一个空数组
        var someInts = Array<Int>()
//        var someInts = []()
        print("someInts is of type [Int] with \(someInts.count) items")
        //如果(通过函数参数或者已知类型的值),已知元素类型,可以用 [] 语句创建一个空数组
        someInts.append(3) //添加一个新元素
        someInts = []
        
        //2. 创建有 n 个相同元素的数组
        var threeDoubles = Array(repeatElement(0.0, count: 3))
        print(threeDoubles)
        
        //3. 合并数组, 两个数组中元素类型必须一样
        var anotherThreeDoubles = Array(repeatElement(1.0, count: 3))
        var sixDoubles = threeDoubles + anotherThreeDoubles
        
        //4. 用数组语法创建一个数组
        var shoppingList: [String] = ["Eggs", "Milk", "Bread"]
        //可简写为 var shoppingList = ["Eggs", "Milk", "Bread"]
        //获取元素个数 count
        print("The shopping list contains \(shoppingList.count) items.")
        
        //5. 判断数组是否为空 isEmpty
        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        }else {
            print("The shopping list is not empty.")
        }
        
        //6. 数组中添加元素 append(_:)
        shoppingList.append("Flour")
        
        //7. 添加一个数组也可以用 +=
        shoppingList += [" Baking Powder"]
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        
        //8. 获取数组中的元素
        var firstItem = shoppingList[0]
        
        //9. 修改数组中的元素
        shoppingList[0] = "Six eggs"
        //用 range 修改多个值, 修改的个数和赋值的个数可以不一样
        shoppingList[4...6] = ["chicken", "pork"] //"Six eggs", "Milk", "Bread", "Flour", " Baking Powder", "Chocolate Spread", "Cheese", "Butter"] 中下标为 4, 5, 6 的三个元素被 替换为两个元素
//        print(shoppingList)
        
        //10. 往数组中插入元素
        shoppingList.insert("Maple Syrup", at: 0)
        
        //11. 移除数组中的元素, 并将移除的元素返回, 移除后第一个元素变为 Six eggs
        let mapleSyrup = shoppingList.remove(at: 0)
        //移除最后一个元素, 同样将移除的元素返回
        let pork = shoppingList.removeLast()
       
        //12. 遍历数组
        for item in shoppingList {
            print(item)
        }
        //用 enumerated() 方法遍历,返回值为元组,元组包括元素下标和元素值
        for (index, value) in shoppingList.enumerated() {
            print("Item \(index): \(value)")
        }
//        Item 0: Six eggs
//        Item 1: Milk
//        Item 2: Bread
//        Item 3: Flour
//        Item 4: chicken
//        Item 5: pork
    
        
        //二. 集合(Set)
        //1. 创建集合
        //(1) Swift 中的集合类型写法为 Set<类型>
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        letters.insert("a")
        //如果已知为集合类型,可以用创建空数组的语法创建一个空集合, letters 此时为空集合,但是仍然是 Set<Character> 类型的
        letters = []
        
        //(2) 用数组初始化一个集合
        //set 类型不能从一个数组语句单独推出, 所以类型 Set 必须声明. 又,因为 Swift 的类型推断,如果用数组语法初始化 Set 而且集合中元素的类型相同,可以不必写元素的类型
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        var fav: Set = ["apple", "huawei"]
        
        //2. Set 也有 count 和 isEmpty 属性
        
        //3. Set 插入值
        favoriteGenres.insert("Jazz")
        
        //4. Set 删除值,
        //如果集合中包含该值移除该值并返回, 否则返回 nil
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it")
        } else {
            print("I never much cared for that.")
        }
        
        //5. 检查 Set 是否有某个值,用 contains 属性
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
        
        //6. 遍历 Set
        for genre in favoriteGenres {
            print(genre)
        }
        // Jazz
        // Hip hop
        // Classical
        //集合中的元素是无序的,用 sorted() 可以按 < 顺序输出
        for genre in favoriteGenres.sorted() {
            print("\(genre)")
        }
        // Classical
        // Hip hop
        // Jazz
        
        //7. 集合的运算
        //(1) 交集(union), 并集(intersection), symmetricDifference(a 并 b 减 a 交 b), subtracting (a 减 a 交 b)
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
        oddDigits.union(evenDigits).sorted() //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        oddDigits.intersection(evenDigits).sorted() // []
        oddDigits.subtracting(singleDigitPrimeNumbers).sorted() //[1, 9]
        oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() //[1, 2, 9]
        
        //(2) 子集isSubset, 父集isSuperset, 完全子集isStrictSubset, 完全父集isStrictSuperset, 不想交isDisjoint, 相等 ==
        //返回 Bool 值
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        houseAnimals.isSubset(of: farmAnimals)
        farmAnimals.isSuperset(of: houseAnimals)
        farmAnimals.isDisjoint(with: cityAnimals)
        
        
        //三. 字典(Dictionary)
        //1. 字典类型写法 Dictionary<key 类型, value 类型> 或 [key: value], 常用第二种形式
        var namesOfIntegers = [Int: String]()
        namesOfIntegers[16] = "sixteen"
        //如果已知为字典类型,则可以用 [:] 方法创建一个空字典
        namesOfIntegers = [:]
        
        //2. 创建包含多个键值对的字典
        //[key 1: value 1, key 2: value 2, key 3: value 3]
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        //keys 和 values 类型分别都一致时,初始化方法可以简写为
        var airporstShot = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        
        //3. 字典也有 count, isEmpty 属性
        
        //4. 添加一个键值对
        airports["LHR"] = "London"
        
        //updateValue(_:forKey:)
        //如果 key 存在更新  value 的值,以字典 value 类型的可选类型返回 value 的旧值
        //如果 key 不存在,添加一个值,并以字典 value 类型的可选类型返回该值
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }else {
            print("There was no value for DUB before.")
        }
        
        //5. 获取字典的值
        //用subscribe 取值,当 value 存在以该值类型的可选类型返回该值;不存在返回 nil
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName)")
        }else {
            print("That airport is not in the airports dictionary.")
        }
        
        //6. 删除字典元素
        //将 key 对应的 value 赋为 nil
        airports["APL"] = "Apple"
        airports["APL"] = nil
        print(airports)
        
        //使用removeValue(forKey:), 如果存在以该值类型的可选类型返回该值;不存在返回 nil
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        
        //7. 遍历字典
        //(1) 遍历字典元素
        //用 for in 循环,字典中的键值对是以元组类型返回的 (key, value),可以分解元组
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        //YYZ: Toronto Pearson
        //LHR: London
        
        //(2) 遍历字典的 key 和 value
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        for airportName in airports.values {
            print("AirportName: \(airportName)")
        }
        
        //8. 用 key(value)值初始化一个数组
        let airportCodes = [String](airports.keys)
        let airportNames = [String](airports.values)
        //可以用 sorted() 方法对, keys 或 values 进行排序输出
        let airportSortedCodes = [String](airports.keys.sorted())
        print("\(airportCodes), \(airportSortedCodes)")
        
        //Swift 中的基本数据类型 String, Int, Double, Bool 的 object 都可以通过一种方式计算出其哈希值,哈希值是 Int 类型的 两个相等的 object 哈希值相同.如 if a == b, 那么意味着 a.hashValue == b.hashValue
        //集合 set 中的值, 字典 dictionary 的key 值, 没有相关值的 Enumeration 的 case 值都是可哈希的
        //自定义类型要作为 set 或者 dictionary key 的值的类型,要服从 swift 标准库文件里的Hashable protocol, 服从该协议的类型要提供一个可得的 Int 属性 hashValue, 这一属性返回的值在同一函数的不同运行过程,不同函数中是不同的.因为 Hashable protocol 服从 Equatable protocol, 服从 Equatable protocol必须实现 ==.对任意三个值 a, b, c 要实现 ==,必须满足: a == a, a == b  b == a, a == b && b == c a == c
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

