//
//  ViewController.swift
//  Inheritance
//
//  Created by admin on 2018/3/13.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Swift 中的 Class 可以继承父类的方法, 属性和其它特征.继承是 Class 区别于其它类型的一个主要特点
        //1. 定义一个基类(Base Class)
        //没有父类的类称为基类
        class Vehicle {
            var currentSpeed = 0.0
        
            var description: String {
                return "traveling at \(currentSpeed) miles per hour"
            }
            func makeNoise() {
                //do nothing
            }
        }
        let someVehicle = Vehicle()
        print("Vehicle: \(someVehicle.description)")
        
        //2. 子类化(Subclassing)
        //继承使用冒号 (:)
        class Bicycle: Vehicle {
            var hasBasket = false
        }
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        print("Bicycle: \(bicycle.description)")
        
        //3. 重写(Overriding)
        //在要重写的方法前加关键字 override, 编译器会对父类方法进行检查, 确保匹配
        
        //4. 获取父类方法, 属性, 下标
        
        //5. 重写方法
        //子类可以继承父类的类型方法或实例方法
        class Train: Vehicle {
            override func makeNoise() {
                print("Choo Choo")
            }
        }
        let train = Train()
        train.makeNoise()
        
        //6. 重写属性
        //子类可以继承父类的实例属性, 或者类型属性, 可以给属性自定义 getter, setter 方法, 或者给属性添加观察者
        //(1) 重写属性的 getter 和 setter 方法
        //继承的属性是存储属性还是计算属性对子类是不可知的, 因此可以自定义 getter和 setter 方法.子类继承属性时只继承属性名和类型, 编译器检查时只检查属性名和类型.
        //可以将继承的 read-only 属性改为 read-write 属性, 但是不能将继承的 read-write 属性改为 read-only 属性
        //如果重写 setter 方法, 则 getter 方法也要改写.如果在重写 getter 方法中不想修改属性值, 可以通过返回 super.someProperty 传递继承的值
        class Car: Vehicle {
            var gear = 1
            override var description: String {
                return super.description + " in gear \(gear)"
            }
        }
        let car = Car()
        car.currentSpeed = 25.0
        car.gear = 3
        print("Car: \(car.description)")
        
        //(2) 重写属性观察者
        //不能给继承的常量存储属性和只读计算属性添加属性观察者, 因为它们的不能被设置
        //不能给继承的属性同时提供 setter 方法和属性观察者, 对于重写 setter 方法的属性, 如果想观察一个它的值的变化,可以在 setter 方法内部观察
        class AutomaticCar: Car {
            override var currentSpeed: Double {
                didSet {
                    gear = Int(currentSpeed / 10.0) + 1
                }
            }
        }
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        print("AutomaticCar: \(automatic.description)")
        
        //6. 防止重写
        //可以将方法, 属性, 下标标记为 final, 防止它们的重写(such as final var, final func, final class func, and final subscript).
        //扩展里添加的方法, 属性, 下标也可以添加 final 防止重写
        //可以讲一个类标记为 final 防止继承
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

