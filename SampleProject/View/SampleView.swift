//
//  SampleView.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/02.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class SampleView: UIView {
    
    let tableView = UITableView()

    //ここで入れたいものを入れる
    required init(model: SampleModel) {
        super.init(frame: CGRect.zero);
        tableView.accessibilityHint = "sampletatable"
        self.addSubview(tableView)
        self.tableView.dataSource = model
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //大きさの調節.Viewの操作を行う
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = self.frame
    }

}
