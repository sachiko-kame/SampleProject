//
//  SampleTestClass.swift
//  SampleProjectTests
//
//  Created by 水野祥子 on 2017/12/30.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import XCTest
@testable import SampleProject
//https://qiita.com/hmhmsh/items/a0289263b8ed2e1f808f
//https://qiita.com/shirochan/items/10271912289dc563cc36
class SampleTestClass: XCTestCase {
    
    func testMySample() {
        let Sample = sampleData.sam()
        XCTAssertEqual(Sample, 7)
    
    }
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
    
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
