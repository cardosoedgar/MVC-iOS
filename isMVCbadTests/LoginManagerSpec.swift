//
//  LoginManagerSpec.swift
//  isMVCbadTests
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Quick
import Nimble
import Foundation
@testable import isMVCbad

class LoginManagerSpec: QuickSpec {
    override func spec() {
        describe("LoginManager") {
            
            let loginManager = LoginManager()
            
            beforeEach {
                loginManager.network = NetworkRequestMock()
            }
            
            it("should login user") {
                var success = false
                
                loginManager.login(email: "teste@teste.com", password: "qweqwe") { result in
                    success = result
                }
                
                expect(success).toEventually(beTrue())
            }
            
            it("should not login user with wrong credentials") {
                var success = true
                
                loginManager.login(email: "etset@teste.com", password: "321321") { result in
                    success = result
                }
                
                expect(success).toEventually(beFalse())
            }
            
            it("should not login user with empty credentials") {
                var success = true
                
                loginManager.login(email: nil, password: nil) { result in
                    success = result
                }
                
                expect(success).toEventually(beFalse())
            }
            
            it("should create new account") {
                var success = false
                
                loginManager.createAccount(email: "new@email.com", password: "123123") { result in
                    success = result
                }
                
                expect(success).toEventually(beTrue())
            }
            
            it("should not create user with existing account") {
                var success = true
                
                loginManager.createAccount(email: "teste@teste.com", password: "123123") { result in
                    success = result
                }
                
                expect(success).toEventually(beFalse())
            }
            
            it("should not login user with empty credentials") {
                var success = true
                
                loginManager.createAccount(email: nil, password: nil) { result in
                    success = result
                }
                
                expect(success).toEventually(beFalse())
            }
        }
    }
}
