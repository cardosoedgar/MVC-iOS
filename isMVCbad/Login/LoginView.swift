//
//  LoginView.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 03/10/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit
import Cartography

@objc protocol LoginViewDelegate {
    func loginButtonPressed()
    func createAccountButtonPressed()
}

class LoginView: UIView, ViewCode {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let createAccountButton = UIButton(type: .system)
    var delegate: LoginViewDelegate?

    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getEmail() -> String? {
        return emailTextField.text
    }
    
    func getPassword() -> String? {
        return passwordTextField.text
    }
    
    func fillTextFieild(withEmail email: String) {
        self.emailTextField.text = email
    }
    
    func setupConstraints() {
        constrain(self, emailTextField, passwordTextField, loginButton, createAccountButton) {
            containerView, emailTextField, passwordTextField, loginButton, createAccountButton in
            
            emailTextField.width == 200
            emailTextField.top == containerView.top + 150
            emailTextField.centerX == containerView.centerX
            
            passwordTextField.width == 200
            passwordTextField.top == emailTextField.bottom + 20
            passwordTextField.centerX == containerView.centerX
            
            loginButton.top == passwordTextField.bottom + 20
            loginButton.centerX == containerView.centerX
            
            createAccountButton.top == loginButton.bottom + 10
            createAccountButton.centerX == containerView.centerX
        }
    }
    
    func buildViewHierarchy() {
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(createAccountButton)
    }
    
    func configureViews() {
        self.backgroundColor = .white
        
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        emailTextField.placeholder = "email"
        emailTextField.borderStyle = .roundedRect
        
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.placeholder = "password"
        passwordTextField.borderStyle = .roundedRect
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(delegate, action: #selector(delegate?.loginButtonPressed), for: .touchUpInside)
        
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.addTarget(delegate, action: #selector(delegate?.createAccountButtonPressed), for: .touchUpInside)
    }
}
