//
//  ChipToken+LayoutTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ChipTokenLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: ChipToken.Layout {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Spacing when leading icon should return spacing small")
    func spacingWhenLeadingIconShouldReturnSpacingSmall() {
        #expect(self.token.spacing(alignment: .leadingIcon) == self.theme.layout.spacing.small)
    }

    @Test("Spacing when trailing icon should return spacing medium")
    func spacingWhenTrailingIconShouldReturnSpacingMedium() {
        #expect(self.token.spacing(alignment: .trailingIcon) == self.theme.layout.spacing.medium)
    }

    @Test("Extra content spacing should return spacing medium")
    func extraContentSpacingShouldReturnSpacingMedium() {
        #expect(self.token.extraContentSpacing == self.theme.layout.spacing.medium)
    }

    @Test("Horizontal padding should return 12")
    func horizontalPaddingShouldReturn12() {
        #expect(self.token.horizontalPadding == 12)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = ChipToken.Layout(theme: self.theme)
        let rhs = ChipToken.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = ChipToken.Layout(theme: self.theme)
        let rhs = ChipToken.Layout(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
