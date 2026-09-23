//
//  TextLinkGetTypographiesUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

final class TextLinkGetTypographiesUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetTypographiesUseCase()

    // MARK: - Tests

    func test_execute_display1() {
        // GIVEN
        let typography = TextLinkTypography.display1

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.display1))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.display1))
    }

    func test_execute_display2() {
        // GIVEN
        let typography = TextLinkTypography.display2

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.display2))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.display2))
    }

    func test_execute_display3() {
        // GIVEN
        let typography = TextLinkTypography.display3

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.display3))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.display3))
    }

    func test_execute_headline1() {
        // GIVEN
        let typography = TextLinkTypography.headline1

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.headline1))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.headline1))
    }

    func test_execute_headline2() {
        // GIVEN
        let typography = TextLinkTypography.headline2

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.headline2))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.headline2))
    }

    func test_execute_subhead() {
        // GIVEN
        let typography = TextLinkTypography.subhead

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.subhead))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.subhead))
    }

    func test_execute_body1() {
        // GIVEN
        let typography = TextLinkTypography.body1

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.body1))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.body1Highlight))
    }

    func test_execute_body2() {
        // GIVEN
        let typography = TextLinkTypography.body2

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.body2))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.body2Highlight))
    }

    func test_execute_caption() {
        // GIVEN
        let typography = TextLinkTypography.caption

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.caption))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.captionHighlight))
    }

    func test_execute_small() {
        // GIVEN
        let typography = TextLinkTypography.small

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.small))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.smallHighlight))
    }

    func test_execute_callout() {
        // GIVEN
        let typography = TextLinkTypography.callout

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        XCTAssertTrue(result.normal.equals(self.theme.typography.callout))
        XCTAssertTrue(result.highlight.equals(self.theme.typography.callout))
    }
}
