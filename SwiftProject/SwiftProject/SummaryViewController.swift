//
//  SummaryViewController.swift
//  SwiftProject
//
//  Created by ChuangLan on 2020/1/6.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //去掉返回按钮的文字
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "总结"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
    }
    
}
    
