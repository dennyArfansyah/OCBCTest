//
//  DashboardDelegateTests.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 04/07/22.
//

import XCTest
@testable import OCBCTest

class DashboardDelegateTests: XCTestCase {

    var vc: DashboardViewController!

    override func setUp() {
        super.setUp()
        
        vc = DashboardViewController()
        let fakeService = MockDashboardService()
        fakeService.transactions = [Transaction.with()]
        let viewModel = DashboardViewModel(caller: vc, service: fakeService)
        vc.viewModel = viewModel
        vc.loadViewIfNeeded()
    }
    
    func test_sectionTitle_shouldReturnDayFormat() {
        let headerSection0 = vc.tableView.delegate?.tableView?(vc.tableView, viewForHeaderInSection: 0)
        XCTAssertNotNil(headerSection0)
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }

}
