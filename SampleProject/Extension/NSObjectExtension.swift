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
}

