//
//  SnackbarViewModelDeprecatedTests.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 04/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import Combine
import SparkTheming
import SparkComponentButton
@testable import SparkComponentSnackbar
@_spi(SI_SPI) @testable import SparkComponentSnackbarTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommonTesting

final class SnackbarViewModelDeprecatedTests: XCTestCase {

    private let theme = ThemeGeneratedMock.mocked()
    private var publishers: SnackbarPublishers!

    override func setUp() {
        super.setUp()
        self.publishers = nil
    }

    func setupPublishers(viewModel: SnackbarViewModelDeprecated) {
        self.publishers = .init(
            colors: PublisherMock(publisher: viewModel.$colors),
            border: PublisherMock(publisher: viewModel.$border),
            textFont: PublisherMock(publisher: viewModel.$textFont),
            buttonIntent: PublisherMock(publisher: viewModel.$buttonIntent),
            buttonVariant: PublisherMock(publisher: viewModel.$buttonVariant)
        )
        self.publishers.load()
    }

    func test_init() throws {
        // GIVEN
        let expectedTintColor = ColorTokenGeneratedMock.red()
        let expectedBackgroundColor = ColorTokenGeneratedMock.blue()
        let expectedBorderColor = ColorTokenGeneratedMock.green()
        let getColorsUseCaseMock = SnackbarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = .init(
            tintColorToken: expectedTintColor,
            backgroundColorToken: expectedBackgroundColor,
            borderColorToken: expectedBorderColor
        )

        let expectedButtonIntent = ButtonIntent.accent
        let expectedButtonVariant = ButtonVariant.outlined
        let getButtonTypeUseCaseMock = SnackbarGetButtonTypeUseCasableDeprecatedGeneratedMock()
        getButtonTypeUseCaseMock.executeWithIntentAndVariantReturnValue = .init(
            intent: expectedButtonIntent,
            variant: expectedButtonVariant
        )

        let expectedBorderWidth = self.theme.border.width.small
        let expectedBorderRadius = self.theme.border.radius.large
        let getBorderUseCaseMock = SnackbarGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = .init(
            width: expectedBorderWidth,
            radius: expectedBorderRadius
        )

        let expectedIntent = SnackbarIntent.support
        let expectedVariant = SnackbarVariant.tinted

        // WHEN
        let viewModel = SnackbarViewModelDeprecated(
            theme: self.theme,
            variant: expectedVariant,
            intent: expectedIntent,
            getColorsUseCase: getColorsUseCaseMock,
            getButtonTypeUseCase: getButtonTypeUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock
        )
        self.setupPublishers(viewModel: viewModel)

        // THEN - Values
        XCTAssertEqual(viewModel.intent, expectedIntent, "Wrong intent")
        XCTAssertEqual(viewModel.variant, expectedVariant, "Wrong variant")

        XCTAssertTrue(viewModel.colors.tintColorToken.equals(expectedTintColor), "Wrong tint color")
        XCTAssertTrue(viewModel.colors.backgroundColorToken.equals(expectedBackgroundColor), "Wrong background color")
        XCTAssertTrue(viewModel.colors.borderColorToken.equals(expectedBorderColor), "Wrong border color")

        let expectedFont = try XCTUnwrap(self.theme.typography.body2 as? TypographyFontTokenGeneratedMock, "Couldn't unwrap expectedFont")
        XCTAssertIdentical(viewModel.textFont as? TypographyFontTokenGeneratedMock, expectedFont, "Wrong textFont")

        XCTAssertEqual(viewModel.buttonIntent, expectedButtonIntent, "Wrong button intent")
        XCTAssertEqual(viewModel.buttonVariant, expectedButtonVariant, "Wrong button variant")

        XCTAssertEqual(viewModel.border.width, expectedBorderWidth, "Wrong border width")
        XCTAssertEqual(viewModel.border.radius, expectedBorderRadius, "Wrong border radius")

        // THEN - UseCases
        XCTAssertEqual(getColorsUseCaseMock.executeWithThemeAndIntentCallsCount, 1, "getColorsUseCaseMock.executeWithThemeAndIntent should have been called once")
        let getColorsUseCaseReceivedArguments = try XCTUnwrap(
            getColorsUseCaseMock.executeWithThemeAndIntentReceivedArguments,
            "Couldn't unwrap getColorsUseCaseReceivedArguments"
        )
        let getColorsUseCaseReceivedArgumentsTheme = try XCTUnwrap(getColorsUseCaseReceivedArguments.theme as? ThemeGeneratedMock, "Couldn't unwrap getColorsUseCaseReceivedArgumentsTheme")
        XCTAssertIdentical(getColorsUseCaseReceivedArgumentsTheme, self.theme as? ThemeGeneratedMock, "Wrong received getColorsUseCase.theme")
        XCTAssertEqual(getColorsUseCaseReceivedArguments.intent, expectedIntent, "Wrong received getColorsUseCase.intent")

        XCTAssertEqual(getButtonTypeUseCaseMock.executeWithIntentAndVariantCallsCount, 1, "getButtonTypeUseCaseMock.executeWithIntentAndVariant should have been called once")
        let getButtonTypeUseCaseReceivedArguments = try XCTUnwrap(
            getButtonTypeUseCaseMock.executeWithIntentAndVariantReceivedArguments,
            "Couldn't unwrap getButtonTypeUseCaseReceivedArguments"
        )
        XCTAssertEqual(getButtonTypeUseCaseReceivedArguments.intent, expectedIntent, "Wrong received getButtonTypeUseCase.intent")
        XCTAssertEqual(getButtonTypeUseCaseReceivedArguments.variant, expectedVariant, "Wrong received getButtonTypeUseCase.variant")

        XCTAssertEqual(getBorderUseCaseMock.executeWithThemeCallsCount, 1, "getBorderUseCaseMock.executeWithTheme should have been called once")
        let getBorderUseCaseReceivedArguments = try XCTUnwrap(
            getBorderUseCaseMock.executeWithThemeReceivedTheme,
            "Couldn't unwrap getBorderUseCaseReceivedArguments"
        )
        let getBorderUseCaseReceivedArgumentsTheme = try XCTUnwrap(getBorderUseCaseReceivedArguments as? ThemeGeneratedMock, "Couldn't unwrap getBorderUseCaseReceivedArgumentsTheme")
        XCTAssertIdentical(getBorderUseCaseReceivedArgumentsTheme, self.theme as? ThemeGeneratedMock, "Wrong received getBorderUseCase.theme")

        // THEN - Publishers
        XCTAssertEqual(self.publishers.colors.sinkCount, 1, "$colors should have been called once")
        XCTAssertEqual(self.publishers.border.sinkCount, 1, "$border should have been called once")
        XCTAssertEqual(self.publishers.textFont.sinkCount, 1, "$textFont should have been called once")
        XCTAssertEqual(self.publishers.buttonIntent.sinkCount, 1, "$buttonIntent should have been called once")
        XCTAssertEqual(self.publishers.buttonVariant.sinkCount, 1, "$buttonVariant should have been called once")
    }

    func test_didSet_theme() throws {
        // GIVEN
        let expectedTintColor = ColorTokenGeneratedMock.red()
        let expectedBackgroundColor = ColorTokenGeneratedMock.blue()
        let expectedBorderColor = ColorTokenGeneratedMock.green()
        let getColorsUseCaseMock = SnackbarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = .init(
            tintColorToken: expectedTintColor,
            backgroundColorToken: expectedBackgroundColor,
            borderColorToken: expectedBorderColor
        )

        let expectedButtonIntent = ButtonIntent.accent
        let expectedButtonVariant = ButtonVariant.outlined
        let getButtonTypeUseCaseMock = SnackbarGetButtonTypeUseCasableDeprecatedGeneratedMock()
        getButtonTypeUseCaseMock.executeWithIntentAndVariantReturnValue = .init(
            intent: expectedButtonIntent,
            variant: expectedButtonVariant
        )

        let expectedBorderWidth = self.theme.border.width.small
        let expectedBorderRadius = self.theme.border.radius.large
        let getBorderUseCaseMock = SnackbarGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = .init(
            width: expectedBorderWidth,
            radius: expectedBorderRadius
        )

        let expectedIntent = SnackbarIntent.support
        let expectedVariant = SnackbarVariant.tinted

        let newTheme = ThemeGeneratedMock.mocked()

        let viewModel = SnackbarViewModelDeprecated(
            theme: self.theme,
            variant: expectedVariant,
            intent: expectedIntent,
            getColorsUseCase: getColorsUseCaseMock,
            getButtonTypeUseCase: getButtonTypeUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock
        )
        self.setupPublishers(viewModel: viewModel)

        self.publishers.reset()
        getColorsUseCaseMock.reset()
        getButtonTypeUseCaseMock.reset()
        getBorderUseCaseMock.reset()

        // WHEN
        viewModel.theme = newTheme

        // THEN - Values
        XCTAssertEqual(viewModel.intent, expectedIntent, "Wrong intent")
        XCTAssertEqual(viewModel.variant, expectedVariant, "Wrong variant")

        XCTAssertTrue(viewModel.colors.tintColorToken.equals(expectedTintColor), "Wrong tint color")
        XCTAssertTrue(viewModel.colors.backgroundColorToken.equals(expectedBackgroundColor), "Wrong background color")
        XCTAssertTrue(viewModel.colors.borderColorToken.equals(expectedBorderColor), "Wrong border color")

        let expectedFont = try XCTUnwrap(newTheme.typography.body2 as? TypographyFontTokenGeneratedMock, "Couldn't unwrap expectedFont")
        XCTAssertIdentical(viewModel.textFont as? TypographyFontTokenGeneratedMock, expectedFont, "Wrong textFont")

        XCTAssertEqual(viewModel.buttonIntent, expectedButtonIntent, "Wrong button intent")
        XCTAssertEqual(viewModel.buttonVariant, expectedButtonVariant, "Wrong button variant")

        XCTAssertEqual(viewModel.border.width, expectedBorderWidth, "Wrong border width")
        XCTAssertEqual(viewModel.border.radius, expectedBorderRadius, "Wrong border radius")

        // THEN - UseCases
        XCTAssertEqual(getColorsUseCaseMock.executeWithThemeAndIntentCallsCount, 1, "getColorsUseCaseMock.executeWithThemeAndIntent should have been called once")
        let getColorsUseCaseReceivedArguments = try XCTUnwrap(
            getColorsUseCaseMock.executeWithThemeAndIntentReceivedArguments,
            "Couldn't unwrap getColorsUseCaseReceivedArguments"
        )
        let getColorsUseCaseReceivedArgumentsTheme = try XCTUnwrap(getColorsUseCaseReceivedArguments.theme as? ThemeGeneratedMock, "Couldn't unwrap getColorsUseCaseReceivedArgumentsTheme")
        XCTAssertIdentical(getColorsUseCaseReceivedArgumentsTheme, newTheme as? ThemeGeneratedMock, "Wrong received getColorsUseCase.theme")
        XCTAssertEqual(getColorsUseCaseReceivedArguments.intent, expectedIntent, "Wrong received getColorsUseCase.intent")

        XCTAssertEqual(getButtonTypeUseCaseMock.executeWithIntentAndVariantCallsCount, 1, "getButtonTypeUseCaseMock.executeWithIntentAndVariant should have been called once")
        let getButtonTypeUseCaseReceivedArguments = try XCTUnwrap(
            getButtonTypeUseCaseMock.executeWithIntentAndVariantReceivedArguments,
            "Couldn't unwrap getButtonTypeUseCaseReceivedArguments"
        )
        XCTAssertEqual(getButtonTypeUseCaseReceivedArguments.intent, expectedIntent, "Wrong received getButtonTypeUseCase.intent")
        XCTAssertEqual(getButtonTypeUseCaseReceivedArguments.variant, expectedVariant, "Wrong received getButtonTypeUseCase.variant")

        XCTAssertEqual(getBorderUseCaseMock.executeWithThemeCallsCount, 1, "getBorderUseCaseMock.executeWithTheme should have been called once")
        let getBorderUseCaseReceivedArguments = try XCTUnwrap(
            getBorderUseCaseMock.executeWithThemeReceivedTheme,
            "Couldn't unwrap getBorderUseCaseReceivedArguments"
        )
        let getBorderUseCaseReceivedArgumentsTheme = try XCTUnwrap(getBorderUseCaseReceivedArguments as? ThemeGeneratedMock, "Couldn't unwrap getBorderUseCaseReceivedArgumentsTheme")
        XCTAssertIdentical(getBorderUseCaseReceivedArgumentsTheme, newTheme as? ThemeGeneratedMock, "Wrong received getBorderUseCase.theme")

        // THEN - Publishers
        XCTAssertEqual(self.publishers.colors.sinkCount, 1, "$colors should have been called once")
        XCTAssertEqual(self.publishers.border.sinkCount, 1, "$border should have been called once")
        XCTAssertEqual(self.publishers.textFont.sinkCount, 1, "$textFont should have been called once")
        XCTAssertEqual(self.publishers.buttonIntent.sinkCount, 1, "$buttonIntent should have been called once")
        XCTAssertEqual(self.publishers.buttonVariant.sinkCount, 1, "$buttonVariant should have been called once")
    }

    func test_didSet_intent() throws {
        // GIVEN
        let expectedTintColor = ColorTokenGeneratedMock.red()
        let expectedBackgroundColor = ColorTokenGeneratedMock.blue()
        let expectedBorderColor = ColorTokenGeneratedMock.green()
        let getColorsUseCaseMock = SnackbarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = .init(
            tintColorToken: expectedTintColor,
            backgroundColorToken: expectedBackgroundColor,
            borderColorToken: expectedBorderColor
        )

        let expectedButtonIntent = ButtonIntent.accent
        let expectedButtonVariant = ButtonVariant.outlined
        let getButtonTypeUseCaseMock = SnackbarGetButtonTypeUseCasableDeprecatedGeneratedMock()
        getButtonTypeUseCaseMock.executeWithIntentAndVariantReturnValue = .init(
            intent: expectedButtonIntent,
            variant: expectedButtonVariant
        )

        let getBorderUseCaseMock = SnackbarGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = .init(
            width: self.theme.border.width.small,
            radius: self.theme.border.radius.large
        )

        let oldIntent = SnackbarIntent.support
        let expectedVariant = SnackbarVariant.tinted

        let viewModel = SnackbarViewModelDeprecated(
            theme: self.theme,
            variant: expectedVariant,
            intent: oldIntent,
            getColorsUseCase: getColorsUseCaseMock,
            getButtonTypeUseCase: getButtonTypeUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock
        )
        self.setupPublishers(viewModel: viewModel)

        self.publishers.reset()
        getColorsUseCaseMock.reset()
        getButtonTypeUseCaseMock.reset()
        getBorderUseCaseMock.reset()

        let newIntent = SnackbarIntent.error

        // WHEN
        viewModel.intent = newIntent

        // THEN - Values
        XCTAssertEqual(viewModel.intent, newIntent, "Wrong intent")
        XCTAssertEqual(viewModel.variant, expectedVariant, "Wrong variant")

        XCTAssertTrue(viewModel.colors.tintColorToken.equals(expectedTintColor), "Wrong tint color")
        XCTAssertTrue(viewModel.colors.backgroundColorToken.equals(expectedBackgroundColor), "Wrong background color")
        XCTAssertTrue(viewModel.colors.borderColorToken.equals(expectedBorderColor), "Wrong border color")

        XCTAssertEqual(viewModel.buttonIntent, expectedButtonIntent, "Wrong button intent")
        XCTAssertEqual(viewModel.buttonVariant, expectedButtonVariant, "Wrong button variant")

        // THEN - UseCases
        XCTAssertEqual(getColorsUseCaseMock.executeWithThemeAndIntentCallsCount, 1, "getColorsUseCaseMock.executeWithThemeAndIntent should have been called once")
        let getColorsUseCaseReceivedArguments = try XCTUnwrap(
            getColorsUseCaseMock.executeWithThemeAndIntentReceivedArguments,
            "Couldn't unwrap getColorsUseCaseReceivedArguments"
        )
        let getColorsUseCaseReceivedArgumentsTheme = try XCTUnwrap(getColorsUseCaseReceivedArguments.theme as? ThemeGeneratedMock, "Couldn't unwrap getColorsUseCaseReceivedArgumentsTheme")
        XCTAssertIdentical(getColorsUseCaseReceivedArgumentsTheme, self.theme as? ThemeGeneratedMock, "Wrong received getColorsUseCase.theme")
        XCTAssertEqual(getColorsUseCaseReceivedArguments.intent, newIntent, "Wrong received getColorsUseCase.intent")

        XCTAssertEqual(getButtonTypeUseCaseMock.executeWithIntentAndVariantCallsCount, 1, "getButtonTypeUseCaseMock.executeWithIntentAndVariant should have been called once")
        let getButtonTypeUseCaseReceivedArguments = try XCTUnwrap(
            getButtonTypeUseCaseMock.executeWithIntentAndVariantReceivedArguments,
            "Couldn't unwrap getButtonTypeUseCaseReceivedArguments"
        )
        XCTAssertEqual(getButtonTypeUseCaseReceivedArguments.intent, newIntent, "Wrong received getButtonTypeUseCase.intent")
        XCTAssertEqual(getButtonTypeUseCaseReceivedArguments.variant, expectedVariant, "Wrong received getButtonTypeUseCase.variant")

        XCTAssertEqual(getBorderUseCaseMock.executeWithThemeCallsCount, 1, "getBorderUseCaseMock.executeWithTheme should have been called once")

        // THEN - Publishers
        XCTAssertEqual(self.publishers.colors.sinkCount, 1, "$colors should have been called once")
        XCTAssertEqual(self.publishers.border.sinkCount, 1, "$border should have been called once")
        XCTAssertFalse(self.publishers.textFont.sinkCalled, "$textFont should not have been called")
        XCTAssertEqual(self.publishers.buttonIntent.sinkCount, 1, "$buttonIntent should have been called once")
        XCTAssertEqual(self.publishers.buttonVariant.sinkCount, 1, "$buttonVariant should have been called once")
    }

    func test_didSet_intent_equal() throws {
        // GIVEN
        let expectedTintColor = ColorTokenGeneratedMock.red()
        let expectedBackgroundColor = ColorTokenGeneratedMock.blue()
        let expectedBorderColor = ColorTokenGeneratedMock.green()
        let getColorsUseCaseMock = SnackbarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = .init(
            tintColorToken: expectedTintColor,
            backgroundColorToken: expectedBackgroundColor,
            borderColorToken: expectedBorderColor
        )

        let expectedButtonIntent = ButtonIntent.accent
        let expectedButtonVariant = ButtonVariant.outlined
        let getButtonTypeUseCaseMock = SnackbarGetButtonTypeUseCasableDeprecatedGeneratedMock()
        getButtonTypeUseCaseMock.executeWithIntentAndVariantReturnValue = .init(
            intent: expectedButtonIntent,
            variant: expectedButtonVariant
        )

        let getBorderUseCaseMock = SnackbarGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = .init(
            width: self.theme.border.width.small,
            radius: self.theme.border.radius.large
        )

        let intent = SnackbarIntent.support

        let viewModel = SnackbarViewModelDeprecated(
            theme: self.theme,
            variant: .tinted,
            intent: intent,
            getColorsUseCase: getColorsUseCaseMock,
            getButtonTypeUseCase: getButtonTypeUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock
        )
        self.setupPublishers(viewModel: viewModel)

        self.publishers.reset()
        getColorsUseCaseMock.reset()
        getButtonTypeUseCaseMock.reset()
        getBorderUseCaseMock.reset()

        // WHEN
        viewModel.intent = intent

        // THEN - UseCases
        XCTAssertFalse(getColorsUseCaseMock.executeWithThemeAndIntentCalled, "getColorsUseCaseMock.executeWithThemeAndIntent should not have been called")
        XCTAssertFalse(getButtonTypeUseCaseMock.executeWithIntentAndVariantCalled, "getButtonTypeUseCaseMock.executeWithIntentAndVariant should not have been called")
        XCTAssertFalse(getBorderUseCaseMock.executeWithThemeCalled, "getBorderUseCaseMock.executeWithTheme should not have been called")

        // THEN - Publishers
        XCTAssertFalse(self.publishers.colors.sinkCalled, "$colors should not have been called")
        XCTAssertFalse(self.publishers.border.sinkCalled, "$border should not have been called")
        XCTAssertFalse(self.publishers.textFont.sinkCalled, "$textFont should not have been called")
        XCTAssertFalse(self.publishers.buttonIntent.sinkCalled, "$buttonIntent should not have been called")
        XCTAssertFalse(self.publishers.buttonVariant.sinkCalled, "$buttonVariant should not have been called")
    }

    func test_didSet_variant() throws {
        // GIVEN
        let expectedTintColor = ColorTokenGeneratedMock.red()
        let expectedBackgroundColor = ColorTokenGeneratedMock.blue()
        let expectedBorderColor = ColorTokenGeneratedMock.green()
        let getColorsUseCaseMock = SnackbarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = .init(
            tintColorToken: expectedTintColor,
            backgroundColorToken: expectedBackgroundColor,
            borderColorToken: expectedBorderColor
        )

        let expectedButtonIntent = ButtonIntent.accent
        let expectedButtonVariant = ButtonVariant.outlined
        let getButtonTypeUseCaseMock = SnackbarGetButtonTypeUseCasableDeprecatedGeneratedMock()
        getButtonTypeUseCaseMock.executeWithIntentAndVariantReturnValue = .init(
            intent: expectedButtonIntent,
            variant: expectedButtonVariant
        )

        let getBorderUseCaseMock = SnackbarGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = .init(
            width: self.theme.border.width.small,
            radius: self.theme.border.radius.large
        )

        let expectedIntent = SnackbarIntent.support
        let oldVariant = SnackbarVariant.tinted

        let viewModel = SnackbarViewModelDeprecated(
            theme: self.theme,
            variant: oldVariant,
            intent: expectedIntent,
            getColorsUseCase: getColorsUseCaseMock,
            getButtonTypeUseCase: getButtonTypeUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock
        )
        self.setupPublishers(viewModel: viewModel)

        self.publishers.reset()
        getColorsUseCaseMock.reset()
        getButtonTypeUseCaseMock.reset()
        getBorderUseCaseMock.reset()

        let newVariant = SnackbarVariant.filled

        // WHEN
        viewModel.variant = newVariant

        // THEN - Values
        XCTAssertEqual(viewModel.intent, expectedIntent, "Wrong intent")
        XCTAssertEqual(viewModel.variant, newVariant, "Wrong variant")

        XCTAssertTrue(viewModel.colors.tintColorToken.equals(expectedTintColor), "Wrong tint color")
        XCTAssertTrue(viewModel.colors.backgroundColorToken.equals(expectedBackgroundColor), "Wrong background color")
        XCTAssertTrue(viewModel.colors.borderColorToken.equals(expectedBorderColor), "Wrong border color")

        XCTAssertEqual(viewModel.buttonIntent, expectedButtonIntent, "Wrong button intent")
        XCTAssertEqual(viewModel.buttonVariant, expectedButtonVariant, "Wrong button variant")

        // THEN - UseCases
        XCTAssertEqual(getColorsUseCaseMock.executeWithThemeAndIntentCallsCount, 1, "getColorsUseCaseMock.executeWithThemeAndIntent should have been called once")
        let getColorsUseCaseReceivedArguments = try XCTUnwrap(
            getColorsUseCaseMock.executeWithThemeAndIntentReceivedArguments,
            "Couldn't unwrap getColorsUseCaseReceivedArguments"
        )
        let getColorsUseCaseReceivedArgumentsTheme = try XCTUnwrap(getColorsUseCaseReceivedArguments.theme as? ThemeGeneratedMock, "Couldn't unwrap getColorsUseCaseReceivedArgumentsTheme")
        XCTAssertIdentical(getColorsUseCaseReceivedArgumentsTheme, self.theme as? ThemeGeneratedMock, "Wrong received getColorsUseCase.theme")
        XCTAssertEqual(getColorsUseCaseReceivedArguments.intent, expectedIntent, "Wrong received getColorsUseCase.intent")

        XCTAssertEqual(getButtonTypeUseCaseMock.executeWithIntentAndVariantCallsCount, 1, "getButtonTypeUseCaseMock.executeWithIntentAndVariant should have been called once")
        let getButtonTypeUseCaseReceivedArguments = try XCTUnwrap(
            getButtonTypeUseCaseMock.executeWithIntentAndVariantReceivedArguments,
            "Couldn't unwrap getButtonTypeUseCaseReceivedArguments"
        )
        XCTAssertEqual(getButtonTypeUseCaseReceivedArguments.intent, expectedIntent, "Wrong received getButtonTypeUseCase.intent")
        XCTAssertEqual(getButtonTypeUseCaseReceivedArguments.variant, newVariant, "Wrong received getButtonTypeUseCase.variant")

        XCTAssertEqual(getBorderUseCaseMock.executeWithThemeCallsCount, 1, "getBorderUseCaseMock.executeWithTheme should have been called once")

        // THEN - Publishers
        XCTAssertEqual(self.publishers.colors.sinkCount, 1, "$colors should have been called once")
        XCTAssertEqual(self.publishers.border.sinkCount, 1, "$border should have been called once")
        XCTAssertFalse(self.publishers.textFont.sinkCalled, "$textFont should not have been called")
        XCTAssertEqual(self.publishers.buttonIntent.sinkCount, 1, "$buttonIntent should have been called once")
        XCTAssertEqual(self.publishers.buttonVariant.sinkCount, 1, "$buttonVariant should have been called once")
    }

    func test_didSet_variant_equal() throws {
        // GIVEN
        let expectedTintColor = ColorTokenGeneratedMock.red()
        let expectedBackgroundColor = ColorTokenGeneratedMock.blue()
        let expectedBorderColor = ColorTokenGeneratedMock.green()
        let getColorsUseCaseMock = SnackbarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = .init(
            tintColorToken: expectedTintColor,
            backgroundColorToken: expectedBackgroundColor,
            borderColorToken: expectedBorderColor
        )

        let expectedButtonIntent = ButtonIntent.accent
        let expectedButtonVariant = ButtonVariant.outlined
        let getButtonTypeUseCaseMock = SnackbarGetButtonTypeUseCasableDeprecatedGeneratedMock()
        getButtonTypeUseCaseMock.executeWithIntentAndVariantReturnValue = .init(
            intent: expectedButtonIntent,
            variant: expectedButtonVariant
        )

        let getBorderUseCaseMock = SnackbarGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = .init(
            width: self.theme.border.width.small,
            radius: self.theme.border.radius.large
        )

        let variant = SnackbarVariant.tinted

        let viewModel = SnackbarViewModelDeprecated(
            theme: self.theme,
            variant: variant,
            intent: .accent,
            getColorsUseCase: getColorsUseCaseMock,
            getButtonTypeUseCase: getButtonTypeUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock
        )
        self.setupPublishers(viewModel: viewModel)

        self.publishers.reset()
        getColorsUseCaseMock.reset()
        getButtonTypeUseCaseMock.reset()
        getBorderUseCaseMock.reset()

        // WHEN
        viewModel.variant = variant

        // THEN - UseCases
        XCTAssertFalse(getColorsUseCaseMock.executeWithThemeAndIntentCalled, "getColorsUseCaseMock.executeWithThemeAndIntent should not have been called")
        XCTAssertFalse(getButtonTypeUseCaseMock.executeWithIntentAndVariantCalled, "getButtonTypeUseCaseMock.executeWithIntentAndVariant should not have been called")
        XCTAssertFalse(getBorderUseCaseMock.executeWithThemeCalled, "getBorderUseCaseMock.executeWithTheme should not have been called")

        // THEN - Publishers
        XCTAssertFalse(self.publishers.colors.sinkCalled, "$colors should not have been called")
        XCTAssertFalse(self.publishers.border.sinkCalled, "$border should not have been called")
        XCTAssertFalse(self.publishers.textFont.sinkCalled, "$textFont should not have been called")
        XCTAssertFalse(self.publishers.buttonIntent.sinkCalled, "$buttonIntent should not have been called")
        XCTAssertFalse(self.publishers.buttonVariant.sinkCalled, "$buttonVariant should not have been called")
    }
}

final class SnackbarPublishers {
    var cancellables = Set<AnyCancellable>()

    var colors: PublisherMock<Published<SnackbarColors>.Publisher>
    var border: PublisherMock<Published<SnackbarBorder>.Publisher>
    var textFont: PublisherMock<Published<any TypographyFontToken>.Publisher>
    var buttonIntent: PublisherMock<Published<ButtonIntent>.Publisher>
    var buttonVariant: PublisherMock<Published<ButtonVariant>.Publisher>

    init(
        cancellables: Set<AnyCancellable> = Set<AnyCancellable>(),
        colors: PublisherMock<Published<SnackbarColors>.Publisher>,
        border: PublisherMock<Published<SnackbarBorder>.Publisher>,
        textFont: PublisherMock<Published<any TypographyFontToken>.Publisher>,
        buttonIntent: PublisherMock<Published<ButtonIntent>.Publisher>,
        buttonVariant: PublisherMock<Published<ButtonVariant>.Publisher>
    ) {
        self.cancellables = cancellables
        self.colors = colors
        self.border = border
        self.textFont = textFont
        self.buttonIntent = buttonIntent
        self.buttonVariant = buttonVariant
    }

    func load() {
        self.cancellables = Set<AnyCancellable>()

        self.colors.loadTesting(on: &self.cancellables)
        self.border.loadTesting(on: &self.cancellables)
        self.textFont.loadTesting(on: &self.cancellables)
        self.buttonIntent.loadTesting(on: &self.cancellables)
        self.buttonVariant.loadTesting(on: &self.cancellables)
    }

    func reset() {
        self.colors.reset()
        self.border.reset()
        self.textFont.reset()
        self.buttonIntent.reset()
        self.buttonVariant.reset()
    }
}
