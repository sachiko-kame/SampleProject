//
//  OrignalRequest.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/30.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit
import APIKit

struct OrignalRequest: Sample {
    var base:String = ""
    var Method:Int = 0
    var Path:String = ""
    
    typealias Response = OrignalItem
    
    init(baseURL:String,
         method:Int,
         path:String){
        
        self.base = baseURL
        self.Method = method
        self.Path = path
        
    }

    var baseURL: URL {
        if(self.base.contains("https://")){
            return URL(string: self.base)!
        }else{
            return URL(string: "https://")!
        }
    }
    
    var method: HTTPMethod {
        switch Method {
        case 0:
            return .get
        default:
            return .post
        }
    }
    
    var path: String {
        return self.Path
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return OrignalItem(object: object)
    }
}


struct OrignalItem {
    let Itemobject:Any?
    
    init(object: Any?){
        self.Itemobject = object ?? ""
    }
}

