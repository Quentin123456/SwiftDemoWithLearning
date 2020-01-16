//
//  ControlFlowViewController.swift
//  SwiftProject
//
//  Created by ChuangLan on 2020/1/8.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class ControlFlowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         //去掉返回按钮的文字
         self.navigationController?.navigationBar.topItem?.title = ""
         self.title = "控制流"
         // Do any additional setup after loading the view.
         self.view.backgroundColor = .white
        
        ForInLoops()
        
        whileUsage()
        
        conditionalStatements()

        switchStatement()
        
        switchTuples()
        
        labeledStatements()
        
        greet(person: ["name": "John"])
        // Prints "Hello John!"
        // Prints "I hope the weather is nice near you."
        greet(person: ["name": "Jane", "location": "Cupertino"])
        // Prints "Hello Jane!"
        // Prints "I hope the weather is nice in Cupertino."
        
        if #available(iOS 10, macOS 10.12, *) {
            // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
        } else {
            // Fall back to earlier iOS and macOS APIs
        }
        
    }
    
    // MARK: - For-In Loops
    
    func ForInLoops() {
        let names = ["Bridget","Carmen","Lena","Tibby"]
        for name in names {
            print("Hello,\(name)!")
        }
        
        print("----------------------------")
        
        let numberOfLegs = ["spider": 8,"ant": 6,"cat": 4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        
        // cats have 4 legs
        // ants have 6 legs
        // spiders have 8 legs
        
        print("----------------------------")
        
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        // 1 times 5 is 5
        // 2 times 5 is 10
        // 3 times 5 is 15
        // 4 times 5 is 20
        // 5 times 5 is 25
        
        print("----------------------------")
        
        let base = 3
        let power = 10
        var answer = 1
        for _ in 1...power {
            answer *= base
        }
        print("\(base) to the power of \(power) is \(answer)")
        // Prints "3 to the power of 10 is 59049"
        
        
        print("----------------------------")
        let minutes = 60
        for tickMark in 0..<minutes {
            print(tickMark)
            // render the tick mark each minute (60 times)
        }
        
        
        print("----------------------------")
        
        let minuteInteral = 5
        for tickMark in stride(from: 0, to: minutes, by: minuteInteral) {
            print(tickMark)
            // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
        }
        
        print("----------------------------")
        
        let hours = 12
        let hourInteral = 3
        for tickMark in stride(from: 3, through: hours, by: hourInteral) {
            print(tickMark)
            // render the tick mark every 3 hours (3, 6, 9, 12)
        }

    }
    
    // MARK: - While
    
    func whileUsage() {
//        print("----------------------------")
//        let finalSquare = 25
//        var board = [Int](repeating: 0, count: finalSquare + 1)
//        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//        var square = 0
//        var diceRoll = 0
//        while square < finalSquare {
//            //roll the dice
//            diceRoll += 1
//            if diceRoll == 7 {
//                diceRoll = 1
//                //move by the rolled amount
//                square += diceRoll
//                if square < board.count {
//                    // if we're still on the board, move up or down for a snake or a ladder
//                    square += board[square]
//                }
//            }
//            print("Game over!")
//        }
        
        print("----------------------------")
        
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        repeat {
            // move up or down for a snake or ladder
            square += board[square]
            // roll the dice
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            // move by the rolled amount
            square += diceRoll
        }  while square < finalSquare
        print("Game over!")
        
    }
    
    // MARK: - 条件语句 Conditional Statements
    func conditionalStatements() {
        print("----------------------------")
        var temperatureInFahrenheit = 30
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.")
        }
        // Prints "It's very cold. Consider wearing a scarf."
        
        print("----------------------------")
        temperatureInFahrenheit = 40
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.")
        } else {
            print("It's not that cold. Wear a t-shirt.")
        }
        // Prints "It's not that cold. Wear a t-shirt."
        
        print("----------------------------")
        temperatureInFahrenheit = 90
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.")
        } else if temperatureInFahrenheit >= 86 {
            print("It's really warm. Don't forget to wear sunscreen.")
        } else {
            print("It's not that cold. Wear a t-shirt.")
        }
        // Prints "It's really warm. Don't forget to wear sunscreen."
        
        print("----------------------------")
        temperatureInFahrenheit = 72
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.")
        } else if temperatureInFahrenheit >= 86 {
            print("It's really warm. Don't forget to wear sunscreen.")
        }
    }
    
    // MARK: - Switch
    func switchStatement() {
        print("----------------------------")
        let someCharacter: Character = "z"
        switch someCharacter {
        case "a":
            print("The first letter of the alphabet")
        case "z":
            print("The last letter of the alphabet")
        default:
            print("Some other character")
        }
        // Prints "The last letter of the alphabet"
        
        
//        let anotherCharacter: Character = "a"
//        switch anotherCharacter {
//        case "a": // Invalid, the case has an empty body
//        case "A":
//            print("The letter A")
//        default:
//            print("Not the letter A")
//        }
        // This will report a compile-time error.
        
        print("----------------------------")
        let anotherCharacter: Character = "a"
        switch anotherCharacter {
        case "a", "A":
            print("The letter A")
        default:
            print("Not the letter A")
        }
        // Prints "The letter A"
        
        print("----------------------------")
        
        let approximateCount = 62
        let countedThings = "moons orbiting Saturn"
        let naturalCount: String
        switch approximateCount {
            case 0:
                naturalCount = "no"
            case 1..<5:
                naturalCount = "a few"
            case 5..<12:
                naturalCount = "several"
            case 12..<100:
                naturalCount = "dozens of"
            case 100..<1000:
                naturalCount = "hundreds of"
            default:
                naturalCount = "many"
            }
            print("There are \(naturalCount) \(countedThings).")
            // Prints "There are dozens of moons orbiting Saturn."
        
    }
    
    // MARK: - Switch Tuples
    func switchTuples() {
        print("----------------------------")
        let somePoint = (1,1)
        switch somePoint {
        case (0, 0):
        print("\(somePoint) is at the origin")
        case (_, 0):
            print("\(somePoint) is on the x-axis")
        case (0, _):
            print("\(somePoint) is on the y-axis")
        case (-2...2, -2...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        // Prints "(1, 1) is inside the box"
        
        print("----------------------------")
        
        let anotherPoint = (2, 0)
        switch anotherPoint {
            case (let x, 0):
                print("on the x-axis with an x value of \(x)")
            case (0, let y):
                print("on the y-axis with a y value of \(y)")
            case let (x, y):
                print("somewhere else at (\(x), \(y))")
        }
        // Prints "on the x-axis with an x value of 2"
        
        print("----------------------------")
        
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        // Prints "(1, -1) is on the line x == -y"

        print("----------------------------")
        let someCharacter: Character = "e"
        switch someCharacter {
        case "a", "e", "i", "o", "u":
            print("\(someCharacter) is a vowel")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("\(someCharacter) is a consonant")
        default:
            print("\(someCharacter) is not a vowel or a consonant")
        }
        // Prints "e is a vowel"
        
        print("----------------------------")
        let stillAnotherPoint = (9, 0)
        switch stillAnotherPoint {
        case (let distance, 0), (0, let distance):
            print("On an axis, \(distance) from the origin")
        default:
            print("Not on an axis")
        }
        // Prints "On an axis, 9 from the origin"
        
        print("----------------------------")
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
        for character in puzzleInput {
            if charactersToRemove.contains(character) {
                continue
            }
            puzzleOutput.append(character)
        }
        print(puzzleOutput)
        // Prints "grtmndsthnklk"
        
        print("----------------------------")
        let numberSymbol: Character = "三"  // Chinese symbol for the number 3
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
        }
        if let integerValue = possibleIntegerValue {
            print("The integer value of \(numberSymbol) is \(integerValue).")
        } else {
            print("An integer value could not be found for \(numberSymbol).")
        }
        // Prints "The integer value of 三 is 3."
        
        print("----------------------------")
        
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
        // Prints "The number 5 is a prime number, and also an integer."
    }

    
     // MARK: - Labeled Statements 带标签的声明
    func labeledStatements() {
        
        print("----------------------------")
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        
        gameLoop: while square != finalSquare {
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            switch square + diceRoll {
            case finalSquare:
                // diceRoll will move us to the final square, so the game is over
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                // diceRoll will move us beyond the final square, so roll again
                continue gameLoop
            default:
                // this is a valid move, so find out its effect
                square += diceRoll
                square += board[square]
            }
        }
        print("Game over!")
        
    }
    
    // MARK: - Early Exit 提前退出
    func greet(person: [String: String]) {
        guard let name = person["name"] else {
            return
        }

        print("Hello \(name)!")

        guard let location = person["location"] else {
            print("I hope the weather is nice near you.")
            return
        }

        print("I hope the weather is nice in \(location).")
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
