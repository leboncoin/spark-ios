//
//  DotsIndicatorTokenTests.swift
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

struct DotsIndicatorTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Init should set all categories")
    func initShouldSetAllCategories() {
        // GIVEN / WHEN
        let token = DotsIndicatorToken(theme: self.theme)

        // THEN
        #expect(token.border == .init(theme: self.theme))
        #expect(token.colors == .init(theme: self.theme))
        #expect(token.layout == .init(theme: self.theme))
        #expect(token.opacity == .init(theme: self.theme))
        #expect(token.size == .init())
        #expect(token.animation == .init())
    }

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(DotsIndicatorToken(theme: self.theme) == DotsIndicatorToken(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(DotsIndicatorToken(theme: self.theme) != DotsIndicatorToken(theme: ThemeGeneratedMock.mocked2()))
    }
}
