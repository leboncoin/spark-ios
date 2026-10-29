//
//  XXXTokenTests.swift
//  SparkComponentXXXTests
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentXXX
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct XXXTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func initShouldSetAllCategories() {
        // GIVEN / WHEN
        let token = XXXToken(theme: self.theme)

        // THEN
        #expect(token.border == .init(theme: self.theme))
        #expect(token.typography == .init(theme: self.theme))
        #expect(token.size == .init())
    }

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(XXXToken(theme: self.theme) == XXXToken(theme: self.theme))
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(XXXToken(theme: self.theme) != XXXToken(theme: ThemeGeneratedMock.mocked2()))
    }
}
