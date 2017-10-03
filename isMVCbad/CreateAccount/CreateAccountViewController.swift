//
//  CreateAccountViewController.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, CreateAccountViewDelegate {

    let delegate: LoginViewControllerDelegate
    var loginManager = LoginManager()
    var createAccountView = CreateAccountView()
    
    init(delegate: LoginViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        createAccountView.delegate = self
        self.view = createAccountView
    }
    
    func createAccountButtonPressed() {
        loginManager.createAccount(email: createAccountView.getEmail(), password: createAccountView.getPassword()) { success in
            if success {
                if let email = self.createAccountView.getEmail() {
                    self.delegate.fill(withEmail: email)
                    return self.dismiss(animated: true, completion: nil)
                }
            }
            
            self.alert(withTitle: "error", message: "try again")
        }
    }
    
    func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
