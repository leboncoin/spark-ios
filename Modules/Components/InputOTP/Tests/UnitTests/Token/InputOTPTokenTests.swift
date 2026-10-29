//
//  InputOTPTokenTests.swift
//  SparkComponentInputOTPTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct InputOTPTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Init should set all categories")
    func initShouldSetAllCategories() {
        // GIVEN / WHEN
        let token = InputOTPToken(theme: self.theme)

        // THEN
        #expect(token.border == .init(theme: self.theme))
        #expect(token.colors == .init(theme: self.theme))
        #expect(token.layout == .init(theme: self.theme))
        #expect(token.opacity == .init(theme: self.theme))
        #expect(token.typography == .init(theme: self.theme))
        #expect(token.size == .init())
    }

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken(theme: self.theme) == InputOTPToken(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(InputOTPToken(theme: self.theme) != InputOTPToken(theme: ThemeGeneratedMock.mocked2()))
    }
}
