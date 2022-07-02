//
//  LoginViewController.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = LoginViewModel(caller: self)
        viewModel.doLogin(with: Login(username: "test", password: "asdasd"))
        
        
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        navigationController?.pushViewController(DashboardViewController(), animated: true)
    }
}
