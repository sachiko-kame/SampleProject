//
//  SampleModel.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/02.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class SampleModel: NSObject, UITableViewDataSource {

    private var Items: Array<String> = ["qiita", "OrignalRequest"]
    
    //Cellの総数を返すデータソースメソッド.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.count
    }
    
    //Cellに値を設定するデータソースメソッド.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
        cell.textLabel?.text = Items[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "detailText"
       
        return cell
    }

}
