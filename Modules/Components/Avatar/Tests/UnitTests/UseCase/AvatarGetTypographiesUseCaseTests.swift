//
//  AvatarGetTypographiesUseCaseTests.swift
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

struct AvatarGetTypographiesUseCaseTests {

    // MARK: - Properties

    private let sut = AvatarGetTypographiesUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func executeWithXsSizeShouldReturnExpectedTypographies() {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .xs
        )

        let expectedTypographies = AvatarTypographies(
            placeholderFontToken: self.theme.typography.body2Highlight
        )

        // THEN
        #expect(result == expectedTypographies)
    }

    @Test
    func executeWithSmSizeShouldReturnExpectedTypographies() {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .sm
        )

        let expectedTypographies = AvatarTypographies(
            placeholderFontToken: self.theme.typography.headline2
        )

        // THEN
        #expect(result == expectedTypographies)
    }

    @Test
    func executeWithMdSizeShouldReturnExpectedTypographies() {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .md
        )

        let expectedTypographies = AvatarTypographies(
            placeholderFontToken: self.theme.typography.display3
        )

        // THEN
        #expect(result == expectedTypographies)
    }

    @Test(arguments: [AvatarSize.lg, .xl])
    func executeWithLgOrXlSizeShouldReturnExpectedTypographies(size: AvatarSize) {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: size
        )

        let expectedTypographies = AvatarTypographies(
            placeholderFontToken: self.theme.typography.display2
        )

        // THEN
        #expect(result == expectedTypographies)
    }

    @Test
    func executeWithXxlSizeShouldReturnExpectedTypographies() {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .xxl
        )

        let expectedTypographies = AvatarTypographies(
            placeholderFontToken: self.theme.typography.display1
        )

        // THEN
        #expect(result == expectedTypographies)
    }

    @Test
    func executeWithXxxlSizeShouldReturnCustomTypography() throws {
        // GIVEN
        let typographyMocked = try #require(self.theme.typography as? TypographyGeneratedMock)

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .xxxl
        )

        let expectedTypographies = AvatarTypographies(
            placeholderFontToken: typographyMocked.customWithSizeAndWeightAndStyleReturnValue
        )

        // THEN
        #expect(result == expectedTypographies)

        let arguments = try #require(typographyMocked.customWithSizeAndWeightAndStyleReceivedArguments)
        #expect(arguments.size == 64)
        #expect(arguments.weight == .bold)
        #expect(arguments.style == .largeTitle)
    }
}
