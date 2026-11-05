//
//  TextLinkGetTypographiesUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

@Suite("Text Link Get Typographies UseCase Tests")
struct TextLinkGetTypographiesUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetTypographiesUseCase()

    // MARK: - Tests

    @Test("Execute display 1")
    func executeDisplay1() {
        // GIVEN
        let typography = TextLinkTypography.display1

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.display1))
        #expect(result.highlight.equals(self.theme.typography.display1))
    }

    @Test("Execute display 2")
    func executeDisplay2() {
        // GIVEN
        let typography = TextLinkTypography.display2

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.display2))
        #expect(result.highlight.equals(self.theme.typography.display2))
    }

    @Test("Execute display 3")
    func executeDisplay3() {
        // GIVEN
        let typography = TextLinkTypography.display3

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.display3))
        #expect(result.highlight.equals(self.theme.typography.display3))
    }

    @Test("Execute headline 1")
    func executeHeadline1() {
        // GIVEN
        let typography = TextLinkTypography.headline1

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.headline1))
        #expect(result.highlight.equals(self.theme.typography.headline1))
    }

    @Test("Execute headline 2")
    func executeHeadline2() {
        // GIVEN
        let typography = TextLinkTypography.headline2

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.headline2))
        #expect(result.highlight.equals(self.theme.typography.headline2))
    }

    @Test("Execute subhead")
    func executeSubhead() {
        // GIVEN
        let typography = TextLinkTypography.subhead

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.subhead))
        #expect(result.highlight.equals(self.theme.typography.subhead))
    }

    @Test("Execute body 1")
    func executeBody1() {
        // GIVEN
        let typography = TextLinkTypography.body1

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.body1))
        #expect(result.highlight.equals(self.theme.typography.body1Highlight))
    }

    @Test("Execute body 2")
    func executeBody2() {
        // GIVEN
        let typography = TextLinkTypography.body2

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.body2))
        #expect(result.highlight.equals(self.theme.typography.body2Highlight))
    }

    @Test("Execute caption")
    func executeCaption() {
        // GIVEN
        let typography = TextLinkTypography.caption

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.caption))
        #expect(result.highlight.equals(self.theme.typography.captionHighlight))
    }

    @Test("Execute small")
    func executeSmall() {
        // GIVEN
        let typography = TextLinkTypography.small

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.small))
        #expect(result.highlight.equals(self.theme.typography.smallHighlight))
    }

    @Test("Execute callout")
    func executeCallout() {
        // GIVEN
        let typography = TextLinkTypography.callout

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            typography: typography
        )

        // THEN
        #expect(result.normal.equals(self.theme.typography.callout))
        #expect(result.highlight.equals(self.theme.typography.callout))
    }
}
