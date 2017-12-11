//
//  QiitaDetileViewController.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/11.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class QiitaDetileViewController: UIViewController {

    var qiitaimagUrl:String?
    var qiitaText:String?
    var urlText:String?
    @IBOutlet weak var qiitaImage: UIImageView!
    @IBOutlet weak var qiitaTextView: UITextView!
    @IBOutlet weak var urlTextView: UITextView!
    
    convenience init(Item:Qiita) {
        self.init()
        self.qiitaimagUrl = Item.profile_image_url
        self.qiitaText = Item.title
        self.urlText = Item.url
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qiitaTextView.text = self.qiitaText
        urlTextView.text = self.urlText
        
        let imgURL = URL(string: self.qiitaimagUrl!)!
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
