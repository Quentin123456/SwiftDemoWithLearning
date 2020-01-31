//
//  GenericsViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class GenericsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "泛型"
        self.view.backgroundColor = .white
        
        print("-------------------------")
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // Prints "someInt is now 107, and anotherInt is now 3"
        
        print("-------------------------")
        
        swapTwoValues(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // someInt is now 107, and anotherInt is now 3

        print("-------------------------")
        
        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, &anotherString)
        print("someInt is now \(someString), and anotherInt is now \(anotherString)")
        // someString is now "world", and anotherString is now "hello"
        
        print("-------------------------")
        
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        print(stackOfStrings.items)
        // the stack now contains 4 strings
        
        print("-------------------------")
        
        if let topItem = stackOfStrings.topItem {
            print("The top item on the stack is \(topItem).")
        }
        // Prints "The top item on the stack is tres."
        
        print("-------------------------")
        
        let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
        if let foundIndex = findIndex(ofString: "llama", in: strings) {
            print("The index of llama is \(foundIndex)")
        }
        // Prints "The index of llama is 2"
        
        
        print("-------------------------")
        
        let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
        print(doubleIndex)
        // doubleIndex is an optional Int with no value, because 9.3 isn't in the array
        let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
        print(stringIndex)
        // stringIndex is an optional Int containing a value of 2
        
        print("-------------------------")
        
        var stackOfInts = Stack<Int>()
        stackOfInts.append(10)
        stackOfInts.append(20)
        stackOfInts.append(30)
        let suffix = stackOfInts.suffix(2)
        print(suffix)
        // suffix contains 20 and 30
        
        print("-------------------------")
        
        stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")

        var arrayOfStrings = ["uno", "dos", "tres"]

//        if allItemsMatch(stackOfStrings, arrayOfStrings) {
//            print("All items match.")
//        } else {
//            print("Not all items match.")
//        }
//        // Prints "All items match."
        
       
        // Prints "Starts with something else."
        
     
    }
    

    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func swapTwoStrings(_ a: inout String, _ b: inout String) {
        let temporaryA = a
        a = b
        b = temporaryA
    }

    func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    
    //通用功能
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    
    //Type Constraints -- 类型约束
    func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
  func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
       for (index, value) in array.enumerated() {
           if value == valueToFind {
               return index
           }
       }
       return nil
   }
    
    //通用条款
    func allItemsMatch<C1: Container, C2: Container>
        (_ someContainer: C1, _ anotherContainer: C2) -> Bool
        where C1.Item == C2.Item, C1.Item: Equatable {

            // Check that both containers contain the same number of items.
            if someContainer.count != anotherContainer.count {
                return false
            }

            // Check each pair of items to see if they're equivalent.
            for i in 0..<someContainer.count {
                if someContainer[i] != anotherContainer[i] {
                    return false
                }
            }

            // All items match, so return true.
            return true
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

// MARK: - Generic Types  -- 通用类型
struct IntStack: Container, SuffixalbeContainer {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }

    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
    
    func suffix(_ size: Int) -> Stack<Int> {
        var result = Stack<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack<Int>.
    
}

struct Stack<Element>: Container {
    
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    // conformance to the Container protocol
       mutating func append(_ item: Element) {
           self.push(item)
       }
       var count: Int {
           return items.count
       }
       subscript(i: Int) -> Element {
           return items[i]
       }
}


// MARK: - Extending a Generic Type -- 扩展通用类型
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


// MARK: - Associated Types -- 关联类型
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//在关联类型的约束中使用协议
protocol SuffixalbeContainer: Container {
    associatedtype Suffix: SuffixalbeContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension Stack: SuffixalbeContainer {
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack.
}


extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}

//protocol Container {
//    associatedtype Item
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
//    func makeInterator() -> Iterator
//}

//通用下标
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
