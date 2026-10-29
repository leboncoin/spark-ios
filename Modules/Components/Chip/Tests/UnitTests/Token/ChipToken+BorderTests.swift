//
//  ChipToken+BorderTests.swift
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

struct ChipTokenBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: ChipToken.Border {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Width should return border width small")
    func widthShouldReturnBorderWidthSmall() {
        #expect(self.token.width == self.theme.border.width.small)
    }

    @Test("Radius should return border radius full")
    func radiusShouldReturnBorderRadiusFull() {
        #expect(self.token.radius == self.theme.border.radius.full)
    }

    @Test("Dash should return expected value", arguments: [
        (ChipVariant.dashed, CGFloat(2)),
        (ChipVariant.outlined, CGFloat.zero),
        (ChipVariant.tinted, CGFloat.zero)
    ])
    func dashShouldReturnExpectedValue(variant: ChipVariant, expectedDash: CGFloat) {
        #expect(self.token.dash(variant: variant) == expectedDash)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = ChipToken.Border(theme: self.theme)
        let rhs = ChipToken.Border(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = ChipToken.Border(theme: self.theme)
        let rhs = ChipToken.Border(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
