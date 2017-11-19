//
//  SampleView.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class SampleView: UIView {
    
    let tableView = UITableView()
    let ErrorView = UIView()
    
    //ここで入れたいものを入れる
    required init(model: SampleModel) {
        super.init(frame: CGRect.zero);
        self.addSubview(ErrorView)
        self.addSubview(tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        self.tableView.delegate = model
        self.tableView.dataSource = model
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //大きさの調節.Viewの操作を行う
    override func layoutSubviews() {
        super.layoutSubviews()
        ErrorView.backgroundColor = UIColor.green
        ErrorView.frame = self.frame
        tableView.frame = self.frame
    }
    
    func errorView(){
        self.tableView.isHidden = true
    }
}
