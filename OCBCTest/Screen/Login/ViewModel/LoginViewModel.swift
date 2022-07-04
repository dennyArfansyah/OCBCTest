//
//  LoginViewModel.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 03/07/22.
//

import Foundation
import Toast_Swift

class LoginViewModel {
    
    private(set) var caller: LoginViewController
    var service: LoginService
    
    init(caller: LoginViewController, service: LoginService = LoginServiceImplementation()) {
        self.caller = caller
        self.service = service
    }
    
    func loginValidation(username: String, password: String) {
        if username.isEmpty || username.count < 4 {
            self.caller.usernameTextField.isErrorRevealed = true
            self.caller.usernameTextField.errorLabel.text = Constant.usernameRequired
            return
        }
        
        if password.isEmpty || password.count < 4 {
            self.caller.passwordTextField.isErrorRevealed = true
            self.caller.passwordTextField.errorLabel.text = Constant.passwordRequired
            return
        }
        showLoadingView()
        doLogin(with: Login(username: username, password: password))
    }
    
    func doLogin(with data: Login) {
        self.service.doLogin(with: data, completion: { [weak self] result in
            self?.hideLoadingView()
            switch result {
            case .success(let loginResponse):
                print(loginResponse)
                self?.set(with: loginResponse)
            case .failure(let error):
                self?.showToast(with: error.localizedDescription)
            }
        })
    }
    
    func showLoadingView() {
        let loadingVC = LoadingViewController()
        loadingVC.modalPresentationStyle = .overCurrentContext
        loadingVC.modalTransitionStyle = .crossDissolve
        self.caller.present(loadingVC, animated: true, completion: nil)
    }
    
    func hideLoadingView() {
        DispatchQueue.main.async {
            self.caller.dismiss(animated: true)
        }
    }
    
    func set(with loginResponse: LoginRespons) {
        UserDefaults.standard.setValue(loginResponse.token, forKey: Constant.token)
        self.caller.usernameTextField.text = ""
        self.caller.usernameTextField.isErrorRevealed = false
        self.caller.usernameTextField.errorLabel.text = ""
        self.caller.passwordTextField.text = ""
        self.caller.passwordTextField.errorLabel.text = ""
        self.caller.passwordTextField.isErrorRevealed = false
        let vc = DashboardViewController()
        vc.viewModel = DashboardViewModel(caller: vc)
        self.caller.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showToast(with errorMessage: String) {
        self.caller.view.makeToast(errorMessage)
    }
    
}
