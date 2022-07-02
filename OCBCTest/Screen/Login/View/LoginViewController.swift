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
        
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        navigationController?.pushViewController(DashboardViewController(), animated: true)
    }
}
