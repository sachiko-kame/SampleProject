//
//  QiitaDetileRequest.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/30.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit
import APIKit

struct QiitaDetileRequest: Sample {
    var id:String
    typealias Response = QiitaDetileitem
    
    init(ID:String){
        self.id = ID
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/api/v2/items/\(self.id)"
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try QiitaDetileitem(object: object)
    }
}

struct QiitaDetileitem {
    let QiitaDetileobject:[String:Any]
    let rendered:String
    let likes:Int
    let tags:Array<[String:Any]>
    let tagCount:Int
    let title:String
    let url:String
    let updated_at:String
    let user:[String:Any]
    let userimage:String
    
    init(object: Any) throws {
        guard let QiitaDetileobject = object as? [String:Any],
              let rendered = QiitaDetileobject["rendered_body"] as? String,
              let likes = QiitaDetileobject["likes_count"] as? Int,
              let tags = QiitaDetileobject["tags"] as? Array<[String:Any]>,
              let title = QiitaDetileobject["title"] as? String,
              let url = QiitaDetileobject["url"] as? String,
              let updated_at = QiitaDetileobject["updated_at"] as? String,
              let user = QiitaDetileobject["user"] as? [String:Any],
              let userimage = user["profile_image_url"] as? String else {
            throw ResponseError.unexpectedObject(object)
        }
        
        self.QiitaDetileobject = QiitaDetileobject
        self.rendered = rendered
        self.likes = likes
        self.tags = tags
        self.title = title
        self.url = url
        self.updated_at = updated_at
        self.user = user
        self.userimage = userimage
        self.tagCount = self.tags.count
    }
}

