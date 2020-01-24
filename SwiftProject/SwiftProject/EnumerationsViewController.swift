//
//  EnumerationsViewController.swift
//  SwiftProject
//
//  Created by ChuangLan on 2020/1/8.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class EnumerationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "枚举"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        let directionToHead = CompassPoint.west
        print(directionToHead)
        print("----------------------------")
        switchCaseFunc()
        print("----------------------------")
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

        print(evaluate(product))
        // Prints "18"
    }
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    enum Planet {
        case mercury,venus,earth,mars,jupiter,saturn,uranus,neptune
    }
    
    func switchCaseFunc() {
        let somePlanet = Planet.earth
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
        enum Beverage: CaseIterable {
            case coffee, tea, juice
        }
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        // Prints "3 beverages available"
    }

    
//    enum ArithmeticExpression {
//        case number(Int)
//        indirect case addition(ArithmeticExpression, ArithmeticExpression)
//        indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//    }
    
    //您也可以indirect在枚举开始之前编写代码，以为具有关联值的所有枚举用例启用间接寻址：
    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
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
