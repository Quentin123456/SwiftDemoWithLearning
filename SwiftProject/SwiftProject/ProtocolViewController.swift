//
//  ProtocolViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "协议"
        self.view.backgroundColor = .white
        
        var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
        print(ncc1701.fullName)
        // ncc1701.fullName is "USS Enterprise"
        
        print("-------------------------")
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()
        print(lightSwitch)
        // lightSwitch is now equal to .on
        
        print("-------------------------")
        var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        for _ in 1...5 {
            print("Random dice roll is \(d6.roll())")
        }
        // Random dice roll is 3
        // Random dice roll is 5
        // Random dice roll is 4
        // Random dice roll is 5
        // Random dice roll is 4
        
        print("-------------------------")
        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.delegate = tracker
        game.play()
        // Started a new game of Snakes and Ladders
        // The game is using a 6-sided dice
        // Rolled a 3
        // Rolled a 5
        // Rolled a 4
        // Rolled a 5
        // The game lasted for 4 turns
        
        print("-------------------------")
        let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
        print(d12.textualDescription)
        // Prints "A 12-sided dice"
        
        print("-------------------------")
        print(game.textualDescription)
        // Prints "A game of Snakes and Ladders with 25 squares"
        
        print("-------------------------")
        let myDice = [d6, d12]
        print(myDice.textualDescription)
        // Prints "[A 6-sided dice, A 12-sided dice]"
        
        print("-------------------------")
        let simonTheHamster = Hamster(name: "Simon")
        let somethingTextRepresentable: TextRepresentable = simonTheHamster
        print(somethingTextRepresentable.textualDescription)
        // Prints "A hamster named Simon"
        
        print("-------------------------")
        let things: [TextRepresentable] = [game, d12, simonTheHamster]
        for thing in things {
            print(thing.textualDescription)
        }
        // A game of Snakes and Ladders with 25 squares
        // A 12-sided dice
        // A hamster named Simon
        
        
        print("-------------------------")
        print(game.prettyTextualDescription)
        // A game of Snakes and Ladders with 25 squares:
        // ○ ○ ▲ ○ ○ ▲ ○ ○ ▲ ▲ ○ ○ ○ ▼ ○ ○ ○ ○ ▼ ○ ○ ▼ ○ ▼ ○
        
        print("-------------------------")
        let birthdayPerson = Person(name: "Malcolm", age: 21)
        wishHappyBirthday(to: birthdayPerson)
        // Prints "Happy birthday, Malcolm, you're 21!"

        
        print("-------------------------")
        
        let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
        beginConcert(in: seattle)
        // Prints "Hello, Seattle!"
        
        print("-------------------------")
        
        let objects: [AnyObject] = [
            Circle(radius: 2.0),
            Country(area: 243_610),
            Animal(legs: 4)
        ]
        print(objects)
        
        print("-------------------------")
        
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("Area is \(objectWithArea.area)")
            } else {
                print("Something that doesn't have an area")
            }
        }
        
        // Area is 12.5663708
        // Area is 243610.0
        // Something that doesn't have an area
        
        print("-------------------------")
        
        var counter = Counter()
        counter.dataSource = ThreeSource()
        for _ in 1...4 {
            counter.increment()
            print(counter.count)
        }
        // 3
        // 6
        // 9
        // 12
        
        print("-------------------------")
        
        counter.count = -4
        counter.dataSource = TowardsZeroSource()
        for _ in 1...5 {
            counter.increment()
            print(counter.count)
        }
        
//        print("-------------------------")
        
//        let generator = LinearCongruentialGenerator()
//        print("Here's a random number: \(generator.random())")
//        // Prints "Here's a random number: 0.3746499199817101"
//        print("And here's a random Boolean: \(generator.randomBool())")
//        // Prints "And here's a random Boolean: true"
        
        print("-------------------------")
        let equalNumbers = [100, 100, 100, 100, 100]
        let differentNumbers = [100, 100, 200, 100, 200]
        print(equalNumbers.allEqual())
        // Prints "true"
        print(differentNumbers.allEqual())
        // Prints "false"
    }
    
    
    func wishHappyBirthday(to celebrator: Named & Aged) {
        print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
    }
    
    func beginConcert(in location: Location & Named) {
        print("Hello, \(location.name)!")
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
protocol FullyNamed {
    var fullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

protocol RandomNumberGenerator {
    func radom() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    func radom() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
}

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

// MARK: - Initializer Requirements -- 初始化要求
//protocol SomeProcotol {
//    init(someParameter: Int)
//}
//
//class SomeClass: SomeProcotol {
//    required init(someParameter: Int) {
//        //initializer implementation goes here
//    }
//}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.radom() * Double(sides)) + 1
    }
    
}

// MARK: - Delegation
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate:DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}


class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}



// MARK: - Adding Protocol Conformance with an Extension -- 通过扩展添加协议一致性
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
           return "A game of Snakes and Ladders with \(finalSquare) squares"
       }
}

//有条件地遵守协议
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemAsText = self.map { $0.textualDescription }
        return "[" + itemAsText.joined(separator:",") + "]"
    }
}


// MARK: - Declaring Protocol Adoption with an Extension -- 声明协议采用扩展
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
    
}

extension Hamster: TextRepresentable {}


// MARK: - Protocol Inheritance  -- 协议继承
protocol PrettyTextRespresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
    
}

extension SnakesAndLadders: PrettyTextRespresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}


// MARK: - Protocol Composition  -- 协议组成
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}


class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude  = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}


// MARK: - Checking for Protocol Conformance -- 检查协议一致性
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}


class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}


// MARK: - Optional Protocol Requirements -- 可选协议要求
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}



// MARK: - Protocol Extensions -- 协议扩展
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return radom() > 0.5
    }
}


extension PrettyTextRespresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}
