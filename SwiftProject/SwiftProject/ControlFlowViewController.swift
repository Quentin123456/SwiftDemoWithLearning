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