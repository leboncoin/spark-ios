//
//  TextLinkGetAttributedStringUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import UIKit
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkComponentTextLinkTesting
import SwiftUI

final class TextLinkGetAttributedStringUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private let colorTokenMock = ColorTokenGeneratedMock.blue()
    private let typographiesMock = TextLinkTypographies()
    private let underlineStyleMock = NSUnderlineStyle(Text.LineStyle.single)

    private let mockColorUseCase = TextLinkGetColorUseCaseableGeneratedMock()
    private let mockTypographiesUseCase = TextLinkGetTypographiesUseCaseableGeneratedMock()
    private let mockUnderlineStyleUseCase = TextLinkGetUnderlineStyleUseCaseableGeneratedMock()

    private lazy var useCase = TextLinkGetAttributedStringUseCase(
        colorUseCase: self.mockColorUseCase,
        typographiesUseCase: self.mockTypographiesUseCase,
        getUnderlineStyleUseCase: self.mockUnderlineStyleUseCase
    )

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.mockColorUseCase.executeWithThemeAndIntentAndIsHighlightedReturnValue = self.colorTokenMock
        self.mockTypographiesUseCase.executeWithThemeAndTypographyReturnValue = self.typographiesMock
        self.mockUnderlineStyleUseCase.executeWithVariantAndIsHighlightedReturnValue = self.underlineStyleMock

        self.mockColorUseCase.reset()
        self.mockTypographiesUseCase.reset()
        self.mockUnderlineStyleUseCase.reset()
    }

    // MARK: - Tests

    func test_init_with_default_dependencies() {
        // GIVEN / WHEN
        let defaultUseCase = TextLinkGetAttributedStringUseCase()

        // THEN
        XCTAssertNotNil(defaultUseCase, "UseCase should initialize with default dependencies")
    }

    func test_execute_calls_dependencies() {
        // GIVEN
        let intent = TextLinkIntent.main
        let variant = TextLinkVariant.underline
        let typography = TextLinkTypography.body1
        let text = "Test text"
        let textHighlightRange: NSRange? = nil
        let isHighlighted = false

        // WHEN
        _ = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            typography: typography,
            text: text,
            textHighlightRange: textHighlightRange,
            isHighlighted: isHighlighted
        )

        // THEN

        // Color
        TextLinkGetColorUseCaseableMockTest.XCTAssert(
            self.mockColorUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsHighlighted: isHighlighted,
            expectedReturnValue: self.colorTokenMock
        )

        // Typographies
        TextLinkGetTypographiesUseCaseableMockTest.XCTAssert(
            self.mockTypographiesUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenTypography: typography,
            expectedReturnValue: self.typographiesMock
        )

        // Underline Style
        TextLinkGetUnderlineStyleUseCaseableMockTest.XCTAssert(
            self.mockUnderlineStyleUseCase,
            expectedNumberOfCalls: 1,
            givenVariant: variant,
            givenIsHighlighted: isHighlighted,
            expectedReturnValue: self.underlineStyleMock
        )
    }

    func test_execute_with_no_highlight_range() {
        // GIVEN
        let intent = TextLinkIntent.main
        let variant = TextLinkVariant.underline
        let typography = TextLinkTypography.body1
        let text = "Test text"
        let textHighlightRange: NSRange? = nil
        let isHighlighted = false

        var expectedResult = AttributedString(text)
        expectedResult.foregroundColor = self.colorTokenMock.color
        expectedResult.font = self.typographiesMock.highlight.font
        expectedResult.underlineStyle = self.underlineStyleMock

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            typography: typography,
            text: text,
            textHighlightRange: textHighlightRange,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, expectedResult)
    }

    func test_execute_with_highlight_range() throws {
        // GIVEN
        let intent = TextLinkIntent.main
        let variant = TextLinkVariant.underline
        let typography = TextLinkTypography.body1
        let text = "Test text"
        let textHighlightRange = NSRange(location: 0, length: 4)
        let isHighlighted = false

        var expectedResult = AttributedString(text)
        expectedResult.foregroundColor = self.colorTokenMock.color
        expectedResult.font = self.typographiesMock.normal.font

        let expectedTextHighlightRange = try XCTUnwrap(Range(textHighlightRange, in: expectedResult))
        expectedResult[expectedTextHighlightRange].font = self.typographiesMock.highlight.font
        expectedResult[expectedTextHighlightRange].underlineStyle = self.underlineStyleMock

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            typography: typography,
            text: text,
            textHighlightRange: textHighlightRange,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, expectedResult)
    }

    func test_executeUI_calls_dependencies() {
        // GIVEN
        let intent = TextLinkIntent.main
        let variant = TextLinkVariant.underline
        let typography = TextLinkTypography.body1
        let text = "Test text"
        let textHighlightRange: NSRange? = nil
        let isHighlighted = false

        // WHEN
        _ = self.useCase.executeUI(
            theme: self.theme,
            intent: intent,
            variant: variant,
            typography: typography,
            text: text,
            textHighlightRange: textHighlightRange,
            isHighlighted: isHighlighted
        )

        // THEN

        // Color
        TextLinkGetColorUseCaseableMockTest.XCTAssert(
            self.mockColorUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsHighlighted: isHighlighted,
            expectedReturnValue: self.colorTokenMock
        )

        // Typographies
        TextLinkGetTypographiesUseCaseableMockTest.XCTAssert(
            self.mockTypographiesUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenTypography: typography,
            expectedReturnValue: self.typographiesMock
        )

        // Underline Style
        TextLinkGetUnderlineStyleUseCaseableMockTest.XCTAssert(
            self.mockUnderlineStyleUseCase,
            expectedNumberOfCalls: 1,
            givenVariant: variant,
            givenIsHighlighted: isHighlighted,
            expectedReturnValue: self.underlineStyleMock
        )
    }

    func test_executeUI_with_no_highlight_range() {
        // GIVEN
        let intent = TextLinkIntent.main
        let variant = TextLinkVariant.underline
        let typography = TextLinkTypography.body1
        let text = "Test text"
        let textHighlightRange: NSRange? = nil
        let isHighlighted = false

        let expectedResult = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: self.colorTokenMock.uiColor,
                .font: self.typographiesMock.highlight.uiFont,
                .underlineStyle: self.underlineStyleMock.rawValue,
                .underlineColor: self.colorTokenMock.uiColor
            ]
        )

        // WHEN
        let result = self.useCase.executeUI(
            theme: self.theme,
            intent: intent,
            variant: variant,
            typography: typography,
            text: text,
            textHighlightRange: textHighlightRange,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, expectedResult)
    }

    func test_executeUI_with_highlight_range() {
        // GIVEN
        let intent = TextLinkIntent.main
        let variant = TextLinkVariant.underline
        let typography = TextLinkTypography.body1
        let text = "Test text"
        let textHighlightRange = NSRange(location: 0, length: 4)
        let isHighlighted = false

        let expectedResult = NSMutableAttributedString(
            string: text,
            attributes: [
                .foregroundColor: self.colorTokenMock.uiColor,
                .font: self.typographiesMock.normal.uiFont
            ]
        )

        let expectedHighlightAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: self.colorTokenMock.uiColor,
            .font: self.typographiesMock.highlight.uiFont,
            .underlineStyle: self.underlineStyleMock.rawValue,
            .underlineColor: self.colorTokenMock.uiColor
        ]

        expectedResult.addAttributes(
            expectedHighlightAttributes,
            range: textHighlightRange
        )

        // WHEN
        let result = self.useCase.executeUI(
            theme: self.theme,
            intent: intent,
            variant: variant,
            typography: typography,
            text: text,
            textHighlightRange: textHighlightRange,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, expectedResult)
    }

    func test_executeUI_with_nil_underline_style() {
        // GIVEN
        let intent = TextLinkIntent.main
        let variant = TextLinkVariant.none
        let typography = TextLinkTypography.body1
        let text = "Test text"
        let textHighlightRange: NSRange? = nil
        let isHighlighted = false

        let expectedResult = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: self.colorTokenMock.uiColor,
                .font: self.typographiesMock.highlight.uiFont
            ]
        )

        self.mockUnderlineStyleUseCase.executeWithVariantAndIsHighlightedReturnValue = nil

        // WHEN
        let result = self.useCase.executeUI(
            theme: self.theme,
            intent: intent,
            variant: variant,
            typography: typography,
            text: text,
            textHighlightRange: textHighlightRange,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, expectedResult)
    }
}
