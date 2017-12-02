//
//  QiitaView.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class QiitaView: UIView {
    
    let tableView = UITableView()
    let ErrorView = UIView()
    var loadView:loaddingView?
    
    //ここで入れたいものを入れる
    required init(model: QiitaModel) {
        super.init(frame: CGRect.zero);

        loadView = Bundle.main.loadNibNamed("loaddingView", owner: self, options: nil)!.first! as? loaddingView
        loadView?.IndicatorView.startAnimating()
          
        self.addSubview(ErrorView)
        self.addSubview(tableView)
        self.addSubview(loadView!)
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
        loadView?.frame = self.frame
        ErrorView.frame = self.frame
        tableView.frame = self.frame
    }
}
