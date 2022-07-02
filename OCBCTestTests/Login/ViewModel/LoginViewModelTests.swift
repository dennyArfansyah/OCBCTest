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
    
    override func setUp() {
        super.setUp()
        vc = LoginViewController()
        vc.loadViewIfNeeded()
        viewModel = LoginViewModel(caller: vc)
    }
    
    func test_postLogin_returnSuccess() {
        let service = MockLoginService()
        service.doLoginResult = .success(LoginRespons.with())
        
        let viewModel = LoginViewModel(caller: vc, service: service)
        let mockLogin = Login.with()
        viewModel.doLogin(with: Login(username: mockLogin.username, password: mockLogin.password))
    }
    
    func test_postLogin_returnFailure() {
        let service = MockLoginService()
        service.doLoginResult = .failure(ServerError.unknownError)
        
        let viewModel = LoginViewModel(caller: vc, service: service)
        viewModel.doLogin(with: Login(username: "test", password: "asd"))
    }

}

class MockLoginService: LoginServiceImplementation {
    
    var doLoginResult: LoginServiceImplementation.LoginResult? = nil
    
    override func doLogin(with param: Login, completion: @escaping LoginServiceImplementation.LoginCompletion) {
        completion(doLoginResult!)
    }

}
