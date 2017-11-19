//
//  CGRectExtension.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

extension CGRect {
    var width: CGFloat {
        get {
            return self.size.width
        }
        set {
            self.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.size.height
        }
        set {
            self.size.height = newValue
        }
    }
}

