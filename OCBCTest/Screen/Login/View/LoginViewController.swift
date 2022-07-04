//
//  LoginViewController.swift
//  OCBCTest
//
//  Created by Denny Arfansyah on 02/07/22.
//

import UIKit
import Material
import Toast_Swift

class LoginViewController: UIViewController {

    @IBOutlet weak var materialInputView: UIView!
    private var emailField: ErrorTextField!
    private var passwordField: TextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: LoginViewModel!
    
    lazy var usernameTextField: ErrorTextField = {
        var field = ErrorTextField()
        field.placeholder = Constant.username
        field.errorColor = .red
        field.isErrorRevealed = false
        field.delegate = self
        field.translatesAutoresizingMaskIntoConstraints = false
        field.dividerColor = .lightGray
        field.dividerActiveColor = .black
        field.placeholderActiveColor = .gray
        return field
    }()
    
    lazy var passwordTextField: ErrorTextField = {
        var field = ErrorTextField()
        field.placeholder = Constant.password
        field.errorColor = .red
        field.isErrorRevealed = false
        field.delegate = self
        field.translatesAutoresizingMaskIntoConstraints = false
        field.dividerColor = .lightGray
        field.dividerActiveColor = .black
        field.placeholderActiveColor = .gray
        field.isVisibilityIconButtonEnabled = true
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        materialInputView.addSubview(usernameTextField)
        self.usernameTextField.topAnchor.constraint(equalTo: materialInputView.topAnchor, constant: 32).isActive = true
        self.usernameTextField.leadingAnchor.constraint(equalTo: materialInputView.leadingAnchor, constant: 16).isActive = true
        self.usernameTextField.trailingAnchor.constraint(equalTo: materialInputView.trailingAnchor, constant: -16).isActive = true
        self.usernameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        materialInputView.addSubview(passwordTextField)
        self.passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 48).isActive = true
        self.passwordTextField.leadingAnchor.constraint(equalTo: materialInputView.leadingAnchor, constant: 16).isActive = true
        self.passwordTextField.trailingAnchor.constraint(equalTo: materialInputView.trailingAnchor, constant: -16).isActive = true
        self.passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}

//Action Handlers
extension LoginViewController {
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        viewModel.loginValidation(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.view.makeToast(Constant.notAvailable)
    }
    
}

extension LoginViewController: TextFieldDelegate {

    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
}
