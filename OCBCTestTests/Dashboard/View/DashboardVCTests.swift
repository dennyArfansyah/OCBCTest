//
//  DashboardVCTests.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 02/07/22.
//

import XCTest
@testable import OCBCTest

class DashboardVCTests: XCTestCase {

    var vc: DashboardViewController!

    override func setUp() {
        super.setUp()
        vc = DashboardViewController()
        vc.loadViewIfNeeded()
    }
    
    func test_dashboardViewController_isExist() {
        XCTAssertNotNil(vc)
    }
    
    func test_dataSource_shouldConnected() {
        XCTAssertNotNil(vc.tableView.dataSource)
    }
    
    func test_rowHeight_automaticDimension() {
        XCTAssertEqual(vc.tableView.rowHeight, UITableView.automaticDimension)
    }
    
    func test_backButtonPressed_shouldPopView() {
        let nav = SpyNavigationController(rootViewController: vc)
        vc.navigationController?.pushViewController(UIViewController(), animated: true)
        XCTAssertNotNil(nav.pushedViewController)
        vc.logoutButton.sendActions(for: UIControl.Event.touchUpInside)
        XCTAssertNil(nav.pushedViewController)
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }

}
