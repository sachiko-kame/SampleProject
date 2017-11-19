//
//  BaseRequest.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit
import APIKit

protocol Sample: Request {
    
}

extension Sample {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard (200..<300).contains(urlResponse.statusCode) else {
            throw SampleError(object: object)
        }
        
        return object
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try response(from: object, urlResponse: urlResponse)
     }

}

struct SampleError: Error {
    let message: String
    
    init(object: Any) {
        let dictionary = object as? [String: Any]
        message = dictionary?["message"] as? String ?? "Unknown error occurred"
    }
}
