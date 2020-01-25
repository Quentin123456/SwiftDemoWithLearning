//
//  FuctionsViewController.swift
//  SwiftProject
//
//  Created by ChuangLan on 2020/1/8.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class FuctionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "功能"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        print("-------------------------")
        print(greetAgain(person: "Anna"))
        // Prints "Hello again, Anna!"
        
        print("-------------------------")
        print(sayHelloWorld())
        // Prints "hello, world"
        
        print("-------------------------")
        print(greet(person: "Tim", alreadyGreeted: true))
        // Prints "Hello again, Tim!"
        
        print("-------------------------")
        greet(person: "Dave")
        // Prints "Hello, Dave!"
        
        print("-------------------------")
        //printAndCount(string: "hello, world")
        // prints "hello, world" and returns a value of 12
        printWithoutCounting(string: "hello, world")
        // prints "hello, world" but does not return a value
        
        print("-------------------------")
        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
        print("min is \(bounds.min) and max is \(bounds.max)")
        // Prints "min is -6 and max is 109"
        
//        print("-------------------------")
//        if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
//            print("min is \(bounds.min) and max is \(bounds.max)")
//        }
//        // Prints "min is -6 and max is 109"
        
        
        print("-------------------------")
        print(anotherGreeting(for: "Dave"))
        // Prints "Hello, Dave!"
        
        print("-------------------------")
        someFunction(firstParameterName: 1, secondParameterName: 2)

        print("-------------------------")
        print(greet(person: "Bill", from: "Cupertino"))
        // Prints "Hello Bill!  Glad you could visit from Cupertino."
        
        print("-------------------------")
        someFunction(1, secondParameterName: 2)
        
        print("-------------------------")
        someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
        someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
        
        print("-------------------------")
        arithmeticMean(1, 2, 3, 4, 5)
        // returns 3.0, which is the arithmetic mean of these five numbers
        arithmeticMean(3, 8.25, 18.75)
        // returns 10.0, which is the arithmetic mean of these three numbers
        
        print("-------------------------")
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // Prints "someInt is now 107, and anotherInt is now 3"
        
        print("-------------------------")
        var mathFunction: (Int, Int) -> Int = addTwoInts
        print("Result: \(mathFunction(2, 3))")
        // Prints "Result: 5"
        mathFunction = multiplyTwoInts
        print("Result: \(mathFunction(2, 3))")
        // Prints "Result: 6"
        
        let anotherMathFunction = addTwoInts
        // anotherMathFunction is inferred to be of type (Int, Int) -> Int
        
        print("-------------------------")
        print(anotherMathFunction)
        
        print("-------------------------")
        printMathResult(addTwoInts, 3, 5)
        // Prints "Result: 8"
        
        print("-------------------------")
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        print(moveNearerToZero)
        // moveNearerToZero now refers to the stepBackward() function
        
        print("-------------------------")
        print("Counting to zero:")
        // Counting to zero:
        while currentValue != 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
        // 3...
        // 2...
        // 1...
        // zero!
        
        print("-------------------------")
        var currentValue2 = -4
        let moveNearerToZero2 = chooseStepFunction2(backward: currentValue > 0)
        // moveNearerToZero now refers to the nested stepForward() function
        while currentValue2 != 0 {
            print("\(currentValue2)... ")
            currentValue2 = moveNearerToZero2(currentValue2)
        }
        print("zero!")
        // -4...
        // -3...
        // -2...
        // -1...
        // zero!
        
    }
    
    // MARK: - 定义和调用函数 --- Defining and Calling Functions
    func greetAgain(person: String) -> String {
        return "Hello again," + person + "!"
    }
    
    //Functions Without Parameters -- 函数参数和返回值
    func sayHelloWorld() -> String {
        return "hello,world"
    }
    
    //Functions With Multiple Parameters -- 具有多个参数的功能
    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return greetAgain(person: person)
        } else {
            return greet(person: "Tim", alreadyGreeted: true)
        }
    }
    
    func greet(person: String) {
        print("Hello, \(person)!")
    }
    
    func printAndCount(string: String) -> Int {
        print(string)
        return string.count
    }
    
    func printWithoutCounting(string: String) {
        //调用函数时，可以忽略其返回值：
        let _ = printAndCount(string: string)
    }
    
    // Functions with Multiple Return Values -- 具有多个返回值的函数
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    // 可选的元组返回类型 -- Optional Tuple Return Types
//    func minMax(array: [Int]) -> (min: Int, max: Int)? {
//        if array.isEmpty {
//            return nil
//        }
//        var currentMin = array[0]
//        var currentMax = array[0]
//        for value in array[1..<array.count] {
//            if value < currentMin {
//                currentMin = value
//            } else if value > currentMax {
//                currentMax = value
//            }
//        }
//        return (currentMin, currentMax)
//    }
    
    // Functions With an Implicit Return -- 隐式返回函数
    func anotherGreeting(for person: String) -> String {
        "Hello, " + person + "!"
    }
    
    // Function Argument Labels and Parameter Names -- 功能参数标签和参数名称
    func someFunction(firstParameterName: Int, secondParameterName: Int) {
        // In the function body, firstParameterName and secondParameterName
        // refer to the argument values for the first and second parameters.
    }
    
    // Specifying Argument Labels -- 指定参数标签
    func someFunction(argumentLabel parameterName: Int) {
        // In the function body, parameterName refers to the argument value
        // for that parameter.
    }
    
    func greet(person: String, from hometown: String) -> String {
     return "Hello \(person)!  Glad you could visit from \(hometown)."
    }
    
    // 省略参数标签 -- Omitting Argument Labels
    func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
        // In the function body, firstParameterName and secondParameterName
        // refer to the argument values for the first and second parameters.
    }
    // Default Parameter Values -- 默认参数值
    func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
        // If you omit the second argument when calling this function, then
        // the value of parameterWithDefault is 12 inside the function body.
    }
    
    // Variadic Parameters -- 可变参数
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    // In-Out Parameters -- 输入输出参数
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    // Function Types -- 功能类型
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    // Function Types as Parameter Types -- 函数类型作为参数类型
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    
    // Function Types as Return Types -- 函数类型作为返回类型
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
    }
    
    // Nested Functions -- 嵌套函数
    func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backward ? stepBackward : stepForward
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
