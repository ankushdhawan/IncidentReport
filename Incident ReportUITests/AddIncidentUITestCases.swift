//
//  AddIncidentUITestCases.swift
//  Incident ReportUITests
//
//  Created by Ankush Dhawan on 20/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import XCTest

class AddIncidentUITestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testAddincidentUITestCase()
    {
        HomeUITestCases().testTableView()
        let app = XCUIApplication()
        let machine = app.textFields["Faulty machine"]
        machine.tap()
        machine.typeText("Ankush")
        let location = app.textFields["Name of impacted location"]
        location.tap()
        location.typeText("Sec22")
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("it is testing perpose")
        textView.typeText("\n")
        let submitStaticText = app.staticTexts["Submit"]
        submitStaticText.tap()
        let alert = app.alerts.scrollViews.otherElements.buttons["OK"]
        XCTAssert(app.alerts.element.staticTexts["Record added successfully"].exists)
        XCTAssertTrue(alert.exists)
        alert.tap()
        sleep(1)
        XCTAssertEqual(app.navigationBars.element.identifier, "Incident Report")
    }
    
    func testAddincidentUITestCaseForLocationError()
    {
        HomeUITestCases().testTableView()
        let app = XCUIApplication()
        let machine = app.textFields["Faulty machine"]
        machine.tap()
        machine.typeText("Ankush")
        let location = app.textFields["Name of impacted location"]
        location.tap()
        location.typeText("")
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("it is testing purpose")
        textView.typeText("\n")

        app.staticTexts["Submit"].tap()
        let alert = app.alerts.scrollViews.otherElements.buttons["OK"]
        XCTAssert(app.alerts.element.staticTexts["Please enter Location "].exists)
        XCTAssertTrue(alert.exists)
        alert.tap()
        sleep(1)
        XCTAssertNotEqual(app.navigationBars.element.identifier, "Incident Report")
        
        
    }
    
    func testAddincidentUITestCaseForMachineError()
    {
        HomeUITestCases().testTableView()
        let app = XCUIApplication()
        let machine = app.textFields["Faulty machine"]
        machine.tap()
        machine.typeText("")
        let location = app.textFields["Name of impacted location"]
        location.tap()
        location.typeText("sec 22")
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("it is testing perpose")
        textView.typeText("\n")

        app.staticTexts["Submit"].tap()
        let alert = app.alerts.scrollViews.otherElements.buttons["OK"]
        XCTAssert(app.alerts.element.staticTexts["Please enter machine name "].exists)
        XCTAssertTrue(alert.exists)
        alert.tap()
        sleep(1)
        XCTAssertNotEqual(app.navigationBars.element.identifier, "Incident Report")
    }

    
    func testAddincidentUITestCaseForDescriptionError()
    {
        HomeUITestCases().testTableView()
        let app = XCUIApplication()
        let machine = app.textFields["Faulty machine"]
        machine.tap()
        machine.typeText("Ankush")
        let location = app.textFields["Name of impacted location"]
        location.tap()
        location.typeText("sec 22")
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("")
        textView.typeText("\n")
        app.staticTexts["Submit"].tap()
        let alert = app.alerts.scrollViews.otherElements.buttons["OK"]
        XCTAssert(app.alerts.element.staticTexts["Please enter Description "].exists)
        XCTAssertTrue(alert.exists)
        alert.tap()
        sleep(1)
        XCTAssertNotEqual(app.navigationBars.element.identifier, "Incident Report")
    }


    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}

