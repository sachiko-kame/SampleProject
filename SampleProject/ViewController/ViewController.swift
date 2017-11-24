//
//  ViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sampleModel = SampleModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func loadView() {
        self.view = SampleView(model: sampleModel)
        sampleModel.data{ response in
            if(response == "成功"){
                (self.view as! SampleView).tableView.reloadData()
            }else{
                (self.view as! SampleView).tableView.isHidden = true
            }
        }
    }


}

