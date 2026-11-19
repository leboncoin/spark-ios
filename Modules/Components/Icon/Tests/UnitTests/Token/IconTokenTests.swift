//
//  IconTokenTests.swift
//  SparkComponentIconTests
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentIcon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct IconTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Initialization should set all properties")
    func initializationShouldSetAllProperties() {
        // GIVEN / WHEN
        let token = IconToken(theme: self.theme)

        // THEN
        #expect(token.colors == IconToken.Colors(theme: self.theme))
        #expect(token.size == IconToken.Size())
    }

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(IconToken(theme: self.theme) == IconToken(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(IconToken(theme: self.theme) != IconToken(theme: ThemeGeneratedMock.mocked2()))
    }
}
