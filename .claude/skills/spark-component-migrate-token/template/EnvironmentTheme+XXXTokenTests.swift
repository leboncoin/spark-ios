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

    @Test("Border should return XXX border")
    func borderShouldReturnXXXBorder() {
        #expect(self.environmentTheme.border == self.token.border)
    }

    @Test("Colors should return XXX colors")
    func colorsShouldReturnXXXColors() {
        #expect(self.environmentTheme.colors == self.token.colors)
    }

    @Test("Layout should return XXX layout")
    func layoutShouldReturnXXXLayout() {
        #expect(self.environmentTheme.layout == self.token.layout)
    }

    @Test("Opacity should return XXX opacity")
    func opacityShouldReturnXXXOpacity() {
        #expect(self.environmentTheme.opacity == self.token.opacity)
    }

    @Test("Typography should return XXX typography")
    func typographyShouldReturnXXXTypography() {
        #expect(self.environmentTheme.typography == self.token.typography)
    }

    @Test("Size should return XXX size")
    func sizeShouldReturnXXXSize() {
        #expect(self.environmentTheme.size == self.token.size)
    }
}
