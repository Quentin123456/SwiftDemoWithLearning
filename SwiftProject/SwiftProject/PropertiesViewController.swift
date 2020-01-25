//
//  PropertiesViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class PropertiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "属性"
        self.view.backgroundColor = .white
        
        print("-------------------------")
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // the range represents integer values 0, 1, and 2
        rangeOfThreeItems.firstValue = 6
        // the range now represents integer values 6, 7, and 8
        print(rangeOfThreeItems)
        
        print("-------------------------")
        var rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        // this range represents integer values 0, 1, 2, and 3
        rangeOfFourItems.firstValue = 6
        // this will report an error, even though firstValue is a variable property
        print(rangeOfFourItems)
        
        print("-------------------------")
        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        print(manager)
        // the DataImporter instance for the importer property has not yet been created
        
        print("-------------------------")
        print(manager.importer.filename)
        // the DataImporter instance for the importer property has now been created
        // Prints "data.txt"
        
        print("-------------------------")
        var square = Rect(origin: Point(x: 0.0, y: 0.0),
                          size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        // Prints "square.origin is now at (10.0, 10.0)"
        
        print("-------------------------")
        print(SomeStructure.storedTypeProperty)
        // Prints "Some value."
        SomeStructure.storedTypeProperty = "Another value."
        print(SomeStructure.storedTypeProperty)
        // Prints "Another value."
        print(SomeEnumeration.computedTypeProperty)
        // Prints "6"
        print(SomeClass.computedTypeProperty)
        // Prints "27"
        
        print("-------------------------")
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel)
        // Prints "7"
        print(AudioChannel.maxInputLevelForAllChannels)
        // Prints "7"
        rightChannel.currentLevel = 11
        print(rightChannel.currentLevel)
        // Prints "10"
        print(AudioChannel.maxInputLevelForAllChannels)
        // Prints "10"

    }
    
    struct FixedLengthRange {
        var firstValue: Int
        var length: Int
    }

    
    class DataImporter {
        /*
          DataImporter is a class to import data from an external file.
          The class is assumed to take a nontrivial amount of time to initialize.
          */
          var filename = "data.txt"
          // the DataImporter class would provide data importing functionality here
    }
    
    class DataManager {
        lazy var importer = DataImporter()
        var data = [String]()
        // the DataManager class would provide data management functionality here
    }
    
    // MARK: - Computed Properties -- 计算属性
    struct Point {
        var x = 0.0, y = 0.0
    }
    
    struct Size {
        var width = 0.0, height = 0.0
    }
    
    struct Rect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set(newCenter) {
                origin.x = newCenter.x - (size.width / 2)
                origin.y = newCenter.y - (size.height / 2)
            }
        }
    }
    
    // MARK: - Type Property Syntax -- 类型属性语法
    
    struct SomeStructure {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 1
        }
    }
    
    enum SomeEnumeration {
        static var storedProperty = "Some value."
        static var computedTypeProperty: Int {
            return 6
        }
    }
    
    class SomeClass {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 27
        }
        class var overrideableComputedTypeProperty: Int {
            return 107
        }
    }
    
    struct AudioChannel {
        static let thresholdLevel = 10
        static var maxInputLevelForAllChannels = 0
        var currentLevel: Int = 0 {
            didSet {
                if currentLevel > AudioChannel.thresholdLevel {
                    // cap the new audio level to the threshold level
                    currentLevel = AudioChannel.thresholdLevel
                }
                if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                    // store this as the new overall maximum input level
                    AudioChannel.maxInputLevelForAllChannels = currentLevel
                }
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
