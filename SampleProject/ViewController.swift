//
//  ViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        sampleData.sample(request: SampleRequest()){ response in
            if(response.value != nil){
                print(String(describing: response.value?.limit))
            }else{
                print("レスポンスに失敗")
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

