//
//  LoginViewModelTests.swift
//  OCBCTestTests
//
//  Created by Denny Arfansyah on 03/07/22.
//

import XCTest
@testable import OCBCTest

class LoginViewModelTests: XCTestCase {

    var vc: LoginViewController!
    var viewModel: LoginViewModel!
    var fakeService: MockLoginService!
    
    override func setUp() {
        super.setUp()
        vc = LoginViewController()
        fakeService = MockLoginService()
        viewModel = LoginViewModel(caller: vc, service: fakeService)
        vc.loadViewIfNeeded()
    }
    
    func test_usernameIsEmpty_shouldShowError() {
        viewModel.loginValidation(username: "", password: "12313")
        XCTAssertEqual(self.vc.usernameTextField.errorLabel.text, Constant.usernameRequired)
    }
    
    func test_passwordIsEmpty_shouldShowError() {
        viewModel.loginValidation(username: "qweqwe", password: "")
        XCTAssertEqual(self.vc.passwordTextField.errorLabel.text, Constant.passwordRequired)
    }
    
    func test_postLogin_returnSuccess() {
        fakeService.loginResponse = LoginRespons.with()
        let mockLogin = Login.with()
        viewModel.loginValidation(username: mockLogin.username, password: mockLogin.password)
    }
    
    func test_postLogin_returnFailure() {
        fakeService = nil
        viewModel.doLogin(with: Login(username: "test", password: "asd"))
    }
    
    override func tearDown() {
        self.vc = nil
        self.fakeService = nil
        self.viewModel = nil
        super.tearDown()
    }

}

class MockLoginService: LoginService {
    
    var loginResponse: LoginRespons?
    
    func doLogin(with param: Login, completion: @escaping (Result<LoginRespons, ServerError>) -> Void) {
        if let loginResponse = loginResponse {
            completion(.success(loginResponse))
        } else {
            completion(.failure(ServerError.unknownError))
        }
    }

}
