//
//  ChipToken+TypographyTests.swift
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

struct ChipTokenTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: ChipToken.Typography {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func titleShouldReturnBody1() {
        #expect(self.token.title.equals(self.theme.typography.body1))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = ChipToken.Typography(theme: self.theme)
        let rhs = ChipToken.Typography(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = ChipToken.Typography(theme: self.theme)
        let rhs = ChipToken.Typography(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
