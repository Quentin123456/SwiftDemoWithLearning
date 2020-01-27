//
//  InitializationViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class InitializationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "初始化"
        self.view.backgroundColor = .white
        
        var f = Fahrenheit()
        print("The default temperature is \(f.temperature)° Fahrenheit")
        // Prints "The default temperature is 32.0° Fahrenheit"
        
        print("-------------------------")
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        // boilingPointOfWater.temperatureInCelsius is 100.0
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        // freezingPointOfWater.temperatureInCelsius is 0.0
        print(boilingPointOfWater,freezingPointOfWater)
        
        print("-------------------------")
        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
        let halfGray = Color(white: 0.5)
        
        let veryGreen = Color(red: 0.0, green: 1.0, blue: 0.0)
        // this reports a compile-time error - argument labels are required
        print(magenta,halfGray,veryGreen)
        
        print("-------------------------")
        let bodyTemperature = Celsius(37.0)
        print(bodyTemperature)
        // bodyTemperature.temperatureInCelsius is 37.0
        
        print("-------------------------")
        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        // Prints "Do you like cheese?"
        cheeseQuestion.response = "Yes, I do like cheese."
        
        print("-------------------------")
        let board = Chessboard()
        print(board.squareIsBlackAt(row: 0, column: 1))
        // Prints "true"
        print(board.squareIsBlackAt(row: 7, column: 7))
        // Prints "false"
    }
    
    
    // MARK: - Initializers -- 初始化器
    struct Fahrenheit {
        var temperature: Double
        init() {
            temperature = 32.0
        }
    }
    
    // MARK: - Customizing Initialization -- 自定义初始化
    struct Celsius {
        var temperatureInCelsius: Double
        init(fromFahrenheit fahrenheit: Double) {
            temperatureInCelsius = (fahrenheit - 32.0) / 1.8
        }
        
        init(fromKelvin kelvin: Double) {
            temperatureInCelsius = kelvin - 273.15
        }
        
        init(_ celsius: Double) {
            temperatureInCelsius = celsius
        }
        
    }

    struct Color {
        let red, green, blue: Double
        init(red: Double, green: Double, blue: Double) {
            self.red   = red
            self.green = green
            self.blue  = blue
        }
        init(white: Double) {
            red   = white
            green = white
            blue  = white
        }
    }

    //可选属性类型
    class SurveyQuestion {
        var text: String
        var response: String? //直到询问问题后，才能知道对调查问题的回答，因此，该response属性用String?或“可选String” 的类型声明。nil当SurveyQuestion初始化的新实例时，会自动为其分配默认值，表示“没有字符串” 。
        init(text: String) {
            self.text = text
        }
        func ask() {
            print(text)
        }
    }
    
    //默认初始化器
    class ShoppingListItem {
        var name: String?
        var quantity = 1
        var purchased = false
    }
    
    //结构类型的成员初始化器
    struct Size {
        var width = 0.0, height = 0.0
    }
    
    struct Point {
        var x = 0.0, y = 0.0
    }
    
    //值类型的初始化程序委托
    struct Rect {
        var origin = Point()
        var size = Size()
        init() {}
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }
    
    //使用闭包或函数设置默认属性值
    struct Chessboard {
        let boardColors: [Bool] = {
            var temporaryBoard = [Bool]()
            var isBlack = false
            for i in 1...8 {
                for j in 1...8 {
                    temporaryBoard.append(isBlack)
                    isBlack = !isBlack
                }
                isBlack = !isBlack
            }
            return temporaryBoard
        }()
        
        func squareIsBlackAt(row: Int, column: Int) -> Bool {
            return boardColors[(row * 8) + column]
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
