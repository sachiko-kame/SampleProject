//
//  QiitaViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/02.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class QiitaViewController: UIViewController,UITableViewDelegate {

    let qiitaModel = QiitaModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func loadView() {
        self.view = QiitaView(model: qiitaModel)
        (self.view as! QiitaView).tableView.delegate = self
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(QiitaDetileViewController(Item:qiitaModel.geItems(indexPath: indexPath as NSIndexPath)), animated: true)
    }
}
