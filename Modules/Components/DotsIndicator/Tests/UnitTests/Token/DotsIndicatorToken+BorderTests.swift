//
//  DotsIndicatorToken+BorderTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentDotsIndicator
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct DotsIndicatorTokenBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: DotsIndicatorToken.Border {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Radius should return radius full")
    func radiusShouldReturnRadiusFull() {
        #expect(self.token.radius == self.theme.border.radius.full)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(DotsIndicatorToken.Border(theme: self.theme) == DotsIndicatorToken.Border(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(DotsIndicatorToken.Border(theme: self.theme) != DotsIndicatorToken.Border(theme: ThemeGeneratedMock.mocked2()))
    }
}
