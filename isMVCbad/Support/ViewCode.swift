//
//  ViewCode.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 03/10/17.
//  Copyright © 2017 Concrete. All rights reserved.
//
import UIKit

protocol ViewCode {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setup()
}

extension ViewCode {
    func setup() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
}
