//
//  SegmentedControlToken+OpacityTests.swift
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

struct SegmentedControlTokenOpacityTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: SegmentedControlToken.Opacity {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Opacity when enabled should return dim none")
    func opacityWhenEnabledShouldReturnDimNone() {
        #expect(self.token.value(isEnabled: true) == self.theme.dims.none)
    }

    @Test("Opacity when disabled should return dim 3")
    func opacityWhenDisabledShouldReturnDim3() {
        #expect(self.token.value(isEnabled: false) == self.theme.dims.dim3)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken.Opacity(theme: self.theme)
        let rhs = SegmentedControlToken.Opacity(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken.Opacity(theme: self.theme)
        let rhs = SegmentedControlToken.Opacity(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
