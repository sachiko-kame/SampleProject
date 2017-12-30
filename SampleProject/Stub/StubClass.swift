//
//  StubClass.swift
//  SampleProject
//
//  Created by 水野祥子 on 2017/12/30.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import OHHTTPStubs

class StubClass: NSObject {
    
    func jsonData(object:Any) -> Data?{
        var Data:Data
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: [])
            Data = jsonData
            return Data
        } catch let error {
            print(error)
            return nil
        }
    }
    
    func stubMake1(){
        stub(condition:isHost("mywebservice.com")) { _ in
            let obj = ["key1":"value1", "key2":""] as Any
            return OHHTTPStubsResponse(data: self.jsonData(object:obj)!, statusCode:200, headers:nil)
        }
    }
    
    func stubMake2(){
        stub(condition:isHost("myweb.com")) { _ in
            let obj = ["おはようございます"]
            return OHHTTPStubsResponse(data: self.jsonData(object:obj)!, statusCode:200, headers:nil)
        }
    }
    
    func Allmake(){
        self.stubMake1()
        self.stubMake2()
    }
   
}
