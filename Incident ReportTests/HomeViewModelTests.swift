//
//  HomeViewModelTests.swift
//  Incident ReportTests
//
//  Created by Ankush Dhawan on 20/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import XCTest
@testable import Incident_Report

class HomeViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFetchRecords()
    {
        let context = InMemoryCoreDataStack.sharedInstance.persistentContainer.viewContext
        let gateway = IncidentGateWay(viewContext:context)
        let viewModel = HomeViewModel(gateway: gateway, vc: HomeVC(), dataSource: HomeDataSource(models: [IncidentModel]()))
        AddRecordTests().testRecordSaving()
        let fetchRecordCompletionHandlerExpectation = expectation(description: "fetch record completion handler expectation")
        viewModel.gateways.fetchIncidents { (models) in
            XCTAssertTrue(models?.count ?? 0 > 0)
            fetchRecordCompletionHandlerExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
