//
//  ToggleStaticColorsTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 28/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkTheming

@Suite("Toggle Static Colors Tests")
struct ToggleStaticColorsTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let colors = ToggleStaticColors()

        // THEN
        #expect(colors.dotBackground.equals(ColorTokenClear()))
        #expect(colors.hover.equals(ColorTokenClear()))
    }
}
