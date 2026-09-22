//
//  TextLinkGetImageSizeUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkComponentTextLinkTesting

final class TextLinkGetImageSizeUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private let typographiesMock = TextLinkTypographies()
    private let mockTypographiesUseCase = TextLinkGetTypographiesUseCaseableGeneratedMock()
    private lazy var useCase = TextLinkGetImageSizeUseCase(typographiesUseCase: self.mockTypographiesUseCase)

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.mockTypographiesUseCase.reset()
        self.mockTypographiesUseCase.executeWithThemeAndTypographyReturnValue = self.typographiesMock
    }

    // MARK: - Tests

    func test_init_with_default_dependencies() {
        // GIVEN / WHEN
        let defaultUseCase = TextLinkGetImageSizeUseCase()

        // THEN
        TextLinkGetTypographiesUseCaseableMockTest.XCTCalled(
            self.mockTypographiesUseCase,
            executeWithThemeAndTypographyCalled: false
        )
    }

    func test_execute_calls_typographies_use_case() {
        // GIVEN
        let typography = TextLinkTypography.body1

        // WHEN
        _ = self.useCase.execute(theme: self.theme, typography: typography)

        // THEN
        TextLinkGetTypographiesUseCaseableMockTest.XCTAssert(
            self.mockTypographiesUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenTypography: typography,
            expectedReturnValue: self.typographiesMock
        )
    }

    func test_execute_returns_correct_image_size() {
        // GIVEN
        let typographies = [TextLinkTypography.body1, .display3]

        for typography in typographies {
            let expectedLineHeight = self.typographiesMock.highlight.uiFont.lineHeight
            let expectedPointSize = self.typographiesMock.highlight.uiFont.pointSize
            let expectedPadding = (abs(expectedLineHeight - expectedPointSize)) / 2

            // WHEN
            let result = self.useCase.execute(theme: self.theme, typography: typography)

            // THEN
            XCTAssertEqual(result.size, expectedPointSize, "Wrong size for \(typography)")
            XCTAssertEqual(result.padding, expectedPadding, "Wrong padding for \(typography)")
        }
    }
}
