//
//  SummaryViewController.swift
//  SwiftProject
//
//  Created by ChuangLan on 2020/1/6.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "总结"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        cloureUsage()
        
    }
    
    // MARK: - Cloure闭包的使用
    func cloureUsage()  {
        
        //https://docs.swift.org/swift-book/LanguageGuide/Closures.html
        
        let names = ["Chris","David","Elva","Alice","Grace"]
        let sortedNames = names.sorted()
        // sortedNames is equal to ["Alice", "Chris", "David", "Elva", "Grace"]
        print(sortedNames)
        
        print("----------------------------")
        let reversedNames = names.sorted(by:backward(_:_:))
        // reversedNames is equal to ["Grace", "Elva", "David", "Chris", "Alice"]
        print(reversedNames)
        
         print("----------------------------")
        //样式一
        var reversedNames1 = names.sorted(by:{ (s1: String,s2: String) -> Bool in
            return s1 > s2
        })
        print(reversedNames1)
        
        print("----------------------------")
        //样式二
        reversedNames1 = names.sorted(by: { s1,s2 -> Bool in return s1 > s2 })
        print(reversedNames1)
        
        print("----------------------------")
        //样式三
        reversedNames1 = names.sorted(by: { $0 > $1 } )
        print(reversedNames1)
        
        print("----------------------------")
        //样式4
        reversedNames1 = names.sorted(by: >)
        print(reversedNames1)
        
        //Trailing Closures--尾随闭包
        
        print("----------------------------")
        //样式5
        reversedNames1 = names.sorted() { $0 > $1 }
        print(reversedNames1)
        
        print("----------------------------")
        //样式6
        reversedNames1 = names.sorted { $0 > $1 }
        print(reversedNames1)
        
        print("----------------------------")
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        
        let numbers = [16, 58, 510]
        
        //数组Array的map的使用
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        
        // strings is inferred to be of type [String]
        // its value is ["OneSix", "FiveEight", "FiveOneZero"]
        print(strings)
        
        print("----------------------------")
        let incrementByTen = makeIncrement(forIncrement: 10)
        print(incrementByTen())
       
        print("----------------------------")
        let alsoIncrementByTen = incrementByTen
        print(alsoIncrementByTen())
              
        print("----------------------------")
        print(incrementByTen())
        
        print("----------------------------")
        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        
        print("----------------------------")
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // Prints "5"
        
        print("----------------------------")
        let customerProvider = { customersInLine.remove(at: 0)}
        print(customersInLine.count)
        // Prints "5"
        
        print("----------------------------")
        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        
        print("----------------------------")
        print(customersInLine.count)
        // Prints "4"
        
        serve(customer: {customersInLine.remove(at: 0) })
        // Prints "Now serving Alex!"
        print("----------------------------")
        print(customersInLine)
        
        serve(customer: customersInLine.remove(at: 0))
        // Prints "Now serving Ewa!"
        print("----------------------------")
        print(customersInLine)
        
        print("----------------------------")
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))

        print("Collected \(customerProviders.count) closures.")
        // Prints "Collected 2 closures."
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())!")
        }
        // Prints "Now serving Barry!"
        // Prints "Now serving Daniella!"
        
    }
    
    func backward(_ s1:String,_ s2:String) -> Bool {
        return s1 > s2
    }
    
    //Capturing Values 捕捉值
    func makeIncrement(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    // customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
    func serve(customer customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    
    // customersInLine is ["Ewa", "Barry", "Daniella"]
    func serve(customer customerProvider: @autoclosure () -> String) {
        print("Now serving \(customerProvider())!")
    }
   
    // customersInLine is ["Barry", "Daniella"]
    var customerProviders: [() -> String] = []
    func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
        customerProviders.append(customerProvider)
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



class SomeClass {
    
    // MARK: - Escaping Closures -- 逃逸闭包
    var completionHandlers : [() -> Void] = []
    func someFunctionWithEscapingCloure(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }
   
    //非逃逸闭包
    func someFunctionWithNonescapingCloure(cloure: () -> Void) {
        cloure()
    }
    
    var x = 10
    func doSomething() {
        someFunctionWithEscapingCloure {
            self.x = 100//这意味着它需要self显式引用
        }
        someFunctionWithNonescapingCloure {
            x = 200//这里不需要
        }
    }
}

