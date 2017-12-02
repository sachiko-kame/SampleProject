//
//  ViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate{

    let sampleModel = SampleModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func loadView() {
        self.view = SampleView(model: sampleModel)
        (self.view as! SampleView).tableView.delegate   = self
    }
        
    //タップされた時に呼ばれる
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let qiitaViewController = QiitaViewController()
            self.navigationController?.pushViewController(qiitaViewController, animated: true)
        default:
            print("🌼")
        }
    }
    
    //セルの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }


}

