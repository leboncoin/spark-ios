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

    @Test("Accessibility selected background should return support")
    func accessibilitySelectedBackgroundShouldReturnSupport() {
        #expect(self.token.accessibilitySelectedBackground.equals(self.theme.colors.support.support))
    }

    @Test("Accessibility selected tint should return on support")
    func accessibilitySelectedTintShouldReturnOnSupport() {
        #expect(self.token.accessibilitySelectedTint.equals(self.theme.colors.support.onSupport))
    }

    @Test("Background should return surface")
    func backgroundShouldReturnSurface() {
        #expect(self.token.background.equals(self.theme.colors.base.surface))
    }

    @Test("Border should return outline")
    func borderShouldReturnOutline() {
        #expect(self.token.border.equals(self.theme.colors.base.outline))
    }

    @Test("Item content should return on support container")
    func itemContentShouldReturnOnSupportContainer() {
        #expect(self.token.itemContent.equals(self.theme.colors.support.onSupportContainer))
    }

    @Test("Separator should return outline with dim 3")
    func separatorShouldReturnOutlineWithDim3() {
        // GIVEN
        let expectedColorToken = self.theme.colors.base.outline.opacity(self.theme.dims.dim3)

        // WHEN / THEN
        #expect(self.token.separator.equals(expectedColorToken))
    }

    @Test("Selected item background should return support container")
    func selectedItemBackgroundShouldReturnSupportContainer() {
        #expect(self.token.selectedItemBackground.equals(self.theme.colors.support.supportContainer))
    }

    @Test("Selected item border should return support")
    func selectedItemBorderShouldReturnSupport() {
        #expect(self.token.selectedItemBorder.equals(self.theme.colors.support.support))
    }

    @Test("Item background when pressed and not selected should return support container pressed")
    func itemBackgroundWhenPressedAndNotSelectedShouldReturnSupportContainerPressed() {
        // GIVEN / WHEN
        let result = self.token.itemBackground(isSelected: false, isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.supportContainerPressed))
    }

    @Test("Item background should return clear",
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

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken.Colors(theme: self.theme)
        let rhs = SegmentedControlToken.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken.Colors(theme: self.theme)
        let rhs = SegmentedControlToken.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
