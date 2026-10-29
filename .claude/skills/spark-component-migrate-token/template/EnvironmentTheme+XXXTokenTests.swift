//
//  EnvironmentTheme+XXXTokenTests.swift
//  SparkComponentXXXTests
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentXXX
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeXXXTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    private var token: XXXToken {
        return self.theme.component.xxx
    }

    // MARK: - Tests

    @Test
    func borderShouldReturnXXXBorder() {
        #expect(self.environmentTheme.border == self.token.border)
    }

    @Test
    func colorsShouldReturnXXXColors() {
        #expect(self.environmentTheme.colors == self.token.colors)
    }

    @Test
    func layoutShouldReturnXXXLayout() {
        #expect(self.environmentTheme.layout == self.token.layout)
    }

    @Test
    func opacityShouldReturnXXXOpacity() {
        #expect(self.environmentTheme.opacity == self.token.opacity)
    }

    @Test
    func typographyShouldReturnXXXTypography() {
        #expect(self.environmentTheme.typography == self.token.typography)
    }

    @Test
    func sizeShouldReturnXXXSize() {
        #expect(self.environmentTheme.size == self.token.size)
    }
}
