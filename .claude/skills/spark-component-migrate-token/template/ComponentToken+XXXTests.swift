//
//  ComponentToken+XXXTests.swift
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

struct ComponentTokenXXXTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("XXX should return token from theme")
    func xxxShouldReturnTokenFromTheme() {
        #expect(ComponentToken(theme: self.theme).xxx == XXXToken(theme: self.theme))
    }

    @Test("XXX from theme component should return token from theme")
    func xxxFromThemeComponentShouldReturnTokenFromTheme() {
        #expect(self.theme.component.xxx == XXXToken(theme: self.theme))
    }

    @Test("XXX with different theme should not return token from theme")
    func xxxWithDifferentThemeShouldNotReturnTokenFromTheme() {
        #expect(ComponentToken(theme: ThemeGeneratedMock.mocked2()).xxx != XXXToken(theme: self.theme))
    }
}
