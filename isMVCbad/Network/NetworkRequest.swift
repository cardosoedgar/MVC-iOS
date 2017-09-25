//
//  NetworkRequest.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 22/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation

protocol NetworkRequest {
    func createAccount(email: String, password: String, completion: @escaping (Result<User>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<User>) -> Void)
    func signout(completion: (() -> Void)?)
}

enum Result<T> {
    case success(T)
    case error
}
