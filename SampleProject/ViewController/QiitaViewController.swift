//
//  QiitaViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/02.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class QiitaViewController: UIViewController {

    let qiitaModel = QiitaModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func loadView() {
        self.view = QiitaView(model: qiitaModel)
        qiitaModel.data{ response in
            if(response == "成功"){
                (self.view as! QiitaView).loadView?.removeFromSuperview()
                (self.view as! QiitaView).tableView.reloadData()
            }else{
                (self.view as! QiitaView).loadView?.removeFromSuperview()
                (self.view as! QiitaView).errorView?.CauseLabel.text = response
                (self.view as! QiitaView).tableView.isHidden = true
            }
        }
    }
}
