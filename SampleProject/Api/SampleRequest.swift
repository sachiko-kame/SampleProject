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
    
    init(Item:[String:Any]){
        self.title = Item["title"] as! String
    }
}
