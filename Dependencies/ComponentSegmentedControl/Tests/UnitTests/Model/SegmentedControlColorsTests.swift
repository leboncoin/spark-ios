//
//  SegmentedControlColorsTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("SegmentedControl Colors Tests")
struct SegmentedControlColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = SegmentedControlColors()

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.borderColorToken.equals(ColorTokenClear()))
        #expect(colors.separatorColorToken.equals(ColorTokenClear()))
        #expect(colors.selectedItemBackgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.selectedItemBorderColorToken.equals(ColorTokenClear()))
        #expect(colors.accessibilitySelectedTintColorToken.equals(ColorTokenClear()))
        #expect(colors.accessibilitySelectedBackgroundColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let backgroundToken = ColorTokenGeneratedMock.random()
        let borderToken = ColorTokenGeneratedMock.random()
        let separatorToken = ColorTokenGeneratedMock.random()
        let selectedItemBackgroundToken = ColorTokenGeneratedMock.random()
        let selectedItemBorderToken = ColorTokenGeneratedMock.random()
        let accessibilitySelectedTintToken = ColorTokenGeneratedMock.random()
        let accessibilitySelectedBackgroundToken = ColorTokenGeneratedMock.random()

        let colors1 = SegmentedControlColors(
            backgroundColorToken: backgroundToken,
            borderColorToken: borderToken,
            separatorColorToken: separatorToken,
            selectedItemBackgroundColorToken: selectedItemBackgroundToken,
            selectedItemBorderColorToken: selectedItemBorderToken,
            accessibilitySelectedTintColorToken: accessibilitySelectedTintToken,
            accessibilitySelectedBackgroundColorToken: accessibilitySelectedBackgroundToken
        )

        let colors2 = SegmentedControlColors(
            backgroundColorToken: backgroundToken,
            borderColorToken: borderToken,
            separatorColorToken: separatorToken,
            selectedItemBackgroundColorToken: selectedItemBackgroundToken,
            selectedItemBorderColorToken: selectedItemBorderToken,
            accessibilitySelectedTintColorToken: accessibilitySelectedTintToken,
            accessibilitySelectedBackgroundColorToken: accessibilitySelectedBackgroundToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different background color")
    func inequalityWhenDifferentBackgroundColor() {
        // GIVEN / WHEN
        let borderToken = ColorTokenGeneratedMock.random()
        let separatorToken = ColorTokenGeneratedMock.random()
        let selectedItemBackgroundToken = ColorTokenGeneratedMock.random()
        let selectedItemBorderToken = ColorTokenGeneratedMock.random()

        let colors1 = SegmentedControlColors(
            backgroundColorToken: ColorTokenGeneratedMock.random(),
            borderColorToken: borderToken,
            separatorColorToken: separatorToken,
            selectedItemBackgroundColorToken: selectedItemBackgroundToken,
            selectedItemBorderColorToken: selectedItemBorderToken
        )

        let colors2 = SegmentedControlColors(
            backgroundColorToken: ColorTokenGeneratedMock.random(),
            borderColorToken: borderToken,
            separatorColorToken: separatorToken,
            selectedItemBackgroundColorToken: selectedItemBackgroundToken,
            selectedItemBorderColorToken: selectedItemBorderToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different accessibilitySelectedTintColor")
    func inequalityWhenDifferentAccessibilitySelectedTintColor() {
        // GIVEN / WHEN
        let backgroundToken = ColorTokenGeneratedMock.random()
        let borderToken = ColorTokenGeneratedMock.random()
        let separatorToken = ColorTokenGeneratedMock.random()
        let selectedItemBackgroundToken = ColorTokenGeneratedMock.random()
        let selectedItemBorderToken = ColorTokenGeneratedMock.random()
        let accessibilitySelectedBackgroundToken = ColorTokenGeneratedMock.random()

        let colors1 = SegmentedControlColors(
            backgroundColorToken: backgroundToken,
            borderColorToken: borderToken,
            separatorColorToken: separatorToken,
            selectedItemBackgroundColorToken: selectedItemBackgroundToken,
            selectedItemBorderColorToken: selectedItemBorderToken,
            accessibilitySelectedTintColorToken: ColorTokenGeneratedMock.random(),
            accessibilitySelectedBackgroundColorToken: accessibilitySelectedBackgroundToken
        )

        let colors2 = SegmentedControlColors(
            backgroundColorToken: backgroundToken,
            borderColorToken: borderToken,
            separatorColorToken: separatorToken,
            selectedItemBackgroundColorToken: selectedItemBackgroundToken,
            selectedItemBorderColorToken: selectedItemBorderToken,
            accessibilitySelectedTintColorToken: ColorTokenGeneratedMock.random(),
            accessibilitySelectedBackgroundColorToken: accessibilitySelectedBackgroundToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different accessibilitySelectedBackgroundColor")
    func inequalityWhenDifferentAccessibilitySelectedBackgroundColor() {
        // GIVEN / WHEN
        let backgroundToken = ColorTokenGeneratedMock.random()
        let borderToken = ColorTokenGeneratedMock.random()
        let separatorToken = ColorTokenGeneratedMock.random()
        let selectedItemBackgroundToken = ColorTokenGeneratedMock.random()
        let selectedItemBorderToken = ColorTokenGeneratedMock.random()
        let accessibilitySelectedTintToken = ColorTokenGeneratedMock.random()

        let colors1 = SegmentedControlColors(
            backgroundColorToken: backgroundToken,
            borderColorToken: borderToken,
            separatorColorToken: separatorToken,
            selectedItemBackgroundColorToken: selectedItemBackgroundToken,
            selectedItemBorderColorToken: selectedItemBorderToken,
            accessibilitySelectedTintColorToken: accessibilitySelectedTintToken,
            accessibilitySelectedBackgroundColorToken: ColorTokenGeneratedMock.random()
        )

        let colors2 = SegmentedControlColors(
            backgroundColorToken: backgroundToken,
            borderColorToken: borderToken,
            separatorColorToken: separatorToken,
            selectedItemBackgroundColorToken: selectedItemBackgroundToken,
            selectedItemBorderColorToken: selectedItemBorderToken,
            accessibilitySelectedTintColorToken: accessibilitySelectedTintToken,
            accessibilitySelectedBackgroundColorToken: ColorTokenGeneratedMock.random()
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
