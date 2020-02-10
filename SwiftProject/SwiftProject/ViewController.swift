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
        
        let closureBtn = UIButton(type: .custom)
        closureBtn.setTitle("闭包", for: .normal)
        closureBtn.backgroundColor = .gray
        closureBtn.tag = 0x100001
        closureBtn.layer.masksToBounds = true
        closureBtn.layer.cornerRadius = 8
        closureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        closureBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(closureBtn)
        closureBtn.snp.makeConstraints { (make) in
           make.top.equalTo(stringBtn.snp.bottom).offset(10 * screenScale)
           make.height.right.left.equalTo(stringBtn)
        }
        
        let collectionBtn = UIButton(type: .custom)
        collectionBtn.setTitle("集合", for: .normal)
        collectionBtn.backgroundColor = .green
        collectionBtn.tag = 0x100002
        collectionBtn.layer.masksToBounds = true
        collectionBtn.layer.cornerRadius = 8
        collectionBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        collectionBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(collectionBtn)
        collectionBtn.snp.makeConstraints { (make) in
            make.top.equalTo(closureBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(closureBtn)
        }
        
        let ctlFlowBtn = UIButton(type: .custom)
        ctlFlowBtn.setTitle("控制流", for: .normal)
        ctlFlowBtn.backgroundColor = .red
        ctlFlowBtn.tag = 0x100003
        ctlFlowBtn.layer.masksToBounds = true
        ctlFlowBtn.layer.cornerRadius = 8
        ctlFlowBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        ctlFlowBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(ctlFlowBtn)
        ctlFlowBtn.snp.makeConstraints { (make) in
            make.top.equalTo(collectionBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(collectionBtn)
        }
        
        let enumBtn = UIButton(type: .custom)
        enumBtn.setTitle("枚举", for: .normal)
        enumBtn.backgroundColor = .lightGray
        enumBtn.tag = 0x100004
        enumBtn.layer.masksToBounds = true
        enumBtn.layer.cornerRadius = 8
        enumBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        enumBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(enumBtn)
        enumBtn.snp.makeConstraints { (make) in
            make.top.equalTo(ctlFlowBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(collectionBtn)
        }
        
        let functionBtn = UIButton(type: .custom)
        functionBtn.setTitle("功能", for: .normal)
        functionBtn.backgroundColor = .brown
        functionBtn.tag = 0x100005
        functionBtn.layer.masksToBounds = true
        functionBtn.layer.cornerRadius = 8
        functionBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        functionBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(functionBtn)
        functionBtn.snp.makeConstraints { (make) in
            make.top.equalTo(enumBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(collectionBtn)
        }
        
        let structClassBtn = UIButton(type: .custom)
        structClassBtn.setTitle("结构和类", for: .normal)
        structClassBtn.backgroundColor = .purple
        structClassBtn.tag = 0x100006
        structClassBtn.layer.masksToBounds = true
        structClassBtn.layer.cornerRadius = 8
        structClassBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        structClassBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(structClassBtn)
        structClassBtn.snp.makeConstraints { (make) in
            make.top.equalTo(functionBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(functionBtn)
        }
        
        let propertiesBtn = UIButton(type: .custom)
        propertiesBtn.setTitle("属性", for: .normal)
        propertiesBtn.backgroundColor = .darkGray
        propertiesBtn.tag = 0x100007
        propertiesBtn.layer.masksToBounds = true
        propertiesBtn.layer.cornerRadius = 8
        propertiesBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        propertiesBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(propertiesBtn)
        propertiesBtn.snp.makeConstraints { (make) in
            make.top.equalTo(structClassBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(structClassBtn)
        }
        
        let methodBtn = UIButton(type: .custom)
        methodBtn.setTitle("方法", for: .normal)
        methodBtn.backgroundColor = .brown
        methodBtn.tag = 0x100008
        methodBtn.layer.masksToBounds = true
        methodBtn.layer.cornerRadius = 8
        methodBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        methodBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(methodBtn)
        methodBtn.snp.makeConstraints { (make) in
            make.top.equalTo(propertiesBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(propertiesBtn)
        }
        
        let subscriptsBtn = UIButton(type: .custom)
        subscriptsBtn.setTitle("下标", for: .normal)
        subscriptsBtn.backgroundColor = .magenta
        subscriptsBtn.tag = 0x100009
        subscriptsBtn.layer.masksToBounds = true
        subscriptsBtn.layer.cornerRadius = 8
        subscriptsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        subscriptsBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(subscriptsBtn)
        subscriptsBtn.snp.makeConstraints { (make) in
            make.top.equalTo(methodBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(methodBtn)
        }
        
        let inheirtanceBtn = UIButton(type: .custom)
        inheirtanceBtn.setTitle("继承", for: .normal)
        inheirtanceBtn.backgroundColor = .black
        inheirtanceBtn.tag = 0x100010
        inheirtanceBtn.layer.masksToBounds = true
        inheirtanceBtn.layer.cornerRadius = 8
        inheirtanceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        inheirtanceBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
      contentView.addSubview(inheirtanceBtn)
      inheirtanceBtn.snp.makeConstraints { (make) in
         make.top.equalTo(subscriptsBtn.snp.bottom).offset(10 * screenScale)
         make.height.right.left.equalTo(stringBtn)
      }
      
          let initBtn = UIButton(type: .custom)
          initBtn.setTitle("初始化", for: .normal)
            initBtn.backgroundColor = .darkGray
          initBtn.tag = 0x100011
          initBtn.layer.masksToBounds = true
          initBtn.layer.cornerRadius = 8
          initBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
          initBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
          contentView.addSubview(initBtn)
          initBtn.snp.makeConstraints { (make) in
              make.top.equalTo(inheirtanceBtn.snp.bottom).offset(10 * screenScale)
              make.height.right.left.equalTo(inheirtanceBtn)
          }
          
          let deinitBtn = UIButton(type: .custom)
          deinitBtn.setTitle("销毁初始化", for: .normal)
            deinitBtn.backgroundColor = .orange
          deinitBtn.tag = 0x100012
          deinitBtn.layer.masksToBounds = true
          deinitBtn.layer.cornerRadius = 8
          deinitBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
          deinitBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
          contentView.addSubview(deinitBtn)
          deinitBtn.snp.makeConstraints { (make) in
              make.top.equalTo(initBtn.snp.bottom).offset(10 * screenScale)
              make.height.right.left.equalTo(initBtn)
          }
          
          let optinalChainingBtn = UIButton(type: .custom)
          optinalChainingBtn.setTitle("可选链接", for: .normal)
          optinalChainingBtn.backgroundColor = .darkText
          optinalChainingBtn.tag = 0x100013
          optinalChainingBtn.layer.masksToBounds = true
          optinalChainingBtn.layer.cornerRadius = 8
          optinalChainingBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
          optinalChainingBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
          contentView.addSubview(optinalChainingBtn)
          optinalChainingBtn.snp.makeConstraints { (make) in
              make.top.equalTo(deinitBtn.snp.bottom).offset(10 * screenScale)
              make.height.right.left.equalTo(deinitBtn)
          }
          
          let errorHandleBtn = UIButton(type: .custom)
          errorHandleBtn.setTitle("错误处理", for: .normal)
          errorHandleBtn.backgroundColor = .brown
          errorHandleBtn.tag = 0x100014
          errorHandleBtn.layer.masksToBounds = true
          errorHandleBtn.layer.cornerRadius = 8
          errorHandleBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
          errorHandleBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
          contentView.addSubview(errorHandleBtn)
          errorHandleBtn.snp.makeConstraints { (make) in
              make.top.equalTo(optinalChainingBtn.snp.bottom).offset(10 * screenScale)
              make.height.right.left.equalTo(optinalChainingBtn)
          }
          
          let typeCastingBtn = UIButton(type: .custom)
          typeCastingBtn.setTitle("型铸", for: .normal)
          typeCastingBtn.backgroundColor = .purple
          typeCastingBtn.tag = 0x100015
          typeCastingBtn.layer.masksToBounds = true
          typeCastingBtn.layer.cornerRadius = 8
          typeCastingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
          typeCastingBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
          contentView.addSubview(typeCastingBtn)
          typeCastingBtn.snp.makeConstraints { (make) in
              make.top.equalTo(errorHandleBtn.snp.bottom).offset(10 * screenScale)
              make.height.right.left.equalTo(errorHandleBtn)
          }
          
          let nestedTypeBtn = UIButton(type: .custom)
          nestedTypeBtn.setTitle("嵌套类型", for: .normal)
          nestedTypeBtn.backgroundColor = .blue
          nestedTypeBtn.tag = 0x100016
          nestedTypeBtn.layer.masksToBounds = true
          nestedTypeBtn.layer.cornerRadius = 8
          nestedTypeBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
          nestedTypeBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
          contentView.addSubview(nestedTypeBtn)
          nestedTypeBtn.snp.makeConstraints { (make) in
              make.top.equalTo(typeCastingBtn.snp.bottom).offset(10 * screenScale)
              make.height.right.left.equalTo(typeCastingBtn)
          }
          
          let extensionBtn = UIButton(type: .custom)
          extensionBtn.setTitle("扩展", for: .normal)
          extensionBtn.backgroundColor = .brown
          extensionBtn.tag = 0x100017
          extensionBtn.layer.masksToBounds = true
          extensionBtn.layer.cornerRadius = 8
          extensionBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
          extensionBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
          contentView.addSubview(extensionBtn)
          extensionBtn.snp.makeConstraints { (make) in
              make.top.equalTo(nestedTypeBtn.snp.bottom).offset(10 * screenScale)
              make.height.right.left.equalTo(nestedTypeBtn)
          }
        
        let protocolsBtn = UIButton(type: .custom)
        protocolsBtn.setTitle("协议", for: .normal)
        protocolsBtn.backgroundColor = .lightGray
        protocolsBtn.tag = 0x100018
        protocolsBtn.layer.masksToBounds = true
        protocolsBtn.layer.cornerRadius = 8
        protocolsBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        protocolsBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(protocolsBtn)
        protocolsBtn.snp.makeConstraints { (make) in
            make.top.equalTo(extensionBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(extensionBtn)
        }
        
        let genticsBtn = UIButton(type: .custom)
        genticsBtn.setTitle("泛型", for: .normal)
        genticsBtn.backgroundColor = .green
        genticsBtn.tag = 0x100019
        genticsBtn.layer.masksToBounds = true
        genticsBtn.layer.cornerRadius = 8
        genticsBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        genticsBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(genticsBtn)
        genticsBtn.snp.makeConstraints { (make) in
             make.top.equalTo(protocolsBtn.snp.bottom).offset(10 * screenScale)
             make.height.right.left.equalTo(protocolsBtn)
         }
     
        let opaqueTypeBtn = UIButton(type: .custom)
        opaqueTypeBtn.setTitle("不透明类型", for: .normal)
        opaqueTypeBtn.backgroundColor = .purple
        opaqueTypeBtn.tag = 0x100020
        opaqueTypeBtn.layer.masksToBounds = true
        opaqueTypeBtn.layer.cornerRadius = 8
        opaqueTypeBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        opaqueTypeBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(opaqueTypeBtn)
        opaqueTypeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(genticsBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(genticsBtn)
        }
        
        let arcBtn = UIButton(type: .custom)
        arcBtn.setTitle("自动参考计数", for: .normal)
        arcBtn.backgroundColor = .cyan
        arcBtn.tag = 0x100021
        arcBtn.layer.masksToBounds = true
        arcBtn.layer.cornerRadius = 8
        arcBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        arcBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(arcBtn)
        arcBtn.snp.makeConstraints { (make) in
            make.top.equalTo(opaqueTypeBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(opaqueTypeBtn)
        }
        
        let mermorySafetyBtn = UIButton(type: .custom)
        mermorySafetyBtn.setTitle("内存安全", for: .normal)
        mermorySafetyBtn.backgroundColor = .red
        mermorySafetyBtn.tag = 0x100022
        mermorySafetyBtn.layer.masksToBounds = true
        mermorySafetyBtn.layer.cornerRadius = 8
        mermorySafetyBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        mermorySafetyBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(mermorySafetyBtn)
        mermorySafetyBtn.snp.makeConstraints { (make) in
            make.top.equalTo(arcBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(arcBtn)
        }
        
        let accessControlBtn = UIButton(type: .custom)
        accessControlBtn.setTitle("访问控制", for: .normal)
        accessControlBtn.backgroundColor = .gray
        accessControlBtn.tag = 0x100023
        accessControlBtn.layer.masksToBounds = true
        accessControlBtn.layer.cornerRadius = 8
        accessControlBtn.titleLabel?.font = UIFont(name: "PingFang-SC-Medium", size: 15)
        accessControlBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(accessControlBtn)
        accessControlBtn.snp.makeConstraints { (make) in
           make.top.equalTo(mermorySafetyBtn.snp.bottom).offset(10 * screenScale)
           make.height.right.left.equalTo(mermorySafetyBtn)
        }
               
       let advancedBtn = UIButton(type: .custom)
       advancedBtn.setTitle("高级操作符", for: .normal)
       advancedBtn.backgroundColor = .magenta
       advancedBtn.tag = 0x100024
       advancedBtn.layer.masksToBounds = true
       advancedBtn.layer.cornerRadius = 8
       advancedBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
       advancedBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
       contentView.addSubview(advancedBtn)
       advancedBtn.snp.makeConstraints { (make) in
           make.top.equalTo(accessControlBtn.snp.bottom).offset(10 * screenScale)
           make.height.right.left.equalTo(accessControlBtn)
       }
        
        let summaryBtn = UIButton(type: .custom)
        summaryBtn.setTitle("总结", for: .normal)
        summaryBtn.backgroundColor = .brown
        summaryBtn.tag = 0x100025
        summaryBtn.layer.masksToBounds = true
        summaryBtn.layer.cornerRadius = 8
        summaryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        summaryBtn.addTarget(self, action: #selector(buttonClicked(_sender:)), for: .touchUpInside)
        contentView.addSubview(summaryBtn)
        summaryBtn.snp.makeConstraints { (make) in
            make.top.equalTo(advancedBtn.snp.bottom).offset(10 * screenScale)
            make.height.right.left.equalTo(advancedBtn)
            make.bottom.equalToSuperview().offset(-10 * screenScale)//必须加这一句最后，否则scrollView不起效果
        }
        
    }
    
    @objc func buttonClicked(_sender:UIButton) {
        if _sender.tag == 0x100000 {
            let stringVC = StringUsageViewController()
            self.navigationController?.pushViewController(stringVC, animated: true)
            //self.present(stringVC, animated: true, completion: nil)
        } else if _sender.tag == 0x100001 {
            let closureVC = ClosureViewController()
            self.navigationController?.pushViewController(closureVC, animated: true)
        } else if _sender.tag == 0x100002 {
            let collectionVC = CollectionViewController()
            self.navigationController?.pushViewController(collectionVC, animated: true)
        } else if _sender.tag == 0x100003 {
            let ctlFlowVC = ControlFlowViewController()
            self.navigationController?.pushViewController(ctlFlowVC, animated: true)
        } else if _sender.tag == 0x100004 {
           let enumVC = EnumerationsViewController()
           self.navigationController?.pushViewController(enumVC, animated: true)
        } else if _sender.tag == 0x100005 {
            let functionVC = FuctionsViewController()
         self.navigationController?.pushViewController(functionVC, animated: true)
        } else if _sender.tag == 0x100006 {
            let structClassVC = StructureAndClassController()
         self.navigationController?.pushViewController(structClassVC, animated: true)
        } else if _sender.tag == 0x100007 {
           let propertiesVC = PropertiesViewController()
           self.navigationController?.pushViewController(propertiesVC, animated: true)
        } else if _sender.tag == 0x100008 {
            let methodVC = MethodViewController()
         self.navigationController?.pushViewController(methodVC, animated: true)
        } else if _sender.tag == 0x100009 {
            let subscriptsVC = SubscriptsViewController()
         self.navigationController?.pushViewController(subscriptsVC, animated: true)
        } else if _sender.tag == 0x100010 {
            let inheirtenceVC = InheritanceViewController()
          self.navigationController?.pushViewController(inheirtenceVC, animated: true)
        } else if _sender.tag == 0x100011 {
            let initVC = InitializationViewController()
            self.navigationController?.pushViewController(initVC, animated: true)
        } else if _sender.tag == 0x100012 {
            let deinitVC = DeinitizationViewController()
            self.navigationController?.pushViewController(deinitVC, animated: true)
        } else if _sender.tag == 0x100013 {
           let optinalVC = OptianalChainingViewController()
           self.navigationController?.pushViewController(optinalVC, animated: true)
        } else if _sender.tag == 0x100014 {
            let errorHandleVC = ErrorHandlingViewController()
         self.navigationController?.pushViewController(errorHandleVC, animated: true)
        } else if _sender.tag == 0x100015 {
            let typeCastingVC = TypeCastingViewController()
         self.navigationController?.pushViewController(typeCastingVC, animated: true)
        } else if _sender.tag == 0x100016 {
           let nestedTypeVC = NestedTypesViewController()
           self.navigationController?.pushViewController(nestedTypeVC, animated: true)
        } else if _sender.tag == 0x100017 {
            let extensionVC = ExtensionsViewController()
         self.navigationController?.pushViewController(extensionVC, animated: true)
        } else if _sender.tag == 0x100018 {
            let protocolVC = ProtocolViewController()
         self.navigationController?.pushViewController(protocolVC, animated: true)
        } else if _sender.tag == 0x100019 {
           let genticsVC = GenericsViewController()
           self.navigationController?.pushViewController(genticsVC, animated: true)
        } else if _sender.tag == 0x100020 {
            let opaqueVC = OpaqueTypesViewController()
         self.navigationController?.pushViewController(opaqueVC, animated: true)
        } else if _sender.tag == 0x100021 {
            let arcVC = ARCViewController()
         self.navigationController?.pushViewController(arcVC, animated: true)
        } else if _sender.tag == 0x100022 {
           let memeroySafetyVC = MermorySafetyViewController()
           self.navigationController?.pushViewController(memeroySafetyVC, animated: true)
        } else if _sender.tag == 0x100023 {
            let accessControlVC = AccessControlViewController()
         self.navigationController?.pushViewController(accessControlVC, animated: true)
        } else if _sender.tag == 0x100024 {
            let advancedVC = AdvancedOperationsViewController()
         self.navigationController?.pushViewController(advancedVC, animated: true)
        } else if _sender.tag == 0x100025 {
            let summaryVC = SummaryViewController()
         self.navigationController?.pushViewController(summaryVC, animated: true)
        }
    }


}

