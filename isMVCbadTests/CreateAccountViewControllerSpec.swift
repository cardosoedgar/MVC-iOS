//
//  CreateAccountViewControllerSpec.swift
//  isMVCbadTests
//
//  Created by Edgar Cardoso on 26/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit
import Quick
import Nimble
import KIF
@testable import isMVCbad

class CreateAccountViewControllerSpec: QuickSpec {
    override func spec() {
        describe("LoginViewController") {
            
            var createAccountController: CreateAccountViewController?
            var loginViewController: LoginViewController?
            
            beforeSuite {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                createAccountController = storyboard.instantiateViewController(withIdentifier: "CreateAccountViewController") as? CreateAccountViewController
                loginViewController = storyboard.instantiateInitialViewController() as? LoginViewController
                createAccountController?.delegate = loginViewController
                UIApplication.shared.keyWindow?.rootViewController = loginViewController
                KIFEnableAccessibility()
                loadNetworkMock()
                backFromLogin()
            }
            
            beforeEach {
                clearFields()
            }
            
            it("should fail to create new account with invalid fields") {
                self.tester().tapView(withAccessibilityIdentifier: "BUTTON_CREATE_NEW_ACCOUNT")
                self.tester().tapView(withAccessibilityLabel: "Ok")
            }
            
            it("should create new account and when done the email should appear on the email text field") {
                self.tester().clearText(fromAndThenEnterText: "stes@tes.com",
                                        intoViewWithAccessibilityIdentifier: "TEXT_EMAIL_CREATE")
                self.tester().clearText(fromAndThenEnterText: "123123",
                                        intoViewWithAccessibilityIdentifier: "TEXT_PASSWORD_CREATE")
                self.tester().tapView(withAccessibilityIdentifier: "BUTTON_CREATE_NEW_ACCOUNT")
                
                self.tester().expect(loginViewController?.emailTextField, toContainText: "stes@tes.com")
                
                backFromLogin()
            }
            
            //MARK: Helper functions
            
            func loadNetworkMock() {
                let loginManager = LoginManager()
                loginManager.network = NetworkRequestMock()
                createAccountController?.loginManager = loginManager
            }
            
            func clearFields() {
                self.tester().clearTextFromView(withAccessibilityIdentifier: "TEXT_EMAIL_CREATE")
                self.tester().clearTextFromView(withAccessibilityIdentifier: "TEXT_PASSWORD_CREATE")
            }
            
            func backFromLogin() {
                loginViewController?.present(createAccountController!, animated: true, completion: nil)
            }
        }
    }
}
