//
//  PopoverTokenTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentPopover
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct PopoverTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Init should set all categories")
    func initShouldSetAllCategories() {
        // GIVEN / WHEN
        let token = PopoverToken(theme: self.theme)

        // THEN
        #expect(token.colors == .init(theme: self.theme))
        #expect(token.layout == .init(theme: self.theme))
    }

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(PopoverToken(theme: self.theme) == PopoverToken(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(PopoverToken(theme: self.theme) != PopoverToken(theme: ThemeGeneratedMock.mocked2()))
    }
}
