//
//  OrignalViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/30.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class OrignalViewController: UIViewController, UITextFieldDelegate {
    
    var Method:Int = 0

    @IBOutlet weak var BaseURlTextField: UITextField!
    @IBOutlet weak var PathTextField: UITextField!
    @IBOutlet weak var MethodsegmentsControl: UISegmentedControl!
    
    @IBOutlet weak var ResponseShowTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        BaseURlTextField.delegate = self
        PathTextField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func BaseURlSampleTap(_ sender: Any) {
        BaseURlTextField.text = "https://qiita.com"
    }
    
    
    @IBAction func PathTextSampleTap(_ sender: Any) {
        PathTextField.text = "/api/v2/tags"
    }
    

    @IBAction func ShowAction(_ sender: Any) {
        ResponseShowTextView.text = "plase wait..."
        sampleData.sample(request: OrignalRequest(baseURL:BaseURlTextField.text!,
                                                  method:self.Method,
                                                  path:PathTextField.text!)
        ){ response in
            switch response{
            case .success(let response):
                self.ResponseShowTextView.text = "\(response)"
            case .failure(.responseError(let responseError as SampleError)):
                self.ResponseShowTextView.text = "サーバーの通信による失敗\(responseError)"
            case .failure(.connectionError(_)):
                self.ResponseShowTextView.text = "通信失敗"
            case .failure(.requestError(_)):
                self.ResponseShowTextView.text = "とにかく失敗"
            case .failure( _):
                self.ResponseShowTextView.text = "エラー"
            }
        }
    }
    @IBAction func MethodsegmentsSelect(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Method = 0
        default:
            Method = 1
        }
    }
}
