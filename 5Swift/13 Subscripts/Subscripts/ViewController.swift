//
//  ViewController.swift
//  Subscripts
//
//  Created by admin on 2018/3/9.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //下标(Subscripts)
        //Class, struct, enum 都可以定义下标
        //1. 下标语法
        //下标语法和实例方法以及计算属性类似, 使用关键字 subscript, 可以指定参数和返回值.
        //不像实例方法, 下标可以是读写, 只读的, 类似于计算属性
        class Person {
            var name: String = "mm"
            var age: Int = 25
            subscript(index: Int) -> Int {
                get {
                    return 1
                }
                set(newValue) {
                    
                }
            }
        }
        
        //newValue 的类型和返回值的类型一致, 和计算属性一样可以不指定 setter 方法的参数, 使用默认的 newValue
        //当下标为只读时, 和计算属性一样, 可以简写去掉关键字 get 和大括号
        struct TimesTable {
            let multiplier: Int
            subscript(index: Int) -> Int {
                return multiplier * index
            }
        }
        let threeTimesTable = TimesTable(multiplier: 3)
        print("six times three is \(threeTimesTable[6])")
        // Prints "six times three is 18"
        
        //2. 下标的使用
        var numberOfLegs = ["sipder": 6, "ant": 8, "cat": 4]
        numberOfLegs["bird"] = 2
        
        //3. 下标选项
        //下标可以有多个参数, 参数, 返回值可以是任意类型.参数可以是可变数量参数, 不能是 in-out 参数, 不能提供默认值
        struct Matrix {
            let rows: Int, columns: Int
            var grid: [Double]
            init(rows: Int, columns: Int) {
                self.rows = rows
                self.columns = columns
                grid = Array(repeating: 0.0, count: rows * columns)
            }
            func indexIsValid(row: Int, column: Int) -> Bool {
                return row >= 0 && row < rows && column >= 0 && column < columns
            }
            subscript(row: Int, column: Int) -> Double {
                get {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    return grid[(row * columns) + column]
                }
                set {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    grid[(row * columns) + column] = newValue
                }
            }
        }
        
        var matrix = Matrix(rows: 2, columns: 2)
        print(matrix[1, 1])
        //输出 matrix : grid = [0.0, 0.0, 0.0, 0.0]
        matrix[0, 1] = 1.5
        matrix[1, 0] = 3.2
        //输出 matrix : grid = [0.0, 1.5, 3.2, 0.0]
        
        //index 超出范围触发断言
//        _ = matrix[2, 2]
        // this triggers an assert, because [2, 2] is outside of the matrix bounds
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

