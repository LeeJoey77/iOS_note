//
//  ViewController.swift
//  Memory Safety
//
//  Created by admin on 2018/4/17.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //并行, 多线程也会有访问内存冲突, 这里讨论的是单线程, 不是实际的并行和多线程
        
        //1. 访问内存冲突
        //对同一块内存的读写同时进行
        
        //2. 内存访问特征
        //按冲突访问的语境, 内存访问有三个特征: 访问是否是读或写, 访问的中间过程, 内存正在被访问
        //特别地, 当两个访问满足以下条件时, 冲突发生:
            //至少一个写
            //访问内存的同一个地址
            //durations 交叉
        //读和写的区别: 写改变内存地址, 读不会改变.
        //内存访问的 duration 要么是 instantaneous ,要么是 long-term
        //一个访问是 instantaneous 如果在访问期间其它代码不能运行, 因此两个 instantaneous 访问不能同时发生, 大多数内存访问都是 instantaneous
        func oneMore(than number: Int) -> Int {
            return number + 1
        }
        
        var myNumber = 1
        myNumber = oneMore(than: myNumber)
        print(myNumber)
        // Prints "2"
        
        //一个访问是 long-term 如果在它访问开始到访问结束之前其它代码可以运行, 叫做 overlap, 一个 long-term 访问可以和其它 long-term 访问或 instantaneous 访问 overlap
        //overlap 访问主要发生使用 in-out 参数的函数或方法的代码中, 或者结构体的 mutating 方法代码中
        
        //3. In-Out 参数的冲突访问
        //一个函数对于所有它的 in-out 参数是 long-term 访问, 对一个 in-out 参数的写访问在所有的非 in-out 参数被 evaluated 后开始, 并在函数调用期间一直持续.如果有多个 in-out 参数, 写访问的顺序按照参数的顺序
        //这种 long-term 的写访问的后果是你不能访问被传递做为 in-out 参数的原始变量, 即使 scoping rules 和 访问控制允许, 任何对原始变量的访问会造成冲突:
        
        var stepSize = 1
        func incrementInPlace(_ number: inout Int) {
//            number += stepSize 
        }
        incrementInPlace(&stepSize)
        // Error: conflicting accesses to stepSize
        
        //number += stepSize, 对 stepSize 是写
        //_ number: inout Int, 对 stepSize 是读
        //读写访问同一个内存地址, 并且 overlap, 所以发生冲突
        
        //解决办法之一是复制一个 stepSize
        var copyOfStepSize = stepSize
        incrementInPlace(&copyOfStepSize)
        
        // Update the original.
        stepSize = copyOfStepSize
        // stepSize is now 2
        //读访问在写访问开始之前结束, 不会发生冲突
        
        //对 in-out 参数 long-term 写访问的另一个后果是, 传递同一个变量给有多个 in-out 参数的函数, 会发生冲突
        func balance(_ x: inout Int, _ y: inout Int) {
            let sum = x + y
            x = sum / 2
            y = sum - x
        }
        var playerOneScore = 42
        var playerTwoScore = 30
        balance(&playerOneScore, &playerTwoScore)  // OK
//        balance(&playerOneScore, &playerOneScore)
        //对同一个内存同时进行读访问, 发生冲突
        
        //4. 方法中对 self 的冲突访问
        //一个struct 的 mutating 方法在方法调用期间可以对 self 进行写访问.
        struct Player {
            var name: String
            var health: Int
            var energy: Int
            
            static let maxHealth = 10
            mutating func restoreHealth() {
                health = Player.maxHealth
            }
        }
        // restoreHealth 方法对 self 的写访问在方法调用期间一直持续, 没有其它代码对 Player 实例的属性 overlap 访问, 下边的 shareHealth 方法, 用另一个 Player 实例作为 in-out参数, 提供了 overlap 访问的可能
//        extension Player {
//            mutating func shareHealth(with teammate: inout Player) {
//                balance(&teammate.health, &health)
//            }
//        }
//
//        var oscar = Player(name: "Oscar", health: 10, energy: 10)
//        var maria = Player(name: "Maria", health: 5, energy: 10)
//        oscar.shareHealth(with: &maria)  // OK: 对 Oscar, Maria 的读访问,访问 overlap 但是访问的内存地址不同
//        oscar.shareHealth(with: &oscar)  // Error: 对 Oscar 同时进行连个读访问
        
        // 5. 属性的冲突访问
        //struct, tuple, enum 等值类型是由个体元素组成, 例如结构体的属性, 元组的元素.因为它们是值类型, 对其中任何一个值的改变都会改变整个值, 意味着读写一个属性要读写整个值.例如对一个元组元素的 overlap 写访问会产生冲突:
        var playerInformation = (health: 10, energy: 20)
        balance(&playerInformation.health, &playerInformation.energy)
        // Error: conflicting access to properties of playerInformation
        //在函数调用期间, 元组两个元素作为 in-out 参数传入 balance 方法, 同时对整个元组进行写访问, 产生冲突
        
        //Holly 为全局变量
        var holly = Player(name: "Holly", health: 10, energy: 10)
        balance(&holly.health, &holly.energy)  // Error
        //Player 值类型, 同上类似
        
        //实际上, 大多数对 struct 的 overlap 访问是安全的.例如把上边的 holly 变量变为一个局部的变量
        func someFunction() {
            var oscar = Player(name: "Oscar", health: 10, energy: 10)
            balance(&oscar.health, &oscar.energy)  // OK
        }
        someFunction()

        //排他访问(exclusive access)是比 Memory safety 更严格的要求, Swift 允许这种 memory-safe 的代码, 如果编译器证明这类 nonexclusive access  是安全的.
        //特别地,如果下列条件满足, 编译器可以证明对一个 struct 属性的访问是安全的:
            //只访问了存储属性, 而没有访问计算属性或类型属性
            //struct 是一个局部变量, 不是全局变量
            //struct 没有被一个闭包捕获,或者被非逃逸闭包捕获
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

