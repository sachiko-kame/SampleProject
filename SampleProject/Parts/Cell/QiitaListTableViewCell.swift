//
//  QiitaListTableViewCell.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/29.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit

class QiitaListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var url: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let height:CGFloat = 80

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(SetValue:Qiita){
        self.Title.text = SetValue.title
        self.url.text = SetValue.url
        self.url.attributedText = self.attribute(text:SetValue.url)
    
        let imgURL = URL(string: SetValue.profile_image_url)!
        let session = URLSession(configuration: .default)
        let download = session.dataTask(with: imgURL) { (data, response, error) in
            if (response as? HTTPURLResponse) != nil{
                if let imageData = data {
                    DispatchQueue.main.async {
                        let imageimage = UIImage(data: imageData)
                        self.userImage.image = imageimage
                    }
                }
            }
        }
        session.invalidateAndCancel()
        download.resume()

    }
    
}
