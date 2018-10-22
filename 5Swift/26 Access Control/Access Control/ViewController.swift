//
//  ViewController.swift
//  Access Control
//
//  Created by admin on 2018/4/17.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //可以给类型, 属性, 方法, 构造器, 下标添加访问控制.协议, 全局常量,变量, 函数也可以限制范围, 下文统称 entity
        
        //1. Modules and Source Files
        //Swift 的访问控制基于 modules 和 source file 的概念
        //module 是一个代码分配单元, 可以被其它 module 导入.
        //source file 是 module 中的一个源代码文件
        
        //2. 访问级别
        //Swift 提供 Open, public, internal, file-private, private  5种不同的访问级别, 默认访问级别为 Internal
        //访问级别 Open 最高, private 最低
        //这些访问级别是相对于 entity 所在的 sourcefile, 也相对于 sourcefile 所属的 module

        //(1). Open 和 public 可以在 entity 定义的 module 的任一个 sourcefile 中访问, 也可以被其它 module 导入后访问,可以用 open 和 public 定义一个 framework 的公开接口
            //Open 和 public 的区别:
            //Open 只能用于 Class 和 Class 成员
            //public(internal, file-private, private) 修饰的 Class 只能在定义的 module 中被继承, 重写
            //Open 修饰的 Class 可以在定义的 module 和导入该 Class 的 module 中被继承, 重写
        
        //(2). Internal 只能在 entity 定义的 module 的 sourcefile 中访问, 不能被该 module 之外的 sourcefile 中访问,可以用 internal 定义一个 app 或 framework 的内部结构
        
        //(3). File-private 限定只能在定义的 sourcefile 中使用, 用来隐藏一些用于该文件的功能的实现
        
        //(4). Private 限定只能在该 entity 声明的范围内, 以及同一个文件的该 entity 声明的扩展中使用, 用来隐藏一些用于该声明的功能的实现
        
        //3. 访问级别的原则
        //高级别访问权限的 entity 不能定义比它级别低的类型.
        //例1: 一个 public 的变量, 不能有 internal, file-private, or private 级别的成员
        //例2: 一个函数的访问级别, 不能比它的参数和返回值的访问级别高
        
        //4. Frameworks
        //公开的接口可以用 Open 或 public. 公开接口即 framework 的 API
        
        //5. Tuple
        //Tuple 的访问级别由成员中级别最高的那个决定
        
        //6. Function
        //Function 的访问级别由参数, 返回值中级别最高的那个决定, 如果该级别不是 internal,要在定义中写明
        
        //7. Enumeration
        //每个 case 的访问级别和 Enumeration 相同, 不能给 case 添加访问控制
        //枚举中的 raw values 或 associated values 的访问级别不能比 Enumeration的 低
        
        //8. Nested Types
        //定义在 private(file-private, internal) 中的 Nested Types 级别为 private(file-private, internal)
        //定义在 public  中的 Nested Types 级别为 internal
        //想要 public 中的 Nested Types 级别为 public, 必须明确写出 public
        
        //9. Subclassing
        //子类的访问级别不能比父类高
        
        //10. Constants, Variables, Properties, and Subscripts
        //Constants, Variables, Properties 的访问级别不能比它们的类型的访问级别高, Subscripts 的访问级别不能比参数和返回值的访问级别高
        
        //11. Getters and Setters
        //可以给 setter 设置比 getter 更低的访问权限来限制读写范围, 在 var 或 subscript 之前加 fileprivate(set), private(set), internal(set)
        struct TrackedString {
            //限定只能在 struct 内部修改 numberOfEdits属性的值
            private(set) var numberOfEdits = 0
            var value: String = "" {
                didSet {
                    numberOfEdits += 1
                }
            }
        }
        var stringToEdit = TrackedString()
        stringToEdit.value = "This string will be tracked."
        stringToEdit.value += " This edit will increment numberOfEdits."
        stringToEdit.value += " So will this one."
        let numberOfEdit = stringToEdit.numberOfEdits
        print("The number of edits is \(stringToEdit.numberOfEdits)")
        // Prints "The number of edits is 3"
        
//        public struct TrackedString1 {
//            public private(set) var numberOfEdits = 0
//            public var value: String = "" {
//                didSet {
//                    numberOfEdits += 1
//                }
//            }
//            public init() {}
//        }
        //声明 struct 为 public, 则它的成员访问级别为 internal.
        //numberOfEdits 用 public private(set) 修饰, 表明 setter 方法访问级别为 public, setter 方法访问级别为 private
        
        //12. Initializers
        //Initializers 的访问级别不高于它们定义的类型, required initializers 类型除外, required initializers 的访问级别必须和它所属的类的访问级别一致
        
        //default initializer 没有参数, 它的访问级别和它初始化的类型的级别一致, 除非那个类是 public, 这时 default initializer  访问级别为 internal, 如果想要一个 public 的 initializer, 需要自己定义
        //default memberwise initializer for a structure type, 如果 struct 有一个存储属性为 private,file private, initializer 为  private,file private, 否则为 internal. 和 default initializer 相同, 如果想要一个 public 的 initializer, 需要自己定义
        
        //13. Protocols
        //在协议定义时指定它的访问级别, 不能给 protocol 的 requirement 设置不同的访问级别
        //定义一个继承自现有协议的新协议, 它的访问级别不能高于继承的协议
        //一个类型可以服从一个比它访问级别更低的协议
        
        //14. Extensions
        //扩展类型和原有类型的访问级别一致, 除了 public, 原有类型为 public, extension 中级别为 internal
        //可以给 extension 指定访问级别, 则其中的成员访问级别与此相同
        //使用 extension 服从协议时, 不能指定访问级别
        
        //15. Private Members in Extensions
        //在原始声明中声明一个 private 成员, 在同一文件的 extension 中访问
        //在 extension 中声明一个 private 成员, 在同一文件的另一个 extension 中访问
        //在 extension 中声明一个 private 成员, 在同一文件的原始声明中访问
//        protocol SomeProtocol {
//            func doSomething()
//        }
//
//        struct SomeStruct {
//            private var privateVariable = 12
//        }
//
//        extension SomeStruct: SomeProtocol {
//            func doSomething() {
//                print(privateVariable)
//            }
//        }

        //16. Generics
        //generic type 或 generic function的访问级别为自身中最小的
        
        //17. Type Aliases
        //不高于它 aliases 的类型
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
