//
//  SampleTestClass.swift
//  SampleProjectTests
//
//  Created by 水野祥子 on 2017/12/30.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import XCTest
@testable import SampleProject

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
