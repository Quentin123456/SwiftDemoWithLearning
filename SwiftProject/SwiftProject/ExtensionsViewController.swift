//
//  ExtensionsViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class ExtensionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "扩展"
        self.view.backgroundColor = .white
        
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        // Prints "One inch is 0.0254 meters"
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
        // Prints "Three feet is 0.914399970739201 meters"
        
        print("----------------------------")
        let aMarathon = 42.km + 195.m
        print("A marathon is \(aMarathon) meters long")
        // Prints "A marathon is 42195.0 meters long"
        
        print("----------------------------")
        let defaultRect = Rect()
        let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
           size: Size(width: 5.0, height: 5.0))
        print(defaultRect, memberwiseRect)
        
        print("----------------------------")
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                              size: Size(width: 3.0, height: 3.0))
        // centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
        print(centerRect)
        
        print("----------------------------")
        3.repetitions {
            print("Hello!")
        }
        
        print("----------------------------")
        var someInt = 3
        someInt.square()
        // someInt is now 9
        print(someInt)
        
        print("----------------------------")
        print(746381295[0])
        // returns 5
        
        print("----------------------------")
        printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
        // Prints "+ + - 0 - 0 + "
        //number.kind已经知道是类型Int.Kind。因此，所有Int.Kindcase值都可以用简写形式写在switch语句中，例如.negative而不是Int.Kind.negative。
    }
    
    func printIntegerKinds(_ numbers: [Int]) {
        for number in numbers {
            switch number.kind {
            case .negative:
                print("- ", terminator: "")
            case .zero:
                print("0 ", terminator: "")
            case .positive:
                print("+ ", terminator: "")
            }
        }
        print("")
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


extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


//MARK: - Initializers -- 初始化器

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


//MARK: - Methods -- 方法

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}


extension Int {
    mutating func square() {
        self = self * self
    }
}


//MARK: - Subscripts -- 下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

//MARK: - Nested Types -- 嵌套类型

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
