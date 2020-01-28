//
//  TypeCastingViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class TypeCastingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "型铸"
        self.view.backgroundColor = .white
        
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        print(library)
        // the type of "library" is inferred to be [MediaItem]
        print("----------------------------")
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
        
        print("----------------------------")
        //Downcasting 下垂
        for item in library {
            if let movie = item as? Movie {
                print("Movie: \(movie.name), dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: \(song.name), by \(song.artist)")
            }
        }
        // Movie: Casablanca, dir. Michael Curtiz
        // Song: Blue Suede Shoes, by Elvis Presley
        // Movie: Citizen Kane, dir. Orson Welles
        // Song: The One And Only, by Chesney Hawkes
        // Song: Never Gonna Give You Up, by Rick Astley
        
        //类型转换为Any和AnyObject
        print("----------------------------")
        var things = [Any]()
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.121415926)
        things.append("Hello")
        things.append((3.0, 5.0))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        things.append({(name: String) -> String in "Hello, \(name)"})
        print(things)
        
        print("----------------------------")
        
        for thing in things {
            switch thing {
            case 0 as Int:
                print("zero as an Int")
            case 0 as Double:
                print("zero as an Double")
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
        }
        
        // zero as an Int
        // zero as a Double
        // an integer value of 42
        // a positive double value of 3.14159
        // a string value of "hello"
        // an (x, y) point at 3.0, 5.0
        // a movie called Ghostbusters, dir. Ivan Reitman
        // Hello, Michael
        
        let optionalNumber: Int? = 3
        things.append(optionalNumber) // Warning
        things.append(optionalNumber as Any) // No warning
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Defining a Class Hierarchy for Type Casting -- 定义类型转换的类层次结构
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
