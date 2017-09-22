//
//  NetworkRequest.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 22/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation

typealias JsonObject = [String: Any]

protocol NetworkRequest {
    func register(name: String, email: String, password: String, completion: @escaping (Result<User>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<User>) -> Void)
}

enum Result<T> {
    case success(T)
    case error
}
