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

    @Test
    func xxxShouldReturnTokenFromTheme() {
        #expect(ComponentToken(theme: self.theme).xxx == XXXToken(theme: self.theme))
    }

    @Test
    func xxxFromThemeComponentShouldReturnTokenFromTheme() {
        #expect(self.theme.component.xxx == XXXToken(theme: self.theme))
    }

    @Test
    func xxxWithDifferentThemeShouldNotReturnTokenFromTheme() {
        #expect(ComponentToken(theme: ThemeGeneratedMock.mocked2()).xxx != XXXToken(theme: self.theme))
    }
}
