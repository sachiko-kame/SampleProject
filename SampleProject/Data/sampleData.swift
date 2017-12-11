//
//  sampleData.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import UIKit
import APIKit
import Result

struct sampleData {
    
    static func sample<Request: Sample>(request: Request, handler:@escaping (Result<Request.Response , SessionTaskError>) -> ()){
        Session.send(SampleRequestManager(request:request)) { result in
            switch result {
            case .success(let response):
                handler(.success(response))
            
            case .failure(.responseError(let responseError)):
                handler(.failure(.responseError(responseError)))
            
            case .failure(.requestError(let requestError)):
                handler(.failure(.requestError(requestError)))
                
            case .failure(.connectionError(let connectionError)):
                handler(.failure(.connectionError(connectionError)))
            }
        }
    }
}

