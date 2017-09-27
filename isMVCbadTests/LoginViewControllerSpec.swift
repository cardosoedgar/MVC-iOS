//
//  LoginViewControllerSpec.swift
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

class LoginViewControllerSpec: QuickSpec {
    override func spec() {
        describe("LoginViewController") {
            
            var loginController: LoginViewController?
            
            beforeSuite {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                loginController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
                loadNetworkMock()
                
                UIApplication.shared.keyWindow?.rootViewController = loginController
                KIFEnableAccessibility()
            }
            
            beforeEach {
                clearFields()
            }
            
            it("should click create account button and go to create account VC") {
                self.tester().tapView(withAccessibilityIdentifier: "BUTTON_CREATE_ACCOUNT")
                self.tester().waitForView(withAccessibilityIdentifier: "BUTTON_CREATE_NEW_ACCOUNT")
                backFromCreateAccountVC()
            }
            
            it("should present a alert when the user enters wrong credentials") {
                self.tester().tapView(withAccessibilityIdentifier: "LOGIN_BUTTON")
                self.tester().tapView(withAccessibilityLabel: "Ok")
            }
            
            it("should fill fields correct and login") {
                self.tester().clearText(fromAndThenEnterText: "teste@teste.com",
                                        intoViewWithAccessibilityIdentifier: "EMAIL_TEXT_FIELD")
                self.tester().clearText(fromAndThenEnterText: "qweqwe",
                                        intoViewWithAccessibilityIdentifier: "PASSWORD_TEXT_FIELD")
                self.tester().tapView(withAccessibilityIdentifier: "LOGIN_BUTTON")
                
                self.tester().waitForView(withAccessibilityIdentifier: "LOGOUT_BUTTON")
                backFromHomeVC()
            }
            
            //MARK: Helper fuctions
            
            func clearFields() {
                self.tester().clearTextFromView(withAccessibilityIdentifier: "EMAIL_TEXT_FIELD")
                self.tester().clearTextFromView(withAccessibilityIdentifier: "PASSWORD_TEXT_FIELD")
            }
            
            func loadNetworkMock() {
                let loginManager = LoginManager()
                loginManager.network = NetworkRequestMock()
                loginController?.loginManager = loginManager
            }
            
            func backFromCreateAccountVC() {
                self.tester().tapView(withAccessibilityIdentifier: "BACK_BUTTON")
            }
            
            func backFromHomeVC() {
                self.tester().tapView(withAccessibilityIdentifier: "LOGOUT_BUTTON")
            }
        }
    }
}
