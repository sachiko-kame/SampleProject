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
    typealias Response = RateLimit
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/rate_limit"
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> RateLimit {
        return try RateLimit(object: object)
    }
}

struct RateLimit {
    let limit: Int
    let remaining: Int
    let resources:[String: Any]
    
    init(object: Any) throws {
        guard let dictionary = object as? [String: Any],
            let rateDictionary = dictionary["rate"] as? [String: Any],
            let resources = dictionary["resources"] as? [String: Any],
            let limit = rateDictionary["limit"] as? Int,
            let remaining = rateDictionary["remaining"] as? Int else {
                throw ResponseError.unexpectedObject(object)
        }
        
        self.limit = limit
        self.remaining = remaining
        self.resources = resources
    }
}
