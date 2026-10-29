//
//  ControlPropertyStateTests.swift
//  SparkCoreUnitTests
//
//  Created by robin.lemaire on 25/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@_spi(SI_SPI) @testable import SparkCommon

@MainActor
@Suite("Control Property State Tests")
struct ControlPropertyStateTests {

    // MARK: - Tests

    @Test("Default value")
    func defaultValue() {
        // GIVEN / WHEN
        let state = ControlPropertyState<String>(for: .normal)

        // THEN
        #expect(state.value == nil, "Wrong value. Should be nil")
    }
}
