//
//  ErrorView.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/03.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class ErrorView: UIView {

    @IBOutlet weak var CauseLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        self.frame.size.height = mainFame.height
        self.frame.size.width = mainFame.width
    }

}
