//
//  RgSwiftOptionalViewController.swift
//  RogueKitDemo
//
//  Created by Rogue on 16/2/19.
//  Copyright © 2016年 Rogue. All rights reserved.
//

import UIKit

extension Int {

    var add: Int{return self + 20}

}

class RgSwiftOptionalViewController: RogueBaseViewContorller {


    struct sum {
        var a1 = 0, a2 = 0
    }
    
    let a: Int? = 1
    
    
    
    func exchange<T>(inout a: T, inout b: T) {
    
        let temp = a
        a = b
        b = temp
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tempA = "dd"
        var tempB = "www"
        self.exchange(&tempA, b: &tempB)
        print("tempA: \(tempA), tempB: \(tempB)")
        
        
        let tempC = 3.add
        print(tempC)
        
        let number = sum(a1: 20, a2: 40)
        print(number)
        
//        let dd: Bool = a>b?expression used if true : expression used if false
        
//        var dict: [String: String?] = [:]
//        dict = ["key": "value"]
//        print(dict)
//        func just() -> String? {
//            return nil
//        }
//        dict["key"] = .None
//        print(dict)
//        print(a)
//        
//        var myString: String?
//        myString = "hello,world"
//        if let test = myString {
//            print("哈哈哈 \(test)")
//        } else {
//            print("打印失败")
//        }
//    
//        let label = UILabel()
//        label.backgroundColor = .redColor()
//        label.frame = CGRectMake(20, 140, 100, 40)
//        view.addSubview(label)
//        label.text = myString
    }
    
}
