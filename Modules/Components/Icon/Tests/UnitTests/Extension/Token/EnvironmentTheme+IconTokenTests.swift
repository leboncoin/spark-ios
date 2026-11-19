//
//  EnvironmentTheme+IconTokenTests.swift
//  SparkComponentIconTests
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentIcon
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeIconTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    private var token: IconToken {
        return self.theme.component.icon
    }

    // MARK: - Tests

    @Test("Colors should return Icon colors")
    func colorsShouldReturnIconColors() {
        #expect(self.environmentTheme.colors == self.token.colors)
    }

    @Test("Size should return Icon size")
    func sizeShouldReturnIconSize() {
        #expect(self.environmentTheme.size == self.token.size)
    }
}
