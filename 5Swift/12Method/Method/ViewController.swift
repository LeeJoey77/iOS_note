//
//  ViewController.swift
//  Method
//
//  Created by admin on 2018/3/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    private var age = 10
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var BGView_Height: NSLayoutConstraint!
    
    var yellowView: UIView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class Counter1 {
        var count: Int = 0
        func increment() {
            count += 1
        }
        func incrementBy(by amount: Int) {
            count += amount
        }
        func reset() {
            count = 0
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yellowView = UIView(frame: childView.frame)
        bgView.addSubview(yellowView)
        
//        yellowView = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
//        view.addSubview(yellowView)

//        methodGrammar()
//        handleThrow()
//        authorityKeyword()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let originX = bgView.frame.origin.x
        let originY = bgView.frame.origin.y
        let width = bgView.frame.width
        let height = bgView.frame.height
        
        bgView.layoutIfNeeded()
        bgView.frame = CGRect(x: originX, y: originY, width: width, height: height + 110)
        bgView.layoutSubviews()
        childView.frame = CGRect(x: 0, y: 10, width: width, height: height + 100)
    
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: { [weak self] in
            if let strongSelf = self {
                strongSelf.bgView.setNeedsLayout()
//                strongSelf.bgView.frame = CGRect(x: originX, y: originY, width: width, height: height + 110)
//                strongSelf.bgView.setNeedsLayout()
//                strongSelf.yellowView.removeFromSuperview()
//                strongSelf.childView.frame = CGRect(x: 0, y: 10, width: width, height: height + 100)
            }
        })

//        let vc = TestViewController()
//        present(vc, animated: true, completion: nil)

    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        let originX = bgView.frame.origin.x
//        let originY = bgView.frame.origin.y
//        let width = bgView.frame.width
//        let height = bgView.frame.height
//        childView.frame = CGRect(x: 0, y: 10, width: width, height: height + 100)
//        print("")
//    }
    
    func methodGrammar() {
        //方法是和特定类型相关的函数, Swift 中 Class, struct, enum 都可以定义实例方法和类型方法
        //Class 的方法可以继承, struct, enum 方法不可以继承
        //struct, enum 是值类型, 属性默认不能修改, 要修改使用 mutating 关键字
        
        /*
         class 和 static 相同点:
         1.可以修饰方法
         2.可以修饰计算属性
         
         class 和 static 不同点:
         属性:
         class 不能修饰存储属性,static 可以修饰存储属性, static修饰的存储属性称为静态变量(常量)
         class 修饰的计算属性可以被重写,static 修饰的不能被重写
         class 修饰的计算属性被重写时,可以使用static 让其变为静态属性
         方法:
         class 只能在 Class 中使用,但是static 可以在 Class, struct, enum中使用
         class 修饰的方法可以被重写,static 修饰的不能被重写
         class 修饰的方法被重写时,可以使用static 让方法变为静态方法
         */
        
        //1. 实例方法
        class Counter {
            var count: Int = 0
            func increment() {
                count += 1
            }
            func incrementBy(by amount: Int) {
                count += amount
            }
            func reset() {
                count = 0
            }
        }
        
        //和调用属性一样，用点语法调用实例方法
        let counter = Counter()
        counter.increment()
        counter.incrementBy(by: 5)
        counter.reset()
        
        //2. self
        //上例 counter 中的已知 property 和 method 指向 self, self 可以省略不写
        //使用 self 的主要场景: 当实例方法的参数名和实例的 property 名字相同时, 使用 self 区分
        struct Point {
            var x = 0.0, y = 0.0
            func isToTheRightOf(x: Double) -> Bool {
                return self.x > x
            }
        }
        let somePoint = Point(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOf(x: 1.0) {
            print("This point is to the right of the line where x == 1.0")
        }
        
        //3. 修改实例方法中的值类型(struct, enum)
        //struct 和 enum 是值类型的, 值类型的实例方法中默认 property 不能修改
        //如果想要修改 struct, enum 的属性, 可以使用关键字 mutating
        struct AnotherPoint {
            var x = 0.0, y = 0.0
            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
                x += deltaX
                y += deltaY
            }
        }
        var anotherPoint = AnotherPoint(x: 1.0, y: 2.0)
        anotherPoint.moveBy(x: 2.0, y: 3.0)
        
        //注意: 不能调用常量结构体类型的 mutating 方法, 即使要改变的 property 是 var 类型的
        
        //4. 在 mutating 方法内给 self 赋值
        //mutating 方法可以将实例赋给 self
        struct yetAnotherPoint {
            var x = 0.0, y = 0.0
            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
                self = yetAnotherPoint(x: x + deltaX, y: y + deltaY)
            }
        }
        
        //枚举的变异方法可以让 self 从相同的枚举设置为不同的成员
        enum TriStateSwitch {
            case off, low, high
            mutating func next() {
                switch self {
                case .off:
                    self = .low
                case .low:
                    self = .high
                case .high:
                    self = .off
                }
            }
        }
        var ovenLight = TriStateSwitch.low
        ovenLight.next()
        //self = high
        ovenLight.next()
        //self = off
        
        //5. 类型方法(Type Methods)
        //Class, struct, enum 都有类型方法
        //使用关键字 static 表明类型方法
        //static 修饰 Class 中定义的类型方法, 则子类对应的类型方法不可重写
        //class 修饰 Class 中定义的类型方法, 子类对应的类型方法可以重写
        
        class SomeClass {
            //类型方法
            class func someTypeMethod() {
                //1. type method 中, self 表示类.使用 self的场景和 Instance Methods类似
                
                //2. type method 中, 可以使用调用另一个 type method
                var light = TriStateSwitch.low
                light.next()
            }
        }
        
        class AClass: SomeClass {
            override class func someTypeMethod() {
                print("adfafaf")
            }
        }
        SomeClass.someTypeMethod()
        
        struct LevelTracker {
            static var highestUnlockedLevel = 1
            var currentLevel = 1
            //类型方法
            static func unlock(_ level: Int) {
                if level > highestUnlockedLevel { highestUnlockedLevel = level }
            }
            //类型方法
            static func isUnlocked(_ level: Int) -> Bool {
                return level <= highestUnlockedLevel
            }
            //@discardableResult 结果可忽略, 添加后不使用返回值不会有警告
            //实例方法
            @discardableResult mutating func advance(to level: Int) -> Bool {
                if LevelTracker.isUnlocked(level) {
                    currentLevel = level
                    return true
                }else {
                    return false
                }
            }
        }
        
        class Player {
            var tracker = LevelTracker()
            let playerName: String
            func complete(level: Int) {
                LevelTracker.unlock(level + 1)
                tracker.advance(to: level + 1)
            }
            init(name: String) {
                playerName = name
            }
        }
        
        //完成第一级
        var player = Player(name: "Argyrios")
        player.complete(level: 1)
        print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        // Prints "highest unlocked level is now 2"
        
        //试图进入没有解锁的等级
        player = Player(name: "Beto")
        if player.tracker.advance(to: 6) {
            print("player is now on level 6")
        } else {
            print("level 6 has not yet been unlocked")
        }
        // Prints "level 6 has not yet been unlocked"
    }
    
    
    func handleThrow() {
        //如果在调用系统某一方法时 ,该方法最后有一个throws. 说明该方法会抛出异常,如果一个方法会抛出异常,那么需要对异常进行处理
        //在Swift中提供三种处理异常方式
        //方式一: try方式  程序员手动捕捉异常
        do {
            try FileManager.default.contentsOfDirectory(atPath: NSHomeDirectory())
        }catch{
            //error异常对象
            print(error)
        }
        
        //方式二: try?方式  系统帮助我们处理异常 ,如果该方法出现了异常, 则方法返回nil ,如果没有异常,则返回对应的对象
        //推荐方式
        //安全校验
        guard let content = try? FileManager.default.contentsOfDirectory(atPath: NSHomeDirectory()) else{
            return
        }
        
        //方式三 : try!方式  直接告诉系统,该方法没有异常,如果该方法出现了错误,直接崩溃
        let content1 = try! FileManager.default.contentsOfDirectory(atPath: NSHomeDirectory())
    }
    
    
    func authorityKeyword() {
        //1. private
        //只允许在当前类中调用，不包括 Extension,用 private 修饰的方法不可以被代码域之外的地方访问
        priadfv()
        //2. fileprivate
        //其修饰的属性或者方法只能在当前的 Swift 源文件里可以访问, Extension 写在同一个文件中才能访问
        
        //3. internal
        //
        
        //4. public
        //修饰的属性或者方法可以在其他作用域被访问
        //但不能在重载 override 中被访问
        //也不能在继承方法中的 Extension 中被访问
        
        //5. open
        //修饰的属性或者方法可以在其他作用域被访问
        //修饰的属性或者方法可以在其他作用域被继承或重载 override
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func priv() {
        self.asdf()
    }
}


extension ViewController {
    private func asdf() {
    }
}





