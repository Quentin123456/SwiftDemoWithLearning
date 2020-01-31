//
//  OpaqueTypesViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class OpaqueTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "不透明类型"
        self.view.backgroundColor = .white
        
        print("-------------------------")
        
        let smallTriangle = Triangle(size: 3)
        print(smallTriangle.draw())
        // *
        // **
        // ***
        
        print("-------------------------")
        var flippedTriangle = FlippedShape(shape: smallTriangle)
        print(flippedTriangle.draw())
        // ***
        // **
        // *
        
        print("-------------------------")
        
//        let joinedTriangles = JoinedShape(top: smallTriangle, bottom:  flippedTriangle)
//        print(joinedTriangles.draw())
        // *
        // **
        // ***
        // ***
        // **
        // *
        
        print("-------------------------")
        
        
        print("-------------------------")
        
        
        print("-------------------------")
        
        
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


// MARK: - The Problem That Opaque Types Solve -- 不透明类型解决的问题
protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: T
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}


// MARK: - Returning an Opaque Type -- 返回不透明类型
struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

//@available(iOS 13.0.0, *)
//func makeTrapezoid() -> some Shape {
//    let top = Triangle(size: 2)
//    let middle = Square(size: 2)
//    let bottom = FlippedShape(shape: top)
//    let trapezoid = JoinedShape(
//        top: top,
//        bottom: JoinedShape(top: middle, bottom: bottom)
//    )
//    return trapezoid
//}


@available(iOS 13.0.0, *)
func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}
