//
//  StringUsageViewController.swift
//  SwiftProject
//
//  Created by Quentin Zang on 2020/1/1.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit

class StringUsageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        stringUsage()
        
        print("-------------------------")
        let whiteSpace = "  : sdfjds   lfjds ''  ''' ,,,,   "
        let b = isAllEmpty(str: whiteSpace)
        print(b)
        
        print("-------------------------")
        let removeHeaderTrailWhiteSpace = removeHeadAndTrailSpace(str: whiteSpace, lindFeed: true)
        print(removeHeaderTrailWhiteSpace)
        
        print("-------------------------")
        let removeAllWhiteSpace = removeAllSpace(str: whiteSpace, linkFeed: true)
        print(removeAllWhiteSpace)
        
        print("-------------------------")
        stringJoint()
        
        print("-------------------------")
        enumChar()
        
        print("-------------------------")
        getStrChar()
        
        print("-------------------------")
        stringOtherUsage()
    }
    
    func stringUsage() {
        
        //使用字符串
        print("-------------------------")
        let stringA = "Hello World!"
        print(stringA)
        
        //String实例化
        print("-------------------------")
        let stringB = String("StringB")
        print(stringB)
       
        // 使用字符串字面量创建空字符串
        print("-------------------------")
        let stringEmpty = ""
        if stringEmpty.isEmpty {
             print( "stringEmpty 是空的" )
        } else {
              print( "stringEmpty 不是空的" )
        }
        
        //通过 Character 类型的数组 创建字符串
        print("-------------------------")
        let nameArr : [Character] = ["Q","u","e","n","t","i","n"]
        let nameStr = String(nameArr)
        print(nameStr)
        
        //获取字符串长度
        //使用bookChi.count来获取字符串长度
        print("-------------------------")
        let booEng : String = "Pride and Prejudice"
        let bookChi : String = "傲慢与偏见"
        print("\(booEng + " 译文： " + bookChi) .... \(bookChi.count)...\(booEng.count)...\(bookChi.utf16.count)")
        
        //显示"string"
        print("-------------------------")
        let string = #""string""#//相当于C#中的@""
        print(string)
        
    }
    
    // MARK: - 判断字符串是否全为空格
    func isAllEmpty(str:String?) -> Bool {
        var isEmpty = false
        let tempString = str ?? ""
        if tempString.count == 0 {
            isEmpty = true
        } else {
            //创建一个字符串对象。包含所有的空格和换行符
            let characterSet = NSCharacterSet.whitespacesAndNewlines
            //从字符串过滤掉首位的空格和换行，得到一个新的字符串
            let trimedString = tempString.trimmingCharacters(in: characterSet)
            //判断新字符串的长度是否为0
            if trimedString.count == 0 {
                isEmpty = true
            }
        }
        
        return isEmpty
    }
    
    // MARK: - 去掉首尾空格,lineFeed:true 表示包含换行符
    func removeHeadAndTrailSpace(str:String?,lindFeed:Bool) -> String {
        let temoString = str ?? ""
        var whitespace = CharacterSet()
        if lindFeed == true {
            whitespace = NSCharacterSet.whitespacesAndNewlines
        } else {
            whitespace = NSCharacterSet.whitespaces
        }
        return temoString.trimmingCharacters(in: whitespace)
    }
    
    // MARK: - 去掉所有空格,lineFeed:true 表示包含换行符
    func removeAllSpace(str:String?,linkFeed:Bool) -> String {
        let tempString = str ?? ""
        if tempString.count == 0 {
           return tempString
        }
        if linkFeed == false {
            return tempString.replacingOccurrences(of: " ", with: "")
        } else {
            let characterSet = NSCharacterSet.whitespacesAndNewlines
            let trimedString = tempString.trimmingCharacters(in: characterSet)
            return trimedString.replacingOccurrences(of: " ", with: "")
        }
    }
    
    // MARK: - 字符串拼接
    func stringJoint() {
        
       let studentNum = "1"//学生的学号
       let studentName = "小龙"//学生的姓名
       print(studentNum+studentName)
       print("\(studentNum):\(studentName)")
        
       let arr = ["星","期","一"]
       //数组转字符串
       let today = arr.joined(separator: "__")//将数组中的数据通过__连接
       print(today)
       ///其他类型的转string
       let num1 = 10
       let num2 = 12
       let str1 = "\(num1)+\(num2)"
       print(str1)
        
    }
    
    // MARK: - 枚举字符
    func enumChar() -> () {
        //遍历
        let myStr = "my name is Jim Green 🌺 我的"
        for char in myStr {
            print(char)
        }
    }
    
    // MARK: - 字符串String拼接,裁剪...
    func getStrChar() -> () {

        let s:String = "SwiftMineStudy"
        //取从开始的位置数index等于3的字符
        let sub0 = s.index(s.startIndex, offsetBy: 3)
        //取从最后的位置数第二个的字符
        let sub1 = s.index(s.endIndex, offsetBy: -2)
        //从sub0的位置开始数接下来的第二位的字符
        let sub2 = s.index(sub0, offsetBy: 2)
        //同上
        let sub3 = s.index(s.startIndex, offsetBy: 2)
        //取sub0之前的一位字符
        let sub4 = s.index(before: sub0)
        //取sub0之后的一位字符
        let sub5 = s.index(after: sub0)
        //取sub0之前的左右字符串
        let sub6 = s.prefix(upTo: sub0)
        //取sub0之后的所有字符串
        let sub7 = s.suffix(from: sub0)
        //拼接,字符需转为字符串
        //lableTest.text = String(s[sub0])+String(s[sub1])+sub6
        //反转字符串
        //lableTest.text = String(s.reversed())
        print(s[sub0],s[sub1],s[sub2],s[sub3],s[sub4],s[sub5],sub6,sub7)
        //字符串换行
        let name = """
                        qweqwe
                        qweqwe
                        sdfsdfsdf
                   """
        print(name)
       
        //字符串区间截取
        //方法一
        let snowy = " Let it snow! "
        let nsrange = NSRange(location: 3, length: 6)
        let start = snowy.index(snowy.startIndex, offsetBy: nsrange.lowerBound)
        let end = snowy.index(snowy.startIndex, offsetBy: nsrange.upperBound)
        let substringRange = start..<end
        print(snowy[substringRange])
        //方法二
        let values = "abcdefg"
        let startSlicingIndex = values.index(values.startIndex, offsetBy: 3)
        let endSlicingIndex = values.index(values.endIndex, offsetBy: -2)
        let subvalues = values[startSlicingIndex...endSlicingIndex] // One-sided Slicing
        //        Range
        print(subvalues)
      
        //字符串前面是否有
        if values .hasPrefix("a") {
            print("有")
        }else{
            print("无")
        }
        //字符串后面是否有
        if values.hasSuffix("a") {
            print("有")
        }else{
            print("没有")
        }

    }
    
    // MARK: - 字符串的其他用法
    func stringOtherUsage() {
        //注意这里是变量
        var str:String = "av,1,2,3,4,5,6,7,8,a,b,c,d,e"
        //获取字符串长度
        print(str.count)
        if str.count>3 {
            print("长度大了")
        }
        //去除字符串中的特殊字符 只能去除一个
        str.remove(at: str.firstIndex(of: ",")!)
        print(str)
        //字符串转数组
        let arr = str.components(separatedBy: ",")
        print(arr)
        //转大写
        let str1 = str.uppercased()
        print(str1)
        //转小写
        let str2 = str.lowercased()
        print(str2)
        //每个单词首字母大写
        let str3 = str.capitalized
        print(str3)
        //字符串替换
        let str4 = str.replacingOccurrences(of: ",", with: "")
        print(str4)
        //判断是否包含某个字符串
        if str.range(of: "av") != nil {
            print("包含")
        }
        if str == str3 {
            print("相等")
        }else{
            print("不相等")
        }
        //转int
        let str5 = "123"
        let intNum:Int = Int(str5)!
        print(intNum + 3)
        
        
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
