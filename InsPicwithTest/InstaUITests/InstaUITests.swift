//
//  InstaUITests.swift
//  InstaUITests
//
//  Created by Simiao Wang on 4/21/23.
//

import XCTest

final class InstaUITests: XCTestCase {

   
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Take a pic"].tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        
        let window = app.children(matching: .window).element(boundBy: 0)
        window.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        window.children(matching: .other).element(boundBy: 0).tap()
        
        let app2 = app
        let title = app.textFields["Title for Image"]
        XCTAssert(title.exists)
        app2.textFields["Title for Image"].tap()
        title.typeText("photo 1")
        
        let takepicbutton = app2.staticTexts["Take a Pic"]
        XCTAssert(takepicbutton.exists)
        takepicbutton.tap()
        
        app.alerts["Take a picture"].scrollViews.otherElements.buttons["Photo Library"].tap()
        app2.scrollViews.otherElements.images["Photo, March 30, 2018, 12:14 PM"].tap()
        
        let locationb = app2.staticTexts["Get location"]
        XCTAssert(locationb.exists)
        app2/*@START_MENU_TOKEN@*/.staticTexts["Get location"]/*[[".buttons[\"Get location\"].staticTexts[\"Get location\"]",".staticTexts[\"Get location\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2.staticTexts["Upload"].tap()
        tabBar.buttons["Home"].tap()
        app.tables.cells.containing(.staticText, identifier:"photo 1").element.swipeUp()
        app.tables.cells.containing(.staticText, identifier:"photo 1").element.swipeUp()
        app.tables.cells.containing(.staticText, identifier:"photo 1").element.swipeUp()
        app.tables.cells.containing(.staticText, identifier:"photo 1").element.swipeUp()


        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    

    
        
    
}
