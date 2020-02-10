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
        
        //断言调试
//        let age = -3
//        assert(age >= 0, "A person's age can't be less than zero.")
//        // This assertion fails because -3 is not >= 0.
        
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for i in 0..<count {
            print("Person \(i + 1) is called \(names[i])")
        }
        // Person 1 is called Anna
        // Person 2 is called Alex
        // Person 3 is called Brian
        // Person 4 is called Jack
        
        print("-------------------------")
        for name in names[2...] {
            print(name)
        }
        // Brian
        // Jack

        print("-------------------------")
        for name in names[...2] {
            print(name)
        }
        // Anna
        // Alex
        // Brian
        
        print("-------------------------")
        for name in names[..<2] {
            print(name)
        }
        // Anna
        // Alex
        
        print("-------------------------")
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
        // Prints "Cat!🐱"
        
        print("-------------------------")
        let greeting = "Hello， 你好"
        for index in greeting.indices {
            print("\(greeting[index])", terminator: " ")
        }
        
        print("-------------------------")
        
        var numbers = 12
        numberLoop: while numbers > 10 {
            numbers += 1
            switch numbers {
            case ...15:
                break numberLoop
            default:
                continue
                
            }
        }
        
        print(":::::")
        
        print("-------------------------")
        
        guardFunc(parameter: 15)
        //prints "进入guard语句里"
        guardFunc(parameter: 5)
        //prints "直接执行下一句"
        
        print("-------------------------")
        let a:String? = "swift"
        let b:String? = nil
        guardBindFunc(param: a)
        //prints "swift"
        guardBindFunc(param: b)
        //prints "进入guard语句里"
        
        print("-------------------------")
        //匿名函数
        let c:(String, Int) -> String = { (parameter1: String, parameter2: Int) -> String in return parameter1 + String(parameter2) }
        print(c("swift",16))
        
        print("-------------------------")
        //返回类型是匿名函数的调用
        let fun1 = isAddOrMinus(para: true)
        let d = fun1(12,144)
        print(d)
        
        print("-------------------------")
        
        var clourse: ClourseClass? = ClourseClass(name: "Hello")
        clourse!.data()
        clourse = nil
        
        print("-------------------------")
        //trycatch的使用
        do {
            var value = try play(param: 0)
            print(value)
        } catch TestError.error1 {
            print(TestError.error1.rawValue)
        } catch TestError.error2 {
            print(TestError.error2.rawValue)
        } catch { // 加入一个空的catch，用于关闭catch。否则会报错：Errors thrown from here are not handled because the enclosing catch is not exhaustive

        }
        defer {
            print("defer")
        }
    }
    
    func guardFunc(parameter: Int) {
        guard parameter < 10 else {
            print("进入guard语句里")
            return
        }
        print("直接执行下一句")
    }
    
    func guardBindFunc(param:String?) {
        guard let value = param else {
            print("进入guard语句里")
                       return
        }
        print(value)
    }
    
    func add(para1: Int, para2: Int) -> Int {
        return para1 + para2
    }
    
    func minus(para1: Int, para2: Int) -> Int {
        return para1 - para2
    }
    
    //返回类型是匿名函数
    func isAddOrMinus(para: Bool) -> (Int, Int) -> Int {
        return para ? add : minus
    }
    
    func play(param: Int) throws -> String {
        if param < 0 {
            throw TestError.error1
        } else if param >= 0 && param <= 10 {
            throw TestError.error2
        }
        print("正常执行")
        return "Hello World!"
    }
    
    
}
    
//闭包循环引用
class ClourseClass {
    var name: String
    //循环引用需要用unowned
    lazy var data: () -> Void = { [unowned self]() -> Void in
        print("姓名： = " + self.name)
    }
    
    init(name: String) {
        self.name = name
    }
    deinit {
        print("ClourseClass的实例被释放 - " + self.name)
    }
    
}

enum TestError: String, Error {
    case error1 = "错误1"
    case error2 = "错误2"
}
