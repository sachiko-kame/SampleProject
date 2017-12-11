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
        return URL(string: "https://qiita.com")!
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard (200..<300).contains(urlResponse.statusCode) else {
            throw SampleError(object: object, code:urlResponse.statusCode)
        }
        
        return object
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try response(from: object, urlResponse: urlResponse)
     }
    

}

struct SampleRequestManager<_Request:Sample>:Request{
    typealias Response = _Request.Response
    
    let request:_Request
    
    init(request:_Request){
        self.request = request
    }
    
//    var headerFields: [String: String]{
//        return ["Authorization":"??? 123"]
//    }
    
    var baseURL: URL{
        return self.request.baseURL
    }
    
    var method: HTTPMethod{
        return self.request.method
    }
    
    var path: String{
        return self.request.path
    }
    
    var parameters: Any?{
        return self.request.parameters
    }

    func intercept(urlRequest: URLRequest) throws -> URLRequest{
        return try self.request.intercept(urlRequest: urlRequest)
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any{
        return try self.request.intercept(object: object, urlResponse: urlResponse)
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response{
        return try self.request.response(from: object, urlResponse: urlResponse)
    }
}

struct SampleError: Error {
    let statusCode:Int
    let type:String
    let message:String
    
    init(object: Any, code:Int) {
        let dictionary = object as? [String: Any]
        self.statusCode = code
        self.type = dictionary!["type"] as! String
        self.message = dictionary!["message"] as! String
    
    }
}
