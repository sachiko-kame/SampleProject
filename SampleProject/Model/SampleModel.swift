//
//  SampleModel.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class SampleModel: NSObject, UITableViewDelegate, UITableViewDataSource{

    private var Items: Array<String> = []
    
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
    
    func data(handler:@escaping (_ text:String) -> ()){
        sampleData.sample(request: SampleRequest()){ response in
            switch response{
            case .success(let response):
                
                for item in response.QiitaArray{
                    let Qiitaitem = Qiita(Item:item)
                    self.Items.append(Qiitaitem.title)
                }
                handler("成功")
            case .failure(.responseError(let responseError)):
                handler("失敗\(responseError.localizedDescription)")
            case .failure(.connectionError(_)):
                handler("通信失敗")
            case .failure(.requestError(_)):
                handler("とにかく失敗")
            }
        }
    }
}
