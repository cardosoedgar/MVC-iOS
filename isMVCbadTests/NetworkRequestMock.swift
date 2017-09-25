//
//  NetworkRequestMock.swift
//  isMVCbadTests
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation
@testable import isMVCbad

class NetworkRequestMock: NetworkRequest {
    private let user = User(id: "123123", email: "teste@teste.com")
    private let password = "qweqwe"
    
    func createAccount(email: String, password: String, completion: @escaping (Result<User>) -> Void) {
        if self.user.email == email {
            completion(.error)
        } else {
            let user = User(id: "321321", email: email)
            completion(.success(user))
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User>) -> Void) {
        if self.password != password || self.user.email != email {
           return completion(.error)
        }
        
        completion(.success(user))
    }
    
    func signout(completion: (() -> Void)?) {
        completion?()
    }
}
