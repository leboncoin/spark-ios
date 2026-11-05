//
//  TextLinkGetImageSizeUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkComponentTextLinkTesting

@Suite("TextLink Get Image Size UseCase Tests")
struct TextLinkGetImageSizeUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private let typographiesMock = TextLinkTypographies()
    private let mockTypographiesUseCase = TextLinkGetTypographiesUseCaseableGeneratedMock()
    private let useCase: TextLinkGetImageSizeUseCase

    // MARK: - Setup

    init() {
        self.useCase = TextLinkGetImageSizeUseCase(typographiesUseCase: self.mockTypographiesUseCase)

        self.mockTypographiesUseCase.reset()
        self.mockTypographiesUseCase.executeWithThemeAndTypographyReturnValue = self.typographiesMock
    }

    // MARK: - Tests

    @Test("Init with default dependencies should not call the typographies use case")
    func initWithDefaultDependencies() {
        // GIVEN / WHEN
        let defaultUseCase = TextLinkGetImageSizeUseCase()

        // THEN
        TextLinkGetTypographiesUseCaseableMockTest.expectCalled(
            self.mockTypographiesUseCase,
            executeWithThemeAndTypographyCalled: false
        )
    }

    @Test("Execute should call the typographies use case")
    func executeCallsTypographiesUseCase() {
        // GIVEN
        let typography = TextLinkTypography.body1

        // WHEN
        _ = self.useCase.execute(theme: self.theme, typography: typography)

        // THEN
        TextLinkGetTypographiesUseCaseableMockTest.expect(
            self.mockTypographiesUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenTypography: typography,
            expectedReturnValue: self.typographiesMock
        )
    }

    @Test("Execute should return the correct image size")
    func executeReturnsCorrectImageSize() {
        // GIVEN
        let typographies = [TextLinkTypography.body1, .display3]

        for typography in typographies {
            let expectedLineHeight = self.typographiesMock.highlight.uiFont.lineHeight
            let expectedPointSize = self.typographiesMock.highlight.uiFont.pointSize
            let expectedPadding = (abs(expectedLineHeight - expectedPointSize)) / 2

            // WHEN
            let result = self.useCase.execute(theme: self.theme, typography: typography)

            // THEN
            #expect(result.size == expectedPointSize, "Wrong size for \(typography)")
            #expect(result.padding == expectedPadding, "Wrong padding for \(typography)")
        }
    }
}
