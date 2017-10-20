//
//  CreateAccountView.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 03/10/17.
//  Copyright © 2017 Concrete. All rights reserved.
//
import UIKit
import Cartography

@objc protocol CreateAccountViewDelegate {
    func backButtonPressed()
    func createAccountButtonPressed()
}

class CreateAccountView: UIView, ViewCode {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let backButton = UIButton(type: .system)
    let createAccountButton = UIButton(type: .system)
    var delegate: CreateAccountViewDelegate?
    
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
    
    func setupConstraints() {
        constrain(self, emailTextField, passwordTextField, backButton, createAccountButton) {
            containerView, emailTextField, passwordTextField, backButton, createAccountButton in
            
            emailTextField.width == 200
            emailTextField.top == containerView.top + 150
            emailTextField.centerX == containerView.centerX
            
            passwordTextField.width == 200
            passwordTextField.top == emailTextField.bottom + 20
            passwordTextField.centerX == containerView.centerX
            
            createAccountButton.top == passwordTextField.bottom + 20
            createAccountButton.centerX == containerView.centerX
            
            backButton.top == createAccountButton.bottom + 10
            backButton.centerX == containerView.centerX
        }
    }
    
    func buildViewHierarchy() {
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(createAccountButton)
        self.addSubview(backButton)
    }
    
    func configureViews() {
        self.backgroundColor = .white
        
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        emailTextField.placeholder = "email"
        emailTextField.borderStyle = .roundedRect
        
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.placeholder = "password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        createAccountButton.setTitle("Create New Account", for: .normal)
        createAccountButton.addTarget(delegate, action: #selector(delegate?.createAccountButtonPressed), for: .touchUpInside)
        
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(delegate, action: #selector(delegate?.backButtonPressed), for: .touchUpInside)
    }
}
