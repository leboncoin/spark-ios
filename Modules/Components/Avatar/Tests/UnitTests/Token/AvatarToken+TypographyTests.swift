//
//  AvatarToken+TypographyTests.swift
//  SparkComponentAvatarTests
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct AvatarTokenTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: AvatarToken.Typography {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func placeholderFontTokenShouldReturnExpectedFontTokens() {
        // GIVEN
        let typography = self.theme.typography

        // WHEN / THEN
        #expect(self.token.placeholderFontToken(size: .xs).equals(typography.body2Highlight))
        #expect(self.token.placeholderFontToken(size: .sm).equals(typography.headline2))
        #expect(self.token.placeholderFontToken(size: .md).equals(typography.display3))
        #expect(self.token.placeholderFontToken(size: .lg).equals(typography.display2))
        #expect(self.token.placeholderFontToken(size: .xl).equals(typography.display2))
        #expect(self.token.placeholderFontToken(size: .xxl).equals(typography.display1))
    }

    @Test
    func placeholderFontTokenWithXxxlSizeShouldReturnCustomFontToken() throws {
        // GIVEN
        let typographyMocked = try #require(self.theme.typography as? TypographyGeneratedMock)

        // WHEN
        let result = self.token.placeholderFontToken(size: .xxxl)

        // THEN
        let expectedFontToken = try #require(typographyMocked.customWithSizeAndWeightAndStyleReturnValue)
        #expect(result.equals(expectedFontToken))

        let arguments = try #require(typographyMocked.customWithSizeAndWeightAndStyleReceivedArguments)
        #expect(arguments.size == 64)
        #expect(arguments.weight == .bold)
        #expect(arguments.style == .largeTitle)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = AvatarToken.Typography(theme: self.theme)
        let rhs = AvatarToken.Typography(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = AvatarToken.Typography(theme: self.theme)
        let rhs = AvatarToken.Typography(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
