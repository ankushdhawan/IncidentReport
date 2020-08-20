//
//  LoginTest.swift
//  Incident ReportTests
//
//  Created by Ankush Dhawan on 20/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import XCTest
@testable import Incident_Report

class LoginTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginValidationForNegativeCase()
    {
        let viewModel = LoginViewModel()
        let message =  viewModel.checkFieldsValidation(userName: "", password: "123456789")
        XCTAssertNotNil(message)
        let message1 =  viewModel.checkFieldsValidation(userName: "1234567", password: "123456789")
        XCTAssertNotNil(message1)
        let message2 =  viewModel.checkFieldsValidation(userName: "12345678", password: "")
        XCTAssertNotNil(message2)
    }
    
    func testLoginValidationForPositiveCase()
    {
        let viewModel = LoginViewModel()
        let message =  viewModel.checkFieldsValidation(userName: "asasaasaas", password: "123456789")
        XCTAssertNil(message)
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
