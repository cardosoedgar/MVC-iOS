//
//  ConfigManagerSpec.swift
//  isMVCbadTests
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Quick
import Nimble
import Foundation
@testable import isMVCbad

class ConfigManagerSpec: QuickSpec {
    override func spec() {
        describe("ConfigManager") {
            
            let configManager = ConfigManager()
            let networkMock = NetworkRequestMock()
            
            beforeEach {
                configManager.network = networkMock
            }
            
            it("should logout user") {
                configManager.signout {
                    expect(networkMock.wasCalled).to(beTrue())
                }
            }
        }
    }
}
