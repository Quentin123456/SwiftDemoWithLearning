//
//  ARCViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class ARCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "自动引用计数"
        self.view.backgroundColor = .white
        
        var reference1: Personer?
        var reference2: Personer?
        var reference3: Personer?
        reference1 = Personer(name: "John Appleseed")
        // Prints "John Appleseed is being initialized"
        reference2 = reference1
        reference3 = reference1
        
        reference1 = nil
        reference2 = nil
        reference3 = nil
        // Prints "John Appleseed is being deinitialized"
        
        print("-------------------------")
        
        var john: Personn?
        var unit4A: Apartment?
        john = Personn(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")
        john!.apartment = unit4A
        unit4A!.tenant = john
        
        john = nil
        unit4A = nil
        
//        var john: Person?
//        var unit4A: Apartment?
//
//        john = Person(name: "John Appleseed")
//        unit4A = Apartment(unit: "4A")
//
//        john!.apartment = unit4A
//        unit4A!.tenant = john
        print("-------------------------")
        
        var bob: Customer?
        bob = Customer(name: "Bob Green")
        bob!.card = CreditCard(number: 1234_5678_9012_3456, customer: bob!)
        bob = nil
        // Prints "Bob Green is being deinitialized"
        // Prints "Card #1234567890123456 is being deinitialized"
        
        
        print("-------------------------")
        var country = Countries(name: "Canada", capitalName: "Ottawa")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
        // Prints "Canada's capital city is called Ottawa"
        
        
        print("-------------------------")
        let heading = HTMLElement(name: "h1")
        let defaultText = "some default text"
        heading.asHTML = {
            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
        }
        print(heading.asHTML())
        // Prints "<h1>some default text</h1>"
        
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        // Prints "<p>hello, world</p>"
        
        paragraph = nil
        
//        //解决关闭的强大参考周期
//        lazy var someClosure = {
//            [unowned self, weak delegate = self.delegate]
//            (index: Int, stringToProcess: String) -> String in
//            // closure body goes here
//        }
//
//        lazy var someClosure = {
//            [unowned self, weak delegate = self.delegate] in
//            // closure body goes here
//        }
        
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

// MARK: - ARC in Action
class Personer {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}


//类实例之间的强引用循环
class Personn {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}


class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Personn?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

//解决类实例之间的强引用循环
//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) is being deinitialized") }
//}
//
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    weak var tenant: Person?
//    deinit { print("Apartment \(unit) is being deinitialized") }
//}


class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}


//无主引用和隐式展开的可选属性
class Countries {
    let name: String
    var capitalCity: Cities!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = Cities(name: capitalName, country: self)
    }
}

class Cities {
    let name: String
    unowned let country: Countries
    init(name: String, country: Countries) {
        self.name = name
        self.country = country
    }
}


//封闭的强大参考周期
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}


//弱引用和无引用
//class HTMLElement {
//
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = {
//        [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//
//}
