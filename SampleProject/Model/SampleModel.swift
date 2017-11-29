//
//  SampleModel.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class SampleModel: NSObject, UITableViewDelegate, UITableViewDataSource{

    private var Items: Array<Qiita> = []
    
    //Cellの総数を返すデータソースメソッド.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.count
    }
    
    //タップされた時に呼ばれる
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        print("\(Items[indexPath.row].username)さんの記事")
    }
    
    //Cellに値を設定するデータソースメソッド.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        tableView.register(cellType: QiitaListTableViewCell.self)
        tableView.register(cellTypes: [QiitaListTableViewCell.self, QiitaListTableViewCell.self])
        
        let cell = tableView.dequeueReusableCell(with: QiitaListTableViewCell.self, for: indexPath)
        cell.setCell(SetValue: self.Items[indexPath.row])
        return cell
    }
    
    //セルの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return QiitaListTableViewCell.height
    }
    
    func data(handler:@escaping (_ text:String) -> ()){
        sampleData.sample(request: SampleRequest()){ response in
            switch response{
            case .success(let response):
                
                for item in response.QiitaArray{
                    let Qiitaitem = Qiita(Item:item)
                    self.Items.append(Qiitaitem)
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
