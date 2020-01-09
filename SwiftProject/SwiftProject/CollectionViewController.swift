//
//  CollectionViewController.swift
//  SwiftProject
//
//  Created by ChuangLan on 2020/1/8.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "集合"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        arrayUsage()
        
        setCollectionUsage()
        
        dictionaryUsage()
        
    }
    
    // MARK: - 数组的使用
    func arrayUsage() {
        //创建一个空数组
        var someInts = [Int]()
        print("-------------------------")
        // Prints "someInts is of type [Int] with 0 items."
        print("someInts is of type [Int] with \(someInts.count) items.")
        
        someInts.append(3)
        // someInts now contains 1 value of type Int
        someInts = []
        // someInts is now an empty array, but is still of type [Int]
        
        //创建具有默认值的数组
        let threeDoubles = Array(repeating: 0.0, count: 3)
        // threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]
        print("-------------------------")
        // Prints "someInts is of type [Int] with 0 items."
        print(threeDoubles)
        
        let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        // anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]
        
        let sixDoubles = threeDoubles + anotherThreeDoubles
        // sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
        print("-------------------------")
        print(sixDoubles)
        
        var shoppingList : [String] = ["Eggs", "Milk"]
        // shoppingList has been initialized with two initial items
        print("-------------------------")
        print("The shopping list contains \(shoppingList.count) items.")
        // Prints "The shopping list contains 2 items."
        
        print("-------------------------")
        if shoppingList.isEmpty {
             print("The shopping list is empty.")
            } else {
                print("The shopping list is not empty.")
            }
            // Prints "The shopping list is not empty."
        
        shoppingList.append("Flour")
        // shoppingList now contains 3 items, and someone is making pancakes
        
        shoppingList += ["Baking Powder"]
        // shoppingList now contains 4 items
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        // shoppingList now contains 7 items
        
        var firstItem = shoppingList[0]
        // firstItem is equal to "Eggs"
        shoppingList[0] = "Six eggs"
        // the first item in the list is now equal to "Six eggs" rather than "Eggs"
        
        shoppingList[4...6] = ["Bananas","apple"]
        // shoppingList now contains 6 items
        
        print("-------------------------")
        print(shoppingList)
        
        shoppingList.insert("Maple Syrup", at: 0)
        // shoppingList now contains 7 items
        // "Maple Syrup" is now the first item in the list
        print("-------------------------")
        print(shoppingList)
        
        firstItem = shoppingList[0]
        print("-------------------------")
        print(firstItem)
        
        let apples = shoppingList.removeLast()
        // the last item in the array has just been removed
        // shoppingList now contains 5 items, and no apples
        // the apples constant is now equal to the removed "Apples" string
        print("-------------------------")
        print(apples)
        
        //遍历数组
        print("-------------------------")
        for item in shoppingList {
            print(item)
        }
        // Six eggs
        // Milk
        // Flour
        // Baking Powder
        // Bananas
        print("-------------------------")
        for (index, value) in shoppingList.enumerated() {
            print("Item \(index + 1) : \(value)")
        }
    }
    
    // MARK: - Set集合的使用
    func setCollectionUsage() {
        
        var letters = Set<Character>()
        print("-------------------------")
        print("letters is of type Set<Character> with \(letters.count) items.")
        // Prints "letters is of type Set<Character> with 0 items."
        
        letters.insert("a")
        // letters now contains 1 value of type Character
        print("-------------------------")
        print(letters)
        
        letters = []
        // letters is now an empty set, but is still of type Set<Character>
        print("-------------------------")
        print(letters)
        
        let favoriteGenres : Set<String> = ["Rock","Jazz","Hip Hop"]
        // favoriteGenres has been initialized with three initial items
       
        print("-------------------------")
        print(favoriteGenres)
        
        var favouriteGenres : Set = ["Rock", "Classical", "Hip hop"]
        print("-------------------------")
        print("I have \(favouriteGenres.count) favorite music genres.")
        // Prints "I have 3 favorite music genres."
        
        print("-------------------------")
        if favouriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.")
        } else {
            print("I have particular music preferences.")
        }
        // Prints "I have particular music preferences."
        favouriteGenres.insert("Jazz")
        // favoriteGenres now contains 4 items
        print("-------------------------")
        print(favouriteGenres)
        
        print("-------------------------")
        if let removedGenre = favouriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
        } else {
           print("I never much cared for that.")
        }
            // Prints "Rock? I'm over it."
        
        print("-------------------------")
        if favouriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
        // Prints "It's too funky in here."
        
        print("-------------------------")
        for genre in favouriteGenres {
            print("\(genre)")
        }
        // Classical
        // Jazz
        // Hip hop
        
        print("-------------------------")
        for genre in favouriteGenres.sorted() {
            print("\(genre)")
        }
        // Classical
        // Hip hop
        // Jazz
        
         print("-------------------------")
        // 使用该intersection(_:)方法创建仅具有两个集合共有的值的新集合。
        //        使用该symmetricDifference(_:)方法创建一个新集合，其中两个集合中都有一个值，但不能同时包含两个集合中的值。
        //        使用该union(_:)方法创建一个包含两个集合中所有值的新集合。
        //        使用该subtracting(_:)方法创建一个新集合，其值不在指定集合中。
        let oddDigits: Set = [1,3,5,7,9]
        let evenDigits: Set = [0,2,4,6,8]
        let singleDigitPrimeNumbers: Set = [2,3,5,7]
        let oddUnion = oddDigits.union(evenDigits).sorted()
        print(oddUnion)
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        print("-------------------------")
        let oddIntersetion = oddDigits.intersection(evenDigits).sorted()
        print(oddIntersetion)
        // []
        
        print("-------------------------")
        let oddSubtracting = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        print(oddSubtracting)
        // [1, 9]
        
        print("-------------------------")
        let oddDiffrent = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        print(oddDiffrent)
        // [1, 2, 9]
        
        //设置成员资格和平等
        
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        print("-------------------------")
        var isTrue  = houseAnimals.isSubset(of: farmAnimals)
        print(isTrue)
        // true
        
        print("-------------------------")
        isTrue = farmAnimals.isSuperset(of: houseAnimals)
        print(isTrue)
        // true
        
        print("-------------------------")
        isTrue = farmAnimals.isDisjoint(with: cityAnimals)
        print(isTrue)
        // true
        
    }
    
    // MARK: - 字典的使用
    func dictionaryUsage() {
        var namesOfIntegers = [Int: String]()
        // namesOfIntegers is an empty [Int: String] dictionary
        print("-------------------------")
        print(namesOfIntegers)
        
        namesOfIntegers[16] = "sixteen"
        // namesOfIntegers now contains 1 key-value pair
        print("-------------------------")
        print(namesOfIntegers)
        
        namesOfIntegers = [:]
        // namesOfIntegers is once again an empty dictionary of type [Int: String]
        print("-------------------------")
        print(namesOfIntegers)
        
        //用字典文字创建字典
        var airports : [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        print("-------------------------")
        print("The airports dictionary contains \(airports.count) items.")
        // Prints "The airports dictionary contains 2 items."
        
        print("-------------------------")
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        } else {
            print("The airports dictionary is not empty.")
        }
        // Prints "The airports dictionary is not empty."
        
        print("-------------------------")
        airports["LHR"] = "London"
        // the airports dictionary now contains 3 items
        print(airports)
        
        print("-------------------------")
        airports["LHR"] = "London Heathrow"
        // the value for "LHR" has been changed to "London Heathrow"
        print(airports)
        
        print("-------------------------")
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        // Prints "The old value for DUB was Dublin."
        
        print("-------------------------")
        airports["APL"] = "Apple International"
        // "Apple International" is not the real airport for APL, so delete it
        print(airports)
        
        print("-------------------------")
        airports["APL"] = nil
        // APL has now been removed from the dictionary
        print(airports)
        
        print("-------------------------")
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        // Prints "The removed airport's name is Dublin Airport."
        
        //遍历字典
        print("-------------------------")
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        // LHR: London Heathrow
        // YYZ: Toronto Pearson
        
        print("-------------------------")
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        // Airport code: LHR
        // Airport code: YYZ

        print("-------------------------")
        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        // Airport name: London Heathrow
        // Airport name: Toronto Pearson
        
    //通过带有Array实例的API使用字典的键或值，请使用keys或values属性初始化一个新数组：
        print("-------------------------")
        let airportCodes = [String](airports.keys)
        // airportCodes is ["LHR", "YYZ"]
        print(airportCodes)

        print("-------------------------")
        let airportNames = [String](airports.values)
        // airportNames is ["London Heathrow", "Toronto Pearson"]
        print(airportNames)
        
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
