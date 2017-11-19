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
        
    
        sampleData.sample(request: SampleRequest()){ response in
            if(response.value != nil){
                print(String(describing: response.value?.limit))
            }else{
                print("レスポンスに失敗")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func loadView() {
        self.view = SampleView(model: sampleModel)
    }


}

