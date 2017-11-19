//
//  SampleView.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class SampleView: UIView {

    let redView = UIView()
    let tableView = UITableView()
    
    //ここで入れたいものを入れる
    required init(model: SampleModel) {
        super.init(frame: CGRect.zero);
        self.addSubview(tableView)
        self.addSubview(redView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //大きさの調節.Viewの操作を行う
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = self.frame
        redView.frame = CGRect(x:0, y:0, width:100, height:100)
        redView.backgroundColor = UIColor.red
    }
}
