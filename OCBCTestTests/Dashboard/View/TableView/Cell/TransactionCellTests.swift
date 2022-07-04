//
//  TransactionCellTests.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 04/07/22.
//

import XCTest
@testable import OCBCTest

class TransactionCellTests: XCTestCase {

    var cell: TransactionCell!
    var vc: DashboardViewController!

    override func setUp() {
        super.setUp()
        
        vc = DashboardViewController()
        let fakeService = MockDashboardService()
        fakeService.transactions = [Transaction.with()]
        let viewModel = DashboardViewModel(caller: vc, service: fakeService)
        vc.viewModel = viewModel
        vc.loadViewIfNeeded()
        vc.tableView.dataSource = DashboardDatasource(caller: vc, viewModel: viewModel)
        cell = vc.tableView.dataSource?.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? TransactionCell
        cell.setData(with: fakeService.transactions![0])
    }
    
    func test_tableviewConnected() {
        XCTAssertNotNil(vc.tableView.dataSource)
    }
    
    func test_transactionCell_isExist() {
        XCTAssertNotNil(self.cell)
    }
    
    override func tearDown() {
        cell = nil
        vc = nil
        super.tearDown()
    }

}
