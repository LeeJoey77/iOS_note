//
//  AnotherViewController.swift
//  Generics
//
//  Created by admin on 2018/4/10.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

private protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item? { get set}
}

private struct Stacker<Member>: Container {
    
    var items = [Member]()
    mutating func push(_ item: Member) {
        items.append(item)
    }
    mutating func pop() -> Member {
        return items.removeLast()
    }
    
    //实现 Container 协议
    mutating func append(_ item: Member) {
        self.push(item)
    }
    subscript(i: Int) -> Member? {
        get {
            if i > items.count - 1 {
                return nil
            }
            return items[i]
        }
        set(newMem) {
            if i > items.count - 1 {
                return
            }
            items[i] = newMem!
        }
    }
    var count: Int {
        return items.count
    }
}

class AnotherViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        swapAction()
        createStackInstance()
    }
    
    func swapAction() {
        //泛型交换两个参数的值
        var someStr = "a", anotherStr = "b"
        swapTwoValues(&someStr, &anotherStr)
        var someInt = 1, anotherInt = 2
        swapTwoValues(&someInt, &anotherInt)
    }

    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let tempA = a
        a = b
        b = tempA
    }
    
    func createStackInstance() {
        var stackOfStrings = Stacker<String>()
        stackOfStrings.push("aa")
        stackOfStrings.push("b")
        _ = stackOfStrings.pop()
        //访问最后一个元素
        if let topItem = stackOfStrings.topItem {
            print(topItem)
        }
        if let mem = stackOfStrings[3] {
            print(mem)
        }
        stackOfStrings[3] = "sdfaf"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Stacker {
    var topItem: Member? {
        return items.isEmpty ? nil : items.last
    }
}
