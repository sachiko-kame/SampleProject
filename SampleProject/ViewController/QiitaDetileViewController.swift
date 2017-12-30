//
//  QiitaDetileViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/11.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class QiitaDetileViewController: UIViewController{
    
    var qiitaItem:Qiita?
    @IBOutlet weak var qiitaImage: UIImageView!
    @IBOutlet weak var qiitaTextView: UITextView!
    @IBOutlet weak var urlTextView: UITextView!
    @IBOutlet weak var UserNameLabel: UILabel!
    
    convenience init(Item:Qiita) {
        self.init()
        self.qiitaItem = Item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //キーボード編集不可
        qiitaTextView.isEditable = false
        urlTextView.isEditable = false
        
        sampleData.sample(request: QiitaDetileRequest(ID:(self.qiitaItem?.id)!)){ response in
            switch response{
            case .success(let response):
                self.qiitaViewMake(response:response)
                print("qiita詳細取得")
            case .failure(.responseError(let responseError as SampleError)):
                print("サーバーの通信による失敗\(responseError)")
            case .failure(.connectionError(_)):
                print("通信失敗")
            case .failure(.requestError(_)):
                print("とにかく失敗")
            case .failure( _):
                print("エラー")
            }
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func qiitaViewMake(response:QiitaDetileitem){
        UserNameLabel.text = response.user["id"] as? String
        UserNameLabel.adjustsFontSizeToFitWidth = true
        
        let imgURL = URL(string: response.userimage)!
        let session = URLSession(configuration: .default)
        let download = session.dataTask(with: imgURL) { (data, response, error) in
            if (response as? HTTPURLResponse) != nil{
                if let imageData = data {
                    DispatchQueue.main.async {
                        let imageimage = UIImage(data: imageData)
                        self.qiitaImage.image = imageimage
                    }
                }
            }
        }
        session.invalidateAndCancel()
        download.resume()
        
        let htmlData = response.rendered.data(using: String.Encoding.utf8, allowLossyConversion:true)!
        let attributedOptions : [NSAttributedString.DocumentReadingOptionKey: Any] = [
            NSAttributedString.DocumentReadingOptionKey(rawValue: NSAttributedString.DocumentAttributeKey.documentType.rawValue): NSAttributedString.DocumentType.html as AnyObject,
            NSAttributedString.DocumentReadingOptionKey(rawValue: NSAttributedString.DocumentAttributeKey.characterEncoding.rawValue): String.Encoding.utf8.rawValue as AnyObject
        ]
        
        // 文字列の変換処理
        var attributedString:NSAttributedString?
        do {
            attributedString = try NSAttributedString(
                data: htmlData,
                options: attributedOptions,
                documentAttributes: nil
            )
            qiitaTextView.attributedText = attributedString
        } catch let e {
            qiitaTextView.text = e.localizedDescription
        }
        
        urlTextView.text = response.url
    }

}
