//
//  AddRecordTests.swift
//  Incident ReportTests
//
//  Created by Ankush Dhawan on 20/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import XCTest
@testable import Incident_Report

class AddRecordTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override class func setUp() {
        
    }
    func testAddRecordValidation()
    {
        let context = InMemoryCoreDataStack.sharedInstance.persistentContainer.viewContext
        let gateway = IncidentGateWay(viewContext:context)
        let viewModel = AddIncidentViewModel(gateway: gateway, controller:AddIncidentVC(), validation: Validation())
        
        let message =  viewModel.checkFieldsValidation(machineName: "", location: "ewewewe", descriptionStr: "wewewewwe")
        XCTAssertNotNil(message)
        let message1 =  viewModel.checkFieldsValidation(machineName: "", location: "", descriptionStr: "wewewewwe")
        XCTAssertNotNil(message1)
        
        let message2 =  viewModel.checkFieldsValidation(machineName: "", location: "", descriptionStr: "")
        XCTAssertNotNil(message2)
        let message3 =  viewModel.checkFieldsValidation(machineName: "ssadsdssdsd", location: "sdsdsdsdsdsdsds", descriptionStr: "sdsdsdsdsdsdsdsdsdssd")
        XCTAssertNil(message3)
    }
    
    func testRecordSaving()
    {
        let context = InMemoryCoreDataStack.sharedInstance.persistentContainer.viewContext
        let gateway = IncidentGateWay(viewContext:context)
        let viewModel = AddIncidentViewModel(gateway: gateway, controller:AddIncidentVC(), validation: Validation())
        var model = IncidentModel(machineName: "Testing12", description: "test12", location: "Data12")
        
        let AddRecordCompletionHandlerExpectation = expectation(description: "Add record completion handler expectation")
        viewModel.gateways.add(parameters: model) { (testModel) in
            XCTAssertNotNil(testModel, "Record added")
            AddRecordCompletionHandlerExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
        
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
