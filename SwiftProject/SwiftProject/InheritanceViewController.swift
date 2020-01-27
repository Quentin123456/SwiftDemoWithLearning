//
//  InheritanceViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class InheritanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "继承"
        self.view.backgroundColor = .white
        
        let someVehicle = Vehicle()
        someVehicle.currentSpeed = 150
        print("Vehicle: \(someVehicle.description)")
        // Vehicle: traveling at 0.0 miles per hour
        
        print("-------------------------")
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        print("Bicycle: \(bicycle.description)")
        // Bicycle: traveling at 15.0 miles per hour
        
        print("-------------------------")
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassagers = 2
        tandem.currentSpeed = 22.0
        print("Tandem: \(tandem.description)")
        // Tandem: traveling at 22.0 miles per hour
        
        print("-------------------------")
        let train = Train()
        train.makeNoise()
        // Prints "Choo Choo"
        
        print("-------------------------")
        let car = Car()
        car.currentSpeed = 25.0
        car.gear = 3
        print("Car: \(car.description)")
        // Car: traveling at 25.0 miles per hour in gear 3
        
        print("-------------------------")
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        print("AutomaticCar: \(automatic.description)")
        // AutomaticCar: traveling at 35.0 miles per hour in gear 4
//       防止超越
//        您可以通过将方法，属性或下标标记为final来防止其被覆盖。通过写做到这一点final的方法，属性，或标的介绍人关键字之前修饰符（如，，，和）。final varfinal funcfinal class funcfinal subscript
    }
    
    // MAEK: - Defining a Base Class -- 定义基类
    class Vehicle {
        var currentSpeed = 0.0
        var description: String {
            return "traveling at \(currentSpeed) miles per hour"
        }
        func makeNoise() {
             // do nothing - an arbitrary vehicle doesn't necessarily make a noise
        }
        
    }
    
    class Bicycle: Vehicle {
        var hasBasket = false
    }
    
    class Tandem: Bicycle {
        var currentNumberOfPassagers = 0
        
    }

    
    // MARK: - Overriding -- 覆写
    
    //覆盖方法
    class Train: Vehicle {
        override func makeNoise() {
            print("Choo Choo")
        }
    }
    
    //覆盖属性获取器和设置器
    class Car: Vehicle {
        var gear = 1
        override var description: String {
            return super.description + " in gear \(gear)"
        }
    }
    
    //覆盖属性观察者
    class AutomaticCar: Car {
        override var currentSpeed: Double {
            didSet {
                gear = Int(currentSpeed / 10.0) + 1
            }
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
