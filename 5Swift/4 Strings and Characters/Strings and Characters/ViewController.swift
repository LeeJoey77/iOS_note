//
//  ViewController.swift
//  Strings and Characters
//
//  Created by admin on 2018/1/26.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //一. 字符串(Strings)和字符(Characters)
        //Swift中导入Foundation框架可以使用NSString 的方法
        //1. 单行String, 用双引号
        let someString = "Some string literal value"
        
        //2. 多行String, 三个双引号.每行语句后有换行符，不换行用 \，空换行用空白行
        //结束符缩进不能多于内容，否则会报错。和结束符缩进相同的字符串，前边的空格自动忽略，比结束符缩进多的字符串前边的空格会显示
        let quotation = """

        The White Rabbit put on his spectacles.  "Where shall I begin, \
            please your Majesty?" he asked.
             
        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."

        """
        print(quotation)
        
        //3. 字符串中的特殊字符
        //字符串可以包含的特殊字符：\0(null), \\, \t(水平制表符), \n, \r, \", \'.  统一码Unicode，写作 "\u{n}"，n是1-8位的十六进制数， 返回值对应一个合法的UIcode码字符
        let wiseWords = "\"Imagination is more important than knowledge\" - Einstein" //包含双引号
        let dollarSign = "\u{24}"; print(dollarSign)  //输出美元字符
        let blackHeart = "\u{2665}"; print(blackHeart) //黑桃心
        let sparklingHeart = "\u{1F496}"; print(sparklingHeart)
        
        //多行字符串中可以直接使用双引号，使用三引号时，至少用一个 \ 将三引号隔开，如下
        let threeDoubleQuotationMarks = """
        Escaping the first quotation mark \"""
        Escaping all three quotation marks \"\"\"
        """
        print(threeDoubleQuotationMarks)
        
        //4. 字符串初始化
        //(1) 用空字符串赋值
        var emptyString = ""
        //(2)用语法赋值
        var anothEmptyString = String()
        
        //判断是否为空，使用isEmpty属性
        if emptyString.isEmpty {
            print("Nothing to see here")
        }
        //可变字符串用 var， 不可变字符串用let
        var variableString = "Horse"
        variableString += " and carriage" //variableString is now "Horse and carriage"
        
        let constantString = "Highlander"
        //constantString += " and another Highlander"  // this reports a compile-time error - a constant string cannot be modified
        
        //Strings 是值类型Value Types
        //创建一个新字符串后，当它被传给函数或者赋值给常量变量，String的值都会被拷贝一份。保证了字符串在传递过程中不会被修改
        
        
        //5. 字符(Characters)
        //(1) 创建字符，用type标注类型
        let exclamationMark: Character = "!"
        
        //(2) 遍历字符串获取字符串的每一个字符
        for character in "Dog!" {
            print(character)
        }
        // D
        // o
        // g
        // !
        
        //(3) 可以用字符串数组为字符串赋值
        let catCharacters: [Character] = ["C", "a", "t", "!"]
        let catString = String(catCharacters); print(catString) // print "Cat!"
        
        //6. 字符串和字符的连接
        //字符串可以拼接字符，字符后不能拼接字符或字符串，因为字符只能有一个字符
        //(1) 用 +
        let string1 = "hello"
        let string2 = "there"
        var welcome = string1 + string2
        
        //(2) 用 +=
        var instruction = "look over"
        instruction += string2
        
        //(3) 字符串拼接字符，使用String的 append() 方法
        welcome.append(exclamationMark)
        
        //(4) 拼接两个多行字符串，想要每行都换行，多行字符串最后一行为空
        let goodStart = """
        one
        two

        """
        let end = """
        three
        """
        print(goodStart + end)
        // one
        // two
        // three
        
        //7. 字符串插入(String Interpolation)
        //插入字符串用 \()
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)" // multiplier 是Int 类型， 2.5 是Double类型，* 不能用于两种类型相乘
        
        
        //二. 延展字母簇(Extended Grapheme Clusters)
        //Swift用延展字母簇(Extended Grapheme Clusters)表示字符的值, 一个字符可以用一个或多个多个Unicode 码表示, 每个Unicode 码都是一个唯一的21字节的数字，用来表示一个字符或表情。例如 U+0061 表示字母 a, U+1F425 表示正面朝前的小鸡符号 🐥
        //Unicode标准提供了算法去定义grapheme cluster boundaries，其中包括两种变种：legacy grapheme clusters and extended grapheme clusters
        
        let precomposed: Character = "\u{D55C}"                  // 한
        let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
        
        //1. 获取字符串的字符个数
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.count) characters") //unusualMenagerie has 40 characters
        //因为Swift用延展字母簇表示字符的值，所以当拼接或者修改字符串时，字符的数量不一定发生改变
        var word = "cafe"
        print("the number of characters in \(word) is \(word.count)") //the number of characters in cafe is 4
        word += "\u{301}"  //添加重音符"  ́ "
        print("the number of characters in \(word) is \(word.count)") //the number of characters in café is 4
        
        //2. 子字符串(Substrings)
        //从 String 获得的 Substring 是 Substring 类型的实例变量, 不是String
        //Substrings 和 String 的异同
        //(1) 都服从 StringProtocol 协议,方法都相同
        //(2) 当对 String进行一个短期的 action 时,使用 Substings, 只要 String 的一个 Substrings 在被使用 String 就会一直保存在内存中
        //(3) 想要长期存储 Substrings 时,需要转换为 String
        //(4) Substrings 重用了 String 或者其它 Substrings 的内存
        
        let greetWord = "hello, world!"
        let index = greetWord.index(of: ",") ?? greetWord.endIndex
        //子字符串 beginning 重用了 greeting 中 hello 字符串的内存
        let beginning = greetWord[..<index]  //begining is "hello"
        //将 Substrings 转化为 String 后, newString 有了自己新的内存空间
        let newString = String(beginning) //
        
        //3. 字符串的比较
        //同一个字符: 有相同的外表appearance和语义linguistic meaning
        //Swift 中有三种方式比较字符串的值: string and character equality, prefix equality, and suffix equality
        //字符串和字符的相等: == 或 !=
        
        //(1) 两种形式的延展字形簇表示相同的字符 é,所以两者相同
        let eAcuteQuestion = "Voulez-vous un caf\u{E9}?" //Voulez-vous un café?
        let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
        if eAcuteQuestion == combinedEAcuteQuestion {
            print("These two strings are considered equal")
        }
        
        //(2) 字符的比较
        //俄罗斯字母 A, 和英语字母 A, 外形相同但是语义不同,不是同一个字符
        let latinCapitalLetterA: Character = "\u{41}"
        let cyrillicCapitalLetterA: Character = "\u{0410}"
        if latinCapitalLetterA != cyrillicCapitalLetterA {
            print("These two characters are not equivalent.")
        }
        
        //(3) 前缀 Prefix 和 后缀 Sufix 的比较,比价规则同上
        //hasPrefix(_:),  hasSuffix(_:)
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        //计算 Act 1 中有几个 Scene
        var act1SceneCount = 0
        for str in romeoAndJuliet {
            if str.hasPrefix("Act 1") {
                act1SceneCount += 1
            }
        }
        print(act1SceneCount)  //5
        
        var mansionCount = 0
        var cellCount = 0
        for str in romeoAndJuliet {
            if str.hasSuffix("Capulet's mansion") {
                mansionCount += 1
            }else if str.hasSuffix("Lawrence's cell") {
                cellCount += 1
            }
        }
        print("\(mansionCount) mansion scenes; \(cellCount) cell scenes") //6 mansion scenes; 2 cell scenes
        
        
        //三. 字符串的遍历
        /*
          Swift中不同字符，同一字符的不同表达形式所占内存不同
          Swift采用21字节的Unicode延展字符簇表示字符，OC采用16字节的UTF-16表示，所以相同字符串在Swift和OC中字符的个数不一样
          获取和修改字符串，因为每个字符所占的内存大小不同，所以要确定每个字符的位置必须遍历开始到结束的每个Unicode scalar。
        */
        
        //1. Swift 中字符串, 集合的Index 属性不是 Integer 类型
        //以下方法对String, Array, Dictionary, Set都适用, 获取的都是字符对应的位置, 不是字符
        //(1) startIndex：字符串中第一个字符的位置
        //(2) endIndex：字符串中最后一个字符的后一位，所以endIndex不是valid,可以访问endIndex,但是不能访问endIndex对应的值,如   果字符串为空, startIndex = endIndex
        //(3) 获取给定下标的前一位的指数用 index(before:)
        //(4) 获取给定下标的后一位的指数用 index(after:)
        //(5) 获取给定下标前(后)某几位的指数用 index(_:offsetBy:)
        
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex] //G
        greeting[greeting.index(before: greeting.endIndex)] //!
        greeting[greeting.index(after: greeting.startIndex)] //u
        let indexOf = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[indexOf] //a
        //获取超出字符串的index值,或者超出字符串index值对应的字符会报错
        //        greeting[greeting.endIndex] //Error
        //        greeting.index(after: greeting.endIndex) //Error
        
        //2. 遍历字符串中的每一个字符
        //用指数(indices)属性
        for index in greeting.indices    {
            print("\(greeting[index])", separator: "@", terminator: "-")
            //            print("\(greeting[index])")
        }
        
        //3. 插入
        //插在该位置对应原有字符的前边,endIndex 顺次后移
        //(1) 插入字符 insert(_:at:)
        var welcome1 = "hello"
        welcome1.insert("!", at: welcome1.endIndex) //hello!
        print(welcome1[welcome1.startIndex])  //h
        
        //(2) 插入字符串 insert(contentsOf:at:)
        welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))
        print(welcome1) //hello there!
        
        //4. 删除
        //(1) 删除字符 remove(at:)
        welcome1.remove(at: welcome1.index(before: welcome1.endIndex)) //hello there
        
        //(2) 删除字符串 removeSubrange(_:)
        let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome1.endIndex
        welcome1.removeSubrange(range)
        print(welcome1, welcome1.endIndex) //hello
        
        
        //四. UTF(Unicode Transformation Format
        //Unicode是编码的字符集，而UTF-8、UTF-16、UTF-32是把字符对应的 Unicode 码转化为相应格式存储.
        //例如: UTF8 == Unicode Transformation Format -- 8 bit
        //是Unicode传送格式。即把Unicode文件转换成BYTE的传送流。
       
        let dogString = "Dog!!🐶"
        //1. UTF-8, 获取一个 String 的 UTF-8 表现形式通过字符串的utf8 属性,这一属性是 String.UTF8View 类型的,它是一个unsigned 8-bit (UInt8) values的集合
        for codeUnit in dogString.utf8 {
            print("\(codeUnit) ", separator: "", terminator: "")
        } //68 111 103 33 33 240 159 144 182
        //(68, 111, 103)每个字节分别表示 D, o, g, UTF-8字母的编码值和ASCII码编码值相同, (226, 128, 188)三个字节表示 !!, (240, 159, 144, 182)最后四个字节表示🐶
        
        //2. UTF-16, 获取一个 String 的 UTF-16 表现形式通过字符串的utf16 属性,这一属性是 String.UTF16View 类型的,它是一个unsigned 16-bit (UInt16) values的集合
        for codeUnit in dogString.utf16 {
            print("\(codeUnit) ", terminator: "")
        } //68 111 103 8252 55357 56374
        //(68, 111, 103)每个字节分别表示 D, o, g, 和UTF-8 相同,和 ASCII 码相同, 8252 表示 !!, 最后两个编码表示🐶
        
        //3. UTF-32, Unicode的UTF-32编码就是其对应的32位无符号整数
        //Unicode Scalar, 获取一个String value的Unicode Scalars表现形式通过字符串的 unicodeScalars 属性, 这一属性是 UnicodeScalarView 类型的, 它是values of type UnicodeScalar的集合, 每个UnicodeScalar 有一个 value 属性,返回21-bit value
        for scalar in dogString.unicodeScalars {
            print("\(scalar.value) ", terminator: "")
        }//68 111 103 8252 128054
        //每个编码值对应一个字符
        
        for scalar in dogString.unicodeScalars {
            print("\(scalar) ")
        }
        print("\u{1F436}")
        // D
        // o
        // g
        // ‼
        // 🐶
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

