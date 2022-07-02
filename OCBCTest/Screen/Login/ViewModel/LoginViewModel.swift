//
//  LoginViewModel.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 03/07/22.
//

import Foundation

class LoginViewModel {
    
    private(set) var caller: LoginViewController
    var service: LoginServiceImplementation
    var errorMessage: String!
    
    init(caller: LoginViewController, service: LoginServiceImplementation = LoginServiceImplementation()) {
        self.caller = caller
        self.service = service
    }
    
    func doLogin(with data: Login) {
        self.service.doLogin(with: data, completion: { [weak self] result in
            switch result {
            case .success(let loginResponse):
                print(loginResponse)
                self?.set(with: loginResponse)
            case .failure(let error):
                print(error.localizedDescription)
                self?.errorMessage = error.localizedDescription
            }
        })
    }
    
    func set(with loginResponse: LoginRespons) {
        caller.navigationController?.pushViewController(DashboardViewController(), animated: true)
    }
    
}
