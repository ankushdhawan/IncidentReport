//
//  Incident_ReportUITests.swift
//  Incident ReportUITests
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import XCTest

class Incident_ReportUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginForUserNameNegativeCase()
    {
        let app = XCUIApplication()
        app.launch()
        let userName = app.textFields["UserName"]
        userName.tap()
        userName.typeText("aaa")
        app.staticTexts["Submit"].tap()
        XCTAssertTrue(app.alerts["Error"].exists)
        app.alerts["Error"].scrollViews.otherElements.buttons["OK"].tap()
    }
    
    func testLoginForPasswordNegativeCase()
    {
        let app = XCUIApplication()
        app.launch()
        
        let userName = app.textFields["UserName"]
        userName.tap()
        
        userName.typeText("ankushdhawan")
        XCTAssertEqual(userName.value as! String, "ankushdhawan")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("nnn")
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Submit"]/*[[".buttons[\"Submit\"].staticTexts[\"Submit\"]",".staticTexts[\"Submit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.alerts["Error"].exists)
    }
    
    func testLoginForPasswordPositiveCase()
    {
        let app = XCUIApplication()
        app.launch()
        let userName = app.textFields["UserName"]
        userName.tap()
        
        userName.typeText("ankushdhawan")
        XCTAssertEqual(userName.value as! String, "ankushdhawan")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("nnnhhhhhnnnnnn")
                
        app/*@START_MENU_TOKEN@*/.staticTexts["Submit"]/*[[".buttons[\"Submit\"].staticTexts[\"Submit\"]",".staticTexts[\"Submit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertFalse(app.alerts["Error"].exists)
    }
    
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCTestCase {
    
    func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
        let keyboard = XCUIApplication().keyboards.element
        while (true) {
            element.tap()
            if keyboard.exists {
                break;
            }
            RunLoop.current.run(until: NSDate(timeIntervalSinceNow: 0.5) as Date)
        }
    }
}
