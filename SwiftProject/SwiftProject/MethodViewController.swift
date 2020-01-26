//
//  MethodViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class MethodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "方法"
        self.view.backgroundColor = .white
        
        print("-------------------------")
        let counter = Counter()
        // the initial counter value is 0
        counter.increment()
        // the counter's value is now 1
        counter.increment(by: 5)
        // the counter's value is now 6
        counter.reset()
        // the counter's value is now 0
        print(counter)
        
        print("-------------------------")
        var somePoint = Point(x: 1.0, y: 1.0)
        somePoint.moveBy(x: 2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        // Prints "The point is now at (3.0, 4.0)"
        
        print("-------------------------")
        if somePoint.isToTheRightOf(x: 1.0) {
            print("This point is to the right of the line where x == 1.0")
        }
        // Prints "This point is to the right of the line where x == 1.0"
        
        print("-------------------------")
        var ovenLight = TriStateSwitch.low
        ovenLight.next()
        // ovenLight is now equal to .high
        ovenLight.next()
        // ovenLight is now equal to .off
        print(ovenLight)
        
        print("-------------------------")
        var player = Player(name: "Argyrios")
        player.complete(level: 1)
        print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        // Prints "highest unlocked level is now 2"
        
        print("-------------------------")
        player = Player(name: "Beto")
        if player.tracker.advance(to: 6) {
            print("player is now on level 6")
        } else {
            print("level 6 has not yet been unlocked")
        }
        // Prints "level 6 has not yet been unlocked"
    }
    
    
    // MARK: - Instance Methods -- 实例方法
    class Counter {
        var count = 0
        func increment() {
            count += 1
        }
        
        func increment(by amount: Int) {
            count += amount
        }
        
        func reset() {
            count = 0
        }
    }
    
    struct Point {
        var x = 0.0, y = 0.0
        func isToTheRightOf(x: Double) -> Bool {
            return self.x > x
        }
        //从实例方法中修改值类型
        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            x += deltaX
            y += deltaY
        }
    }
    
    //在变异方法中分配给自身
//    struct Point {
//        var x = 0.0, y = 0.0
//        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//            self = Point(x: x + deltaX, y: y + deltaY)
//        }
//    }

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
    
    
    // MARK: - Type Methods  -- 类型方法
    struct LevelTracker {
        static var highestUnlockedLevel = 1
        var currentLevel = 1

        static func unlock(_ level: Int) {
            if level > highestUnlockedLevel { highestUnlockedLevel = level }
        }

        static func isUnlocked(_ level: Int) -> Bool {
            return level <= highestUnlockedLevel
        }

        @discardableResult
        mutating func advance(to level: Int) -> Bool {
            if LevelTracker.isUnlocked(level) {
                currentLevel = level
                return true
            } else {
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
