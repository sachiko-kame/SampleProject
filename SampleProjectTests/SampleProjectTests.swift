//
//  SampleProjectTests.swift
//  SampleProjectTests
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import XCTest
@testable import SampleProject
//https://qiita.com/hmhmsh/items/a0289263b8ed2e1f808f
//https://qiita.com/shirochan/items/10271912289dc563cc36
class SampleProjectTests: XCTestCase {
    
    func testMySample() {
        let Sample = sampleData.sam()
        XCTAssertEqual(Sample, 7)
        
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
