//
//  SampleRequest.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit
import APIKit

struct SampleRequest: Sample {
    typealias Response = QiitaItem
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/api/v2/items"
    }
    
    var parameters: [String: Any] {
        
        return [
            "page": "1",
            "per_page": "20"
        ]
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> QiitaItem {
        return try QiitaItem(object: object)
    }
}

struct QiitaItem {
    let QiitaArray:Array<[String:Any]>
    
    init(object: Any) throws {
        guard let DIctionary = object as? Array<[String:Any]> else {
                throw ResponseError.unexpectedObject(object)
        }
        
       self.QiitaArray = DIctionary
    }
}


struct Qiita {
    let title:String
    let updated_at:String
    let url:String
    let comments_count:Int
    let likes_count:Int
    let tags:Array<[String:Any]>
    let user:[String:Any]
    let username:String
    let profile_image_url:String
    
    init(Item:[String:Any]){
        self.title = Item["title"] as! String
        self.updated_at = Item["updated_at"] as! String
        self.url = Item["url"] as! String
        self.comments_count = Item["comments_count"] as! Int
        self.likes_count = Item["likes_count"] as! Int
        self.tags = Item["tags"] as! Array<[String:Any]>
        self.user = Item["user"] as! [String:Any]
        self.username = self.user["name"] as! String
        self.profile_image_url = self.user["profile_image_url"] as! String
 
    }
}
