//
//  OrignalViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/30.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class OrignalViewController: UIViewController, UITextFieldDelegate{
    
    var Method:Int = 0

    @IBOutlet weak var showchange: NSLayoutConstraint!
    @IBOutlet weak var BaseURlTextField: UITextField!
    @IBOutlet weak var PathTextField: UITextField!
    @IBOutlet weak var MethodsegmentsControl: UISegmentedControl!
    
    @IBOutlet weak var ResponseShowTextView: UITextView!
    
    @IBOutlet weak var showButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BaseURlTextField.delegate = self
        PathTextField.delegate = self
        ResponseShowTextView.isEditable = false
        
//        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
//        kbToolBar.barStyle = UIBarStyle.default
//        kbToolBar.sizeToFit()
//        // 閉じるボタン
//        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(buttonTap(sender:)))
//
//        kbToolBar.items = [commitButton]
//        ResponseShowTextView.inputAccessoryView = kbToolBar

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

//    @objc func buttonTap(sender: UIButton) {
//        self.view.endEditing(true)
//    }
    
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
    @IBAction func showchangeTap(_ sender: Any) {
        showchange.constant = showchange.constant == 10 ? showchange.constant - showButton.frame.origin.y + showButton.frame.size.height : 10
    }
}
