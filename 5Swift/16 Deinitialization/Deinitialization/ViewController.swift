//
//  ViewController.swift
//  Deinitialization
//
//  Created by admin on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    class Bank {
        //类型属性
        static var coinsInBank = 10_000
        //类型方法
        static func distribute(coins numberOfCoinsRequested: Int) -> Int {
            let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
            coinsInBank -= numberOfCoinsToVend
            return numberOfCoinsToVend
        }
        //类型方法
        static func receive(coins: Int) {
            coinsInBank += coins
        }
    }
    
    class Player {
        var coinsInPurse: Int
        init(coins: Int) {
            coinsInPurse = Bank.distribute(coins: coins)
        }
        func win(coins: Int) {
            coinsInPurse += Bank.distribute(coins: coins)
        }
        deinit {
            Bank.receive(coins: coinsInPurse)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Deinitialization
        //关键字 deinit, 只有 Class 有 deinit, 在 dealloc 前调用
        //Swift 使用 ARC 自动管理内存
        //需要在 deinit 中手动处理的: 文件关闭, 对象销毁, KVO移除, 通知移除, NSTimer销毁
        
        //每个 Class 只能有一个 deinit, 没有参数
        //不能主动调用, 子类继承父类的 deinit 函数, 父类 deinit 函数在子类 deinit 函数调用结束后调用, 父类deinit 函数总是会被调用,即使子类的没有调用
        
        var playerOne: Player? = Player(coins: 100)
        print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
        print("There are now \(Bank.coinsInBank) coins left in the bank")
        
        playerOne!.win(coins: 2_000)
        print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
        print("The bank now only has \(Bank.coinsInBank) coins left")
        
        //对象置为 nil 就会调用 Player 类中的 deinit 方法
        playerOne = nil
        print("PlayerOne has left the game")
        print("The bank now has \(Bank.coinsInBank) coins")
        
    }

    deinit {
        print("~~~~~~~~")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

