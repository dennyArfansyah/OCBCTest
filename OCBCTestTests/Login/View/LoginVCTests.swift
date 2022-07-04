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
    var viewModel: LoginViewModel!

    override func setUp() {
        super.setUp()
        vc = LoginViewController()
        viewModel = LoginViewModel(caller: vc)
        vc.viewModel = viewModel
        vc.loadViewIfNeeded()
    }
    
    func test_dashboardViewController_isExist() {
        XCTAssertNotNil(vc)
    }
    
    func test_loginButton_shouldCanPressed() {
        vc.loginButton.sendActions(for: UIControl.Event.touchUpInside)
    }
    
    func test_registerButton_shouldCanPressed() {
        vc.registerButton.sendActions(for: UIControl.Event.touchUpInside)
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }

}
