//
//  ViewController.swift
//  Optional Chaining
//
//  Created by admin on 2018/3/26.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //可选链
        //可选链是访问或调用可选类型的属性, 方法, 下标的过程, 如果可选类型有值则调用成功, 否则返回 nil.
        //多个访问可以链接在一起, 其中一个访问失败,则整个链表失败.
        
        //1. 可选链作为另一种强制解包的方式
        //表达形式: 在可选值后加 "?"
        //可选链和强制解包的区别: 可选链值为 nil 失败, 但是不会引起崩溃.
        //可选链的返回值总是为可选类型, 即使调用属性, 方法, 下标的返回值为非可选类型, 返回值类型是相应的可选类型

        class Person {
            var residence: Residence?
            var name: String?
        }
        class Residence {
            var numberOfRooms = 1
        }
        let john = Person()
        
        //直接强制解包会报错
//        let roomCount = john.residence!.numberOfRooms
        //使用可选链, 在可选值后加 "?"
        let roomCount = john.residence?.numberOfRooms
        
        //residence 没有初始化, 默认为 nil
        if let roomNum = john.residence?.numberOfRooms {
            print("John's residence has \(roomNum) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // Prints "Unable to retrieve the number of rooms."

        //给 john.residence 赋一个实例对象, 它的值不再为 nil
        john.residence = Residence()
        //numberOfRooms 为非可选 Int 型, 但是在可选链中仍然返回可选类型
        if let roomNum1 = john.residence?.numberOfRooms {
            print("John's residence has \(roomNum1) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // Prints "John's residence has 1 room(s)."

        //2. 为可选链定义 Model 类
        //可以使用可选链, 访问复杂 Model的多个层级的属性, 方法, 下标
        class PersonClass {
            var residence: ResidenceClass?
        }
        class ResidenceClass {
            var rooms = [Room]()
            var numberOfRooms: Int {
                return rooms.count
            }
            subscript(i: Int) -> Room {
                get {
                    return rooms[i]
                }
                set {
                    rooms[i] = newValue
                }
            }
            func printNumberOfRooms() {
                print("The number of room is \(numberOfRooms)")
            }
            var address: Address?
        }
        class Room {
            let name: String
            init(name: String) { self.name = name }
        }
        class Address {
            var buildingName: String?
            var buildingNumber: String?
            var street: String?
            func buildingIdentifier() -> String? {
                if let buildingNumber = buildingNumber, let street = street {
                    return "\(buildingNumber) \(street)"
                } else if buildingName != nil {
                    return buildingName
                } else {
                    return nil
                }
            }
        }
    
        //3. 通过可选链访问属性
        //通过可选链获取属性
        let johnSon = PersonClass()
        if let roomCount = johnSon.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // Prints "Unable to retrieve the number of rooms."
        
        //通过可选链设置属性
        //因为 john.residence 为 nil 赋值失败, 等号右边没有被调用
        func createAddress() -> Address {
            print("Function was called.")
            
            let someAddress = Address()
            someAddress.buildingNumber = "29"
            someAddress.street = "Acacia Road"
            
            return someAddress
        }
        johnSon.residence?.address = createAddress()
        
        //4. 通过可选链调用方法
        //可以用可选链调用一个函数,并检查是否调用成功,即使函数没有返回值
//        func printNumberOfRooms() {
//            print("The number of rooms is \(numberOfRooms)")
//        }
        //用可选链调用函数时, 返回值是可选类型(void 会变为 void?) , 可以使用if 语句判断是否可以调用printNumberOfRooms() 方法
        if johnSon.residence?.printNumberOfRooms() != nil {
            print("It was possible to print the number of rooms.")
        } else {
            print("It was not possible to print the number of rooms.")
        }
        // Prints "It was not possible to print the number of rooms."
        
//        if (johnSon.residence?.address = someAddress) != nil {
//            print("It was possible to set the address.")
//        } else {
//            print("It was not possible to set the address.")
//        }
        // Prints "It was not possible to set the address."

        //5. 通过可选链获取下标
        //可以使用可选链获取设置一个可选值的下标, 并检查下标调用是否成功
        //用可选链获取下标, ? 放在括号前
        if let firstRoomName = johnSon.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        // Prints "Unable to retrieve the first room name."
        
        //6. 获取可选类型的下标
        //如果一个下标返回可选类型的值就像字典那样, 在闭括号后加 ?
        var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
        // the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
        
        //7. 连接多个层级的可选链
        //用可选链获取一个值, 如果这个值是非可选的, 返回值会变为可选
        if let johnsStreet = johnSon.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        // Prints "Unable to retrieve the address."
        //john.residence.address 为 nil 调用失败
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        johnSon.residence?.address = johnsAddress
        
        if let johnsStreet = johnSon.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        // Prints "John's street name is Laurel Street."
        
        //8. 返回值为可选类型的 chain
        //可选链的调用函数的返回值也是可选类型
        if let buildingIdentifier = johnSon.residence?.address?.buildingIdentifier() {
            print("John's building identifier is \(buildingIdentifier).")
        }
        // Prints "John's building identifier is The Larches."
        
        //如果想进一步对返回值使用可选链, 可以在方法的双括号后添加 ?
        if let beginsWithThe =
            johnSon.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
            if beginsWithThe {
                print("John's building identifier begins with \"The\".")
            } else {
                print("John's building identifier does not begin with \"The\".")
            }
        }
        // Prints "John's building identifier begins with "The"."

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

