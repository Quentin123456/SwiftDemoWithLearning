//
//  AccessControlViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class AccessControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "访问控制"
        self.view.backgroundColor = .white
        
        var stringToEdit = TrackedString()
        stringToEdit.value = "This string will be tracked."
        stringToEdit.value += " This edit will increment numberOfEdits."
        stringToEdit.value += " So will this one."
        print("The number of edits is \(stringToEdit.numberOfEdits)")
        // Prints "The number of edits is 3"
        
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



// MARK: - Custom Types -- 自定义类型
public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}

//struct TrackedString {
//    private(set) var numberOfEdits = 0
//    var value: String = "" {
//        didSet {
//            numberOfEdits += 1
//        }
//    }
//}

public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}


protocol SomeProtocol {
    func doSomething()
}

struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}
