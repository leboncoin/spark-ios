//
//  SegmentedControlToken+ColorsTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct SegmentedControlTokenColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: SegmentedControlToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func accessibilitySelectedBackgroundShouldReturnSupport() {
        #expect(self.token.accessibilitySelectedBackground.equals(self.theme.colors.support.support))
    }

    @Test
    func accessibilitySelectedTintShouldReturnOnSupport() {
        #expect(self.token.accessibilitySelectedTint.equals(self.theme.colors.support.onSupport))
    }

    @Test
    func backgroundShouldReturnSurface() {
        #expect(self.token.background.equals(self.theme.colors.base.surface))
    }

    @Test
    func borderShouldReturnOutline() {
        #expect(self.token.border.equals(self.theme.colors.base.outline))
    }

    @Test
    func itemContentShouldReturnOnSupportContainer() {
        #expect(self.token.itemContent.equals(self.theme.colors.support.onSupportContainer))
    }

    @Test
    func separatorShouldReturnOutlineWithDim3() {
        // GIVEN
        let expectedColorToken = self.theme.colors.base.outline.opacity(self.theme.dims.dim3)

        // WHEN / THEN
        #expect(self.token.separator.equals(expectedColorToken))
    }

    @Test
    func selectedItemBackgroundShouldReturnSupportContainer() {
        #expect(self.token.selectedItemBackground.equals(self.theme.colors.support.supportContainer))
    }

    @Test
    func selectedItemBorderShouldReturnSupport() {
        #expect(self.token.selectedItemBorder.equals(self.theme.colors.support.support))
    }

    @Test
    func itemBackgroundWhenPressedAndNotSelectedShouldReturnSupportContainerPressed() {
        // GIVEN / WHEN
        let result = self.token.itemBackground(isSelected: false, isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.supportContainerPressed))
    }

    @Test(
        arguments: [
            (false, false),
            (true, false),
            (true, true)
        ]
    )
    func itemBackgroundShouldReturnClear(isSelected: Bool, isPressed: Bool) {
        // GIVEN / WHEN
        let result = self.token.itemBackground(isSelected: isSelected, isPressed: isPressed)

        // THEN
        #expect(result.equals(ColorTokenClear()))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken.Colors(theme: self.theme)
        let rhs = SegmentedControlToken.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken.Colors(theme: self.theme)
        let rhs = SegmentedControlToken.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
