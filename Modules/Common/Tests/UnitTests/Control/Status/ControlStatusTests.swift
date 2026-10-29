//
//  ControlStatusTests.swift
//  SparkCoreUnitTests
//
//  Created by robin.lemaire on 25/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@_spi(SI_SPI) @testable import SparkCommon

@MainActor
@Suite("Control Status Tests")
struct ControlStatusTests {

    // MARK: - Tests

    @Test("Init with default values")
    func initWithDefaultValues() {
        // GIVEN / WHEN
        let status = ControlStatus()

        // THEN
        #expect(!status.isHighlighted, "Wrong isHighlighted value")
        #expect(status.isEnabled, "Wrong isSelected value")
        #expect(!status.isSelected, "Wrong isSelected value")
    }

    @Test("Init")
    func initialization() {
        // GIVEN
        let givenIsHighlighted = true
        let givenIsEnabled = true
        let givenIsSelected = true

        // WHEN
        let status = ControlStatus(
            isHighlighted: givenIsHighlighted,
            isEnabled: givenIsEnabled,
            isSelected: givenIsSelected
        )

        // THEN
        #expect(status.isHighlighted == givenIsHighlighted, "Wrong isHighlighted")

        #expect(status.isEnabled == givenIsEnabled, "Wrong isEnabled")

        #expect(status.isSelected == givenIsSelected, "Wrong isSelected")
    }
}
