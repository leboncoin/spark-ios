//
//  CheckboxToggleOpacitiesTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Checkbox Toggle Opacities Tests")
struct CheckboxToggleOpacitiesTests {

    // MARK: - Initialization Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let opacities = CheckboxToggleOpacities()

        // THEN
        #expect(opacities.background == 0)
        #expect(opacities.border == 0)
    }

    @Test("Initialization with custom values should use provided values")
    func initializationWithCustomValuesShouldUseProvidedValues() {
        // GIVEN
        let customBackground: CGFloat = 3
        let customBorder: CGFloat = 4

        // WHEN
        let opacities = CheckboxToggleOpacities(
            background: customBackground,
            border: customBorder
        )

        // THEN
        #expect(opacities.background == customBackground)
        #expect(opacities.border == customBorder)
    }
}
