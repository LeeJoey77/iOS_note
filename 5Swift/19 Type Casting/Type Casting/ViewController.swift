//
//  ViewController.swift
//  Type Casting
//
//  Created by admin on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //类型转换运算符: is, as
        //可以用类型转换检查实例类型, 或者一个类型是否服从协议
        
        class MediaItem {
            var name: String
            init(name: String) {
                self.name = name
            }
        }
        
        class Movie: MediaItem {
            var director: String
            init(name: String, director: String) {
                self.director = director
                super.init(name: name)
            }
        }
        
        class Song: MediaItem {
            var artist: String
            init(name: String, artist: String) {
                self.artist = artist
                super.init(name: name)
            }
        }
        //数组中有 Movie Class 类型,也有 Song Class 类型, 都继承自MediaItem, 编译器推断为 MediaItem类型
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        // the type of "library" is inferred to be [MediaItem]
        
        //1. 检查类型
        var movieCount = 0
        var songCount = 0
        
        for item in library {
            if item is Movie {
                movieCount += 1
            } else if item is Song {
                songCount += 1
            }
        }
        
        print("Media library contains \(movieCount) movies and \(songCount) songs")
        // Prints "Media library contains 2 movies and 3 songs"
        
        //2. 向下类型转换(Downcasting)
        //一个 Class 类型的常量或变量, 可能指向子类的实例. 这种情况下可以使用 as? 或 as! 进行向下类型转换
        for item in library {
            if let movie = item as? Movie {
                print("Movie: \(movie.name), dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: \(song.name), by \(song.artist)")
            }
        }

        //3. Any 和 AnyObject 的类型转换
        //Any 可以代表任何类型的实例,class, struct, enum, 基本类型, closure 以及函数类型
        //AnyObject 可以代表任何 Class 类型的实例
        //能确定类型的时候,要尽量写具体类型
        
        var things = [Any]()
        
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        things.append({ (name: String) -> String in "Hello, \(name)" })
        
        for thing in things {
            switch thing {
            case 0 as Int:
                print("zero as an Int")
            case 0 as Double:
                print("zero as a Double")
            case let someInt as Int:
                print("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("a positive double value of \(someDouble)")
            case is Double:
                print("some other double value that I don't want to print")
            case let someString as String:
                print("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                print("an (x, y) point at \(x), \(y)")
            case let movie as Movie:
                print("a movie called \(movie.name), dir. \(movie.director)")
            case let stringConverter as (String) -> String:
                print(stringConverter("Michael"))
            default:
                print("something else")
            }
            
            let optionalNumber: Int? = 3
            things.append(optionalNumber)        // Warning
            things.append(optionalNumber as Any) // No warning
        }
        
        // zero as an Int
        // zero as a Double
        // an integer value of 42
        // a positive double value of 3.14159
        // a string value of "hello"
        // an (x, y) point at 3.0, 5.0
        // a movie called Ghostbusters, dir. Ivan Reitman
        // Hello, Michael
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

