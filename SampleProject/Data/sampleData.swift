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
        Session.send(request) { result in
            switch result {
            case .success(let response):
                handler(.success(response))
            
            case .failure(.responseError(let responseError as SampleError)):
                print("response error: \(responseError)")
                handler(.failure(.responseError(responseError)))
            
            case .failure(let error):
                print("error: \(error)")
                handler(.failure(error))
            }
        }
    }
}

