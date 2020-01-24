//
//  StructureAndClassController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/24.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class StructureAndClassController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "结构和类"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        print("The width of someResolution is \(someResolution.width)")
        // Prints "The width of someResolution is 0"
        
        print("-------------------------")
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        // Prints "The width of someVideoMode is 0"
        
        print("-------------------------")
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        // Prints "The width of someVideoMode is now 1280"
        
        print("-------------------------")
        //结构类型的成员初始化器
        let vga = Resolution(width: 640, height: 480)
        
        print("-------------------------")
        print(vga)
        //结构和枚举是值类型
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        cinema.width = 2048
        print("cinema is now \(cinema.width) pixels wide")
        // Prints "cinema is now 2048 pixels wide"
        print("hd is still \(hd.width) pixels wide")
        // Prints "hd is still 1920 pixels wide"
        
        print("-------------------------")
        var currentDirection = CompassPoint.west
        let rememberedDirection = currentDirection
        currentDirection.turnNorth()

        print("The current direction is \(currentDirection)")
        print("The remembered direction is \(rememberedDirection)")
        // Prints "The current direction is north"
        // Prints "The remembered direction is west"
        
        print("-------------------------")
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        // Prints "The frameRate property of tenEighty is now 30.0"
        
        print("-------------------------")
        //身份运算符
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        }
        // Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
    }
}


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
