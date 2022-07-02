//
//  LoginVCTests.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 03/07/22.
//

import XCTest
@testable import OCBCTest

class LoginVCTests: XCTestCase {

    var vc: LoginViewController!

    override func setUp() {
        super.setUp()
        vc = LoginViewController()
        vc.loadViewIfNeeded()
    }
    
    func test_dashboardViewController_isExist() {
        XCTAssertNotNil(vc)
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }

}
