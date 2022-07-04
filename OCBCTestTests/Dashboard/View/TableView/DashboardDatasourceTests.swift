//
//  DashboardDatasourceTests.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 04/07/22.
//

import XCTest
@testable import OCBCTest

class DashboardDatasourceTests: XCTestCase {

    var vc: DashboardViewController!

    override func setUp() {
        super.setUp()
        
        vc = DashboardViewController()
        let fakeWishlistService = MockDashboardService()
        fakeWishlistService.transactions = [Transaction.with()]
        let viewModel = DashboardViewModel(caller: vc, service: fakeWishlistService)
        vc.viewModel = viewModel
        vc.loadViewIfNeeded()
    }
    
    func test_sectionTitle_shouldReturnDayFormat() {
        let headerSection0 = vc.tableView.dataSource?.tableView?(vc.tableView, titleForHeaderInSection: 0)
        XCTAssertEqual(headerSection0, "12 Mar 2022")
    }
    
    func test_cellForRowAt0_shouldReturnTransactionCell() {
        vc.tableView.reloadData()
        let transactionCell = self.tableViewCell(at: 0, row: 0)
        XCTAssertTrue(transactionCell is TransactionCell)
    }
    
    private func tableViewCell(at section:Int, row: Int) -> UITableViewCell {
        let cell = vc.tableView.dataSource?.tableView(vc.tableView, cellForRowAt: IndexPath(row: row, section: section))
        return cell!
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }

}
