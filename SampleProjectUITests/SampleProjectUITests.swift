//
//  SampleProjectUITests.swift
//  SampleProjectUITests
//
//  Created by 水野祥子 on 2017/11/19.
//  Copyright © 2017年 sachiko. All rights reserved.
//

import XCTest
@testable import SampleProject

//import文書く
//testつけて関数書く
//行う関数の中にカーソル入れる
//あかポチョ表示されるはずなのであかポチョおす
//シュミレーターで行いたい行動する。
//赤ポチョおす
//後は関数の隣のやつ再生OK
class SampleProjectUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testrequest(){
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["OrignalRequest"]/*[[".cells.staticTexts[\"OrignalRequest\"]",".staticTexts[\"OrignalRequest\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"SampleProject.OrignalView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0)
        element.children(matching: .other).element(boundBy: 0).buttons["sample"].tap()
        element.children(matching: .other).element(boundBy: 1).buttons["sample"].tap()
        app.buttons["表示"].tap()
        
        let button = app.buttons["表示の切り替え"]
        button.tap()
        button.tap()
        app.navigationBars["SampleProject.OrignalView"].buttons["Back"].tap()
    }
    
    func testqiitaShow(){
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"qiita").staticTexts["detailText"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["https://qiita.com/_kazuki_o/items/3579f6a8a8261d223603"]/*[[".cells.staticTexts[\"https:\/\/qiita.com\/_kazuki_o\/items\/3579f6a8a8261d223603\"]",".staticTexts[\"https:\/\/qiita.com\/_kazuki_o\/items\/3579f6a8a8261d223603\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let link = app.textViews.containing(.link, identifier:"￼").children(matching: .link).matching(identifier: "￼").element(boundBy: 0)
        link.swipeUp()
        link.swipeUp()
        link.swipeUp()
        app.navigationBars["SampleProject.QiitaDetileView"].buttons["Back"].tap()
        app.navigationBars["SampleProject.QiitaView"].buttons["Back"].tap()
        
    }
    
    
}
