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
    
        self.title = "主控制器"
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
               
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
       
        // 添加容器视图
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(view) // 确定的宽度，因为垂直滚动
        }
        
        createUI()
        
    }
    
    func createUI() {
        
        let screenScale = UIScreen.main.bounds.size.width / 375.0
        
        let stringBtn = UIButton(type: .custom)
        stringBtn.setTitle("字符串的使用", for: .normal)
        stringBtn.backgroundColor = .blue
        stringBtn.layer.masksToBounds = true
        stringBtn.layer.cornerRadius = 8
        stringBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        stringBtn.tag = 0x100000
        stringBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(stringBtn)
        stringBtn.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {

              if contentView.safeAreaInsets.top == 0.0 {
                  make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(20 * screenScale)
              } else {
                  make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(20 + 20 * screenScale)
              }

            } else {
              make.top.equalTo(contentView).offset(64 + 20 * screenScale)
            }

               make.left.equalTo(30 * screenScale)
               make.height.equalTo(25 * screenScale)
               make.right.equalTo(-30 * screenScale)
              
           }
        
        let summaryBtn = UIButton(type: .custom)
        summaryBtn.setTitle("总结", for: .normal)
        summaryBtn.backgroundColor = .gray
        summaryBtn.tag = 0x100001
        summaryBtn.layer.masksToBounds = true
        summaryBtn.layer.cornerRadius = 8
        summaryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        summaryBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(summaryBtn)
        summaryBtn.snp.makeConstraints { (make) in
            make.top.equalTo(stringBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(stringBtn)
             make.bottom.equalToSuperview().offset(-10 * screenScale)//必须加这一句最后，否则scrollView不起效果
        }
        
        
    }
    
    @objc func buttonClicked(_sender:UIButton) {
        if _sender.tag == 0x100000 {
            let stringVC = StringUsageViewController()
            self.navigationController?.pushViewController(stringVC, animated: true)
            //self.present(stringVC, animated: true, completion: nil)
        } else if _sender.tag == 0x100001 {
            let summaryVC = SummaryViewController()
            self.navigationController?.pushViewController(summaryVC, animated: true)
        }
    }


}

