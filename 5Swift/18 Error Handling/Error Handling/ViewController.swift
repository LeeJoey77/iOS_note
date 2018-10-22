//
//  ViewController.swift
//  Error Handling
//
//  Created by admin on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. 呈现和抛出错误
        //在 Swift 中, 错误的呈现使用服从 Error协议的类型的值
        //Swift 的 enum 适合用来封装一组相关的错误
        enum VendingMachineError: Error {
            case invalidSelection
            case insufficientFunds(coinsNeeded: Int)
            case outOfStock
        }
        
        //抛出错误
//        throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
        
        //2. 处理错误
        //Swift 中有四种方式处理错误:
        //1. 将错误从一个函数传播(propagate)到调用它的代码
        //2. 用 do-catch 语句
        //3. 将错误作为可选值
        //4. 断言错误不会发生
        //在会抛出错误的方法前加 try, try? , try!
        
        //3. 使用抛出函数传播(Propagating)错误
        
        struct Item {
            var price: Int
            var count: Int
        }
        
        class VendingMachine {
            var inventory = [
                "Candy Bar": Item(price: 12, count: 7),
                "Chips": Item(price: 10, count: 0),
                "Pretzels": Item(price: 7, count: 11)
            ]
            var coinsDeposited = 0
            
            func vend(itemNamed name: String) throws {
                guard let item = inventory[name] else {
                    throw VendingMachineError.invalidSelection
                }
                
                guard item.count > 0 else {
                    throw VendingMachineError.outOfStock
                }
                
                guard item.price <= coinsDeposited else {
                    throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
                }
                
                coinsDeposited -= item.price
                
                var newItem = item
                newItem.count -= 1
                inventory[name] = newItem
                
                print("Dispensing \(name)")
            }
        }
        
        //4. do-catch
        var vendingMachine = VendingMachine()
        vendingMachine.coinsDeposited = 8
        do {
            try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
            print("Success! Yum.")
        } catch VendingMachineError.invalidSelection {
            print("Invalid Selection.")
        } catch VendingMachineError.outOfStock {
            print("Out of Stock.")
        } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
            print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
        } catch {
            print("Unexpected error: \(error).")
        }
        // Prints "Insufficient funds. Please insert an additional 2 coins."
        
        //5. 错误转为可选值
        func someThrowingFunction() throws -> Int {
            // ...
        }
        
        let x = try? someThrowingFunction()
        
        let y: Int?
        do {
            y = try someThrowingFunction()
        } catch {
            y = nil
        }
        
        //6. 阻止错误传播
        //确定不会出错时,用 try!
        //加载应用内的图片不会出错
//        let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")

        //7. 特定清理行为
        func processFile(filename: String) throws {
            if exists(filename) {
                let file = open(filename)
                defer {
                    close(file)
                }
                while let line = try file.readline() {
                    // Work with the file.
                }
                // close(file) is called here, at the end of the scope.
            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

