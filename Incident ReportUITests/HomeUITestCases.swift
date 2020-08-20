//
//  HomeUITestCases.swift
//  Incident ReportUITests
//
//  Created by Ankush Dhawan on 20/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import XCTest

class HomeUITestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableViewAlert()
    {
        
        let app = XCUIApplication()
        let emptyListTable = app.tables["Empty list"]
        emptyListTable.swipeUp()
        app.navigationBars["Incident_Report.HomeVC"].buttons["Back"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Submit"]/*[[".buttons[\"Submit\"].staticTexts[\"Submit\"]",".staticTexts[\"Submit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.children(matching: .window).element(boundBy: 0).tap()
        app.alerts.scrollViews.otherElements.buttons["OK"].tap()
        emptyListTable.swipeUp()
        emptyListTable.tap()
        emptyListTable.tap()
        
    }
    
    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
