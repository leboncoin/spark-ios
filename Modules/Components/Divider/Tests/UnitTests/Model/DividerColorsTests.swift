//
//  DividerColorsTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

@Suite("Divider Colors Tests")
struct DividerColorsTests {

    // MARK: - Default Values Tests

    @Test("Init default values")
    func initDefaultValues() {
        // GIVEN & WHEN
        let dividerColors = DividerColors()

        // THEN
        #expect(
            dividerColors.text is ColorTokenClear,
            "Default text should be ColorTokenClear"
        )
        #expect(
            dividerColors.separator is ColorTokenClear,
            "Default separator should be ColorTokenClear"
        )
    }

    // MARK: - Equatable Tests

    @Test("Equatable same instances")
    func equatableSameInstances() {
        // GIVEN
        let dividerColors1 = DividerColors()
        let dividerColors2 = DividerColors()

        // WHEN & THEN
        #expect(
            dividerColors1 == dividerColors2,
            "Two DividerColors instances with same values should be equal"
        )
    }

    @Test("Equatable different text colors")
    func equatableDifferentTextColors() {
        // GIVEN
        let colors = ColorsGeneratedMock.mocked()
        var dividerColors1 = DividerColors()
        var dividerColors2 = DividerColors()

        // WHEN
        dividerColors1.text = colors.base.onSurface
        dividerColors2.text = colors.accent.onAccentContainer

        // THEN
        #expect(
            dividerColors1 != dividerColors2,
            "DividerColors with different text colors should not be equal"
        )
    }

    @Test("Equatable different separator colors")
    func equatableDifferentSeparatorColors() {
        // GIVEN
        let colors = ColorsGeneratedMock.mocked()
        var dividerColors1 = DividerColors()
        var dividerColors2 = DividerColors()

        // WHEN
        dividerColors1.separator = colors.base.outline
        dividerColors2.separator = colors.base.outlineHigh

        // THEN
        #expect(
            dividerColors1 != dividerColors2,
            "DividerColors with different separator colors should not be equal"
        )
    }
}
