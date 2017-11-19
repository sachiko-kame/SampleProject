//
//  SampleModel.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class SampleModel: NSObject, UITableViewDelegate, UITableViewDataSource{

    private var Items: Array<Int> = []
    
    //Cellの総数を返すデータソースメソッド.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.count
    }
    
    //タップされた時に呼ばれる
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        print("\(Items[indexPath.row])")
    }
    
    //Cellに値を設定するデータソースメソッド.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel!.text = "\(Items[indexPath.row])"
        
        return cell
    }
    
    //セルの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func data(handler:@escaping () -> ()){
        sampleData.sample(request: SampleRequest()){ response in
            if(response.value != nil){
                self.Items = [(response.value?.limit)!]
                handler()
            }else{
                print("レスポンスに失敗")
                handler()
            }
            
        }
    }
}
