//
//  MermorySafetyViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/25.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class MermorySafetyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "内存安全"
        self.view.backgroundColor = .white
        
        var myNumber = 1
        myNumber = oneMore(than: myNumber)
        print(myNumber)
        //prints "2"
        
        
        print("-------------------------")
//        increment(&stepSize)
//        // Error: conflicting accesses to stepSize
        
        // Make an explicit copy.
        var copyOfStepSize = stepSize
        increment(&copyOfStepSize)

        // Update the original.
        stepSize = copyOfStepSize
        // stepSize is now 2
        
        print("-------------------------")
        
        var playerOneScore = 42
        var playerTwoScore = 30
        balance(&playerOneScore, &playerTwoScore)  // OK
        //balance(&playerOneScore, &playerOneScore)
        // Error: conflicting accesses to playerOneScore
    }
    
    func oneMore(than number: Int) -> Int {
        return number + 1
    }
    
    var stepSize = 1
    func increment(_ number: inout Int) {
        number += stepSize
    }
    
    func balance(_ x: inout Int, _ y: inout Int) {
        let sum = x + y
        x = sum / 2
        y = sum - x
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


//方法中的自我获取冲突
struct Player {
    var name: String
    var health: Int
    var energy: Int
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

//extension Player {
//    mutating func shareHealth(with teammate: inout Player) {
//        balance(&teammate.health,&health)
//    }
//}
