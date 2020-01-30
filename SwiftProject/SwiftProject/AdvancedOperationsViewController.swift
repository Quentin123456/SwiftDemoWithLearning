//
//  AdvancedOperationsViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class AdvancedOperationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "高级操作符"
        self.view.backgroundColor = .white
        
        //按位NOT运算符
        let initialBits: UInt8 = 0b00001111
        let invertedBits = ~initialBits
        print(invertedBits)
        
        print("-------------------------")
        
        //按位与运算符
        let firstSixBits: UInt8 = 0b11111100
        let lastSixBits: UInt8  = 0b00111111
        let middleFourBits = firstSixBits & lastSixBits  // equals 00111100
        print(middleFourBits)
        
        print("-------------------------")
        
        //按位或运算符
        let someBits: UInt8 = 0b10110010
        let moreBits: UInt8 = 0b01011110
        let combinedbits = someBits | moreBits  // equals 11111110
        print(combinedbits)
        
        print("-------------------------")
        
        //按位XOR运算符
        let firstBits: UInt8 = 0b00010100
        let otherBits: UInt8 = 0b00000101
        let outputBits = firstBits ^ otherBits  // equals 00010001
        print(outputBits)
        
        print("-------------------------")
        
        let pink: UInt32 = 0xCC6699
        let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
        let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
        let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153
        print(redComponent,greenComponent,blueComponent)
        
        print("-------------------------")
        
        //溢出运算符
//        var potentialOverflow = Int16.max
//        // potentialOverflow equals 32767, which is the maximum value an Int16 can hold
//        potentialOverflow += 1
//        // this causes an error
        
        let vector = Vector2D(x: 3.0, y: 1.0)
        let anotherVector = Vector2D(x: 2.0, y: 4.0)
        let combinedVector = vector + anotherVector
        print(combinedVector)
        // combinedVector is a Vector2D instance with values of (5.0, 5.0)
     
        print("-------------------------")
        let positive = Vector2D(x: 3.0, y: 4.0)
        let negative = -positive
        // negative is a Vector2D instance with values of (-3.0, -4.0)
        let alsoPositive = -negative
        // alsoPositive is a Vector2D instance with values of (3.0, 4.0)
        print(negative,alsoPositive)
        
        print("-------------------------")
        
        var original = Vector2D(x: 1.0, y: 2.0)
        let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
        original += vectorToAdd
        // original now has values of (4.0, 6.0)
        print(vectorToAdd)
        
        print("-------------------------")
        
        let twoThree = Vector2D(x: 2.0, y: 3.0)
        let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
        if twoThree == anotherTwoThree {
            print("These two vectors are equivalent.")
        }
        // Prints "These two vectors are equivalent."
        
        print("-------------------------")

        let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
        let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
        if twoThreeFour == anotherTwoThreeFour {
            print("These two vectors are also equivalent.")
        }
        // Prints "These two vectors are also equivalent."
        
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


// MARK: - Operator Methods -- 操作员方法
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    //前缀和后缀运算符
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
    //复合分配运算符
    static func += (left: inout Vector2D, right: Vector2D) {
           left = left + right
       }
    //等价运算符
    static func == (left: Vector2D, right: Vector2D) -> Bool {
           return (left.x == right.x) && (left.y == right.y)
       }
    //自定义中缀运算符的优先级
//    infix operator +-: AdditionPrecedence
//    static func +- (left: Vector2D, right: Vector2D) ->Vector2D {
//        return Vector2D(x: left.x + right.x, y: left.y - right.y)
//    }
   
}

////MARK: - Operator Methods -- 定制运营商
//extension Vector2D {
//    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
//        vector += vector
//        return vector
//    }
//}

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}
