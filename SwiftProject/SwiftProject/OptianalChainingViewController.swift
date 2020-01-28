//
//  OptianalChainingViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class OptianalChainingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "可选链接"
        self.view.backgroundColor = .white
        
        print("-------------------------")
        let john = Person()
        //let roomCount = john.residence!.numberOfRooms
        // this triggers a runtime error
//        let roomCount = john.residence?.numberOfRooms
//        print(roomCount)
        
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // Prints "Unable to retrieve the number of rooms."
        
        print("-------------------------")
        john.residence = Residence()
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // Prints "John's residence has 1 room(s)."
        
        print("-------------------------")
        //通过可选链接访问属性
        let johnny = Person()
        if let roomCount = johnny.residence?.numberOfRooms {
            print("Johnny's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // Prints "Unable to retrieve the number of rooms."
        
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        john.residence?.address = someAddress
        
        john.residence?.address = createAddress()
        
        print("-------------------------")
        if john.residence?.printNumberOfRooms() != nil {
            print("It was possible to print the number of rooms.")
        } else {
            print("It was not possible to print the number of rooms.")
        }
        // Prints "It was not possible to print the number of rooms."
        
        if (john.residence?.address = someAddress) != nil {
            print("It was possible to set the address.")
        } else {
            print("It was not possible to set the address.")
        }
        // Prints "It was not possible to set the address."
        
        
        //通过可选链接访问下标
        print("-------------------------")
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        // Prints "Unable to retrieve the first room name."
        
        print("-------------------------")
        //通过可选链接访问下标
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        // Prints "Unable to retrieve the first room name."
        
        print("-------------------------")
        let johnsHouse = Residence()
        johnsHouse.rooms.append(Room(name: "Living Room"))
        johnsHouse.rooms.append(Room(name: "Kitchen"))
        john.residence = johnsHouse

        print("-------------------------")
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        // Prints "The first room name is Living Room."
        
        print("-------------------------")
        //访问可选类型的下标
        var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
        // the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
        
        print("-------------------------")
        //链接多个级别的链接
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        // Prints "Unable to retrieve the address."
        
        print("-------------------------")
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence?.address = johnsAddress

        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        // Prints "John's street name is Laurel Street."

        print("-------------------------")
        //链接具有可选返回值的方法
        if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
            print("John's building identifier is \(buildingIdentifier).")
        }
        // Prints "John's building identifier is The Larches."
        
        if let beginsWithThe =
            john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
            if beginsWithThe {
                print("John's building identifier begins with \"The\".")
            } else {
                print("John's building identifier does not begin with \"The\".")
            }
        }
        // Prints "John's building identifier begins with "The"."
        
    }
    
    
    class Person {
        var residence: Residence?
    }
    
    class Residence {
        var numberOfRooms: Int {
            return rooms.count
        }
        var rooms = [Room]()
        subscript(i: Int) -> Room {
            get {
                return rooms[i]
            }
            set {
                rooms[i] = newValue
            }
        }
        //通过可选链接调用方法
        func printNumberOfRooms() {
            print("The number of rooms is \(numberOfRooms)")
        }
        var address: Address?
    }
    
    class Room {
        let name: String
        init(name: String) {
            self.name = name
        }
    }
    
    class Address {
        var buildingName: String?
        var buildingNumber: String?
        var street: String?
        func buildingIdentifier() -> String? {
            if let buildingNumber = buildingNumber, let street = street {
                return "\(buildingNumber) \(street)"
            } else if buildingName != nil {
                return buildingName
            } else {
                return nil
            }
        }
    }
    
    func createAddress() -> Address {
        print("Function was called.")
        
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        
        return someAddress
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
