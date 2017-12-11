//
//  NSObjectExtension.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/30.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
    
    func attribute(text:String) -> NSAttributedString? {
        
        let stringAttributes: [NSAttributedStringKey : Any] = [
            .foregroundColor : UIColor.blue,
            .font : UIFont.systemFont(ofSize: 13.0),
            .kern:2.0
        ]
        let string = NSAttributedString(string: text, attributes:stringAttributes)
        return string
    }
}

