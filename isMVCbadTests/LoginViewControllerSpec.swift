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
                let rootVC = UIApplication.shared.keyWindow?.rootViewController
                loginController = rootVC as? LoginViewController
                KIFEnableAccessibility()
            }
            
            it("should click create account button and go to create account VC") {
                self.tester().tapView(withAccessibilityIdentifier: "BUTTON_CREATE_ACCOUNT")
                self.tester().waitForView(withAccessibilityIdentifier: "BUTTON_CREATE_NEW_ACCOUNT")
                backFromCreateAccountVC()
            }
            
            it("should present a alert when the user enters wrong credentials") {
                self.tester().clearTextFromView(withAccessibilityIdentifier: "EMAIL_TEXT_FIELD")
                self.tester().clearTextFromView(withAccessibilityIdentifier: "PASSWORD_TEXT_FIELD")
                
                self.tester().tapView(withAccessibilityIdentifier: "LOGIN_BUTTON")
                self.tester().tapView(withAccessibilityLabel: "Ok")
            }
            
            it("should fill fields correct and login") {
                loadNetworkMock()
                
                self.tester().clearText(fromAndThenEnterText: "teste@teste.com",
                                        intoViewWithAccessibilityIdentifier: "EMAIL_TEXT_FIELD")
                self.tester().clearText(fromAndThenEnterText: "qweqwe",
                                        intoViewWithAccessibilityIdentifier: "PASSWORD_TEXT_FIELD")
                self.tester().tapView(withAccessibilityIdentifier: "LOGIN_BUTTON")
                
                self.tester().waitForView(withAccessibilityIdentifier: "LOGOUT_BUTTON")
                backFromHomeVC()
            }
            
            it("should register a new account and the email appear on the email text field") {
                loadNetworkMock()
                
                self.tester().tapView(withAccessibilityIdentifier: "BUTTON_CREATE_ACCOUNT")
                self.tester().clearText(fromAndThenEnterText: "teste@teste.com",
                                        intoViewWithAccessibilityIdentifier: "TEXT_EMAIL_CREATE")
                self.tester().clearText(fromAndThenEnterText: "qweqwe",
                                        intoViewWithAccessibilityIdentifier: "TEXT_PASSWORD_CREATE")
                self.tester().tapView(withAccessibilityIdentifier: "BUTTON_CREATE_NEW_ACCOUNT")
                
                self.tester().expect(loginController?.emailTextField, toContainText: "teste@teste.com")
            }
            
            //MARK: Helper fuctions
            
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
