//
//  TypographyRuleTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct TypographyRuleTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func valueWithXsSizeShouldReturnExpectedFontToken() {
        // WHEN
        let result = self.theme.placeholderFontToken(size: .xs)

        let expectedFontToken = self.theme.typography.body2Highlight

        // THEN
        #expect(result.equals(expectedFontToken))
    }

    @Test
    func valueWithSmSizeShouldReturnExpectedFontToken() {
        // WHEN
        let result = self.theme.placeholderFontToken(size: .sm)

        let expectedFontToken = self.theme.typography.headline2

        // THEN
        #expect(result.equals(expectedFontToken))
    }

    @Test
    func valueWithMdSizeShouldReturnExpectedFontToken() {
        // WHEN
        let result = self.theme.placeholderFontToken(size: .md)

        let expectedFontToken = self.theme.typography.display3

        // THEN
        #expect(result.equals(expectedFontToken))
    }

    @Test(arguments: [AvatarSize.lg, .xl])
    func valueWithLgOrXlSizeShouldReturnExpectedFontToken(size: AvatarSize) {
        // WHEN
        let result = self.theme.placeholderFontToken(size: size)

        let expectedFontToken = self.theme.typography.display2

        // THEN
        #expect(result.equals(expectedFontToken))
    }

    @Test
    func valueWithXxlSizeShouldReturnExpectedFontToken() {
        // WHEN
        let result = self.theme.placeholderFontToken(size: .xxl)

        let expectedFontToken = self.theme.typography.display1

        // THEN
        #expect(result.equals(expectedFontToken))
    }

    @Test
    func valueWithXxxlSizeShouldReturnCustomFontToken() throws {
        // GIVEN
        let typographyMocked = try #require(self.theme.typography as? TypographyGeneratedMock)

        // WHEN
        let result = self.theme.placeholderFontToken(size: .xxxl)

        let expectedFontToken = try #require(typographyMocked.customWithSizeAndWeightAndStyleReturnValue)

        // THEN
        #expect(result.equals(expectedFontToken))

        let arguments = try #require(typographyMocked.customWithSizeAndWeightAndStyleReceivedArguments)
        #expect(arguments.size == 64)
        #expect(arguments.weight == .bold)
        #expect(arguments.style == .largeTitle)
    }
}
