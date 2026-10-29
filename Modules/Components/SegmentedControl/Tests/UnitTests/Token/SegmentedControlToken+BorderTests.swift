//
//  SegmentedControlToken+BorderTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct SegmentedControlTokenBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: SegmentedControlToken.Border {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Radius should return half of min height")
    func radiusShouldReturnHalfOfMinHeight() {
        #expect(self.token.radius == 22)
    }

    @Test("Selected item radius should return radius minus spacing small")
    func selectedItemRadiusShouldReturnRadiusMinusSpacingSmall() {
        #expect(self.token.selectedItemRadius == 22 - self.theme.layout.spacing.small)
    }

    @Test("Selected item width should return border width small")
    func selectedItemWidthShouldReturnBorderWidthSmall() {
        #expect(self.token.selectedItemWidth == self.theme.border.width.small)
    }

    @Test("Width should return border width small")
    func widthShouldReturnBorderWidthSmall() {
        #expect(self.token.width == self.theme.border.width.small)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken.Border(theme: self.theme)
        let rhs = SegmentedControlToken.Border(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken.Border(theme: self.theme)
        let rhs = SegmentedControlToken.Border(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
