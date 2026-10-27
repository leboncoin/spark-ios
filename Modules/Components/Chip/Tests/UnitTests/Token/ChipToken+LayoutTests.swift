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

    @Test
    func spacingWhenLeadingIconShouldReturnSpacingSmall() {
        #expect(self.token.spacing(alignment: .leadingIcon) == self.theme.layout.spacing.small)
    }

    @Test
    func spacingWhenTrailingIconShouldReturnSpacingMedium() {
        #expect(self.token.spacing(alignment: .trailingIcon) == self.theme.layout.spacing.medium)
    }

    @Test
    func extraContentSpacingShouldReturnSpacingMedium() {
        #expect(self.token.extraContentSpacing == self.theme.layout.spacing.medium)
    }

    @Test
    func horizontalPaddingShouldReturn12() {
        #expect(self.token.horizontalPadding == 12)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = ChipToken.Layout(theme: self.theme)
        let rhs = ChipToken.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = ChipToken.Layout(theme: self.theme)
        let rhs = ChipToken.Layout(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
