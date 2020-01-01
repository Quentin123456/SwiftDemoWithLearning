//
//  ViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/1.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.edges.equalTo(view)
            make.left.right.equalTo(scrollView)
        }
        
        createUI()
        
    }
    
    func createUI() {
        
        let stringBtn = UIButton(type: .custom)
        stringBtn.setTitle("字符串的使用", for: .normal)
        stringBtn.backgroundColor = .blue
        stringBtn.layer.masksToBounds = true
        stringBtn.layer.cornerRadius = 8
        stringBtn.tag = 0x100000
        stringBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(stringBtn)
        stringBtn.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                if contentView.safeAreaInsets.top == 0.0 {
                    make.top.equalTo(64)
                } else {
                    make.top.equalTo(88)
                }
            } else {
                // Fallback on earlier versions
                make.top.equalTo(64)
            }
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(30)
        }
        
        
    }
    
    @objc func buttonClicked(_sender:UIButton) {
        if _sender.tag == 0x100000 {
            let stringVC = StringUsageViewController()
            self.navigationController?.pushViewController(stringVC, animated: true)
            //self.present(stringVC, animated: true, completion: nil)
        }
    }


}

