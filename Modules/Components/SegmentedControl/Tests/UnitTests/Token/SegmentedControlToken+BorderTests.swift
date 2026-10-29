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

    @Test
    func radiusShouldReturnHalfOfMinHeight() {
        #expect(self.token.radius == 22)
    }

    @Test
    func selectedItemRadiusShouldReturnRadiusMinusSpacingSmall() {
        #expect(self.token.selectedItemRadius == 22 - self.theme.layout.spacing.small)
    }

    @Test
    func selectedItemWidthShouldReturnBorderWidthSmall() {
        #expect(self.token.selectedItemWidth == self.theme.border.width.small)
    }

    @Test
    func widthShouldReturnBorderWidthSmall() {
        #expect(self.token.width == self.theme.border.width.small)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken.Border(theme: self.theme)
        let rhs = SegmentedControlToken.Border(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken.Border(theme: self.theme)
        let rhs = SegmentedControlToken.Border(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
