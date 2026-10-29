//
//  TextInputUIViewModelTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import Combine
import UIKit
import SwiftUI
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

@MainActor
@Suite("TextInput UI ViewModel Tests")
final class TextInputUIViewModelTests {

    // MARK: - Properties

    var theme: ThemeGeneratedMock!
    var publishers: TextFieldPublishers!
    var getColorsUseCase: TextInputGetColorsUseCaseableGeneratedMock!
    var getBorderLayoutUseCase: TextInputGetBorderLayoutUseCaseableGeneratedMock!
    var getSpacingsUseCase: TextInputGetSpacingsUseCaseableGeneratedMock!
    private var viewModel: TextInputUIViewModel!

    let intent = TextInputIntent.success
    let borderStyle = TextInputBorderStyle.roundedRect

    var expectedColors: TextInputColors!
    var expectedBorderLayout: TextInputBorderLayout!
    var expectedSpacings: TextInputSpacings!

    // MARK: - Setup

    init() {
        self.theme = ThemeGeneratedMock.mocked()

        self.expectedColors = .mocked(
            text: .blue(),
            placeholder: .green(),
            border: .yellow(),
            background: .purple()
        )
        self.expectedBorderLayout = .mocked(radius: 1, width: 2)
        self.expectedSpacings = .mocked(horizontal: 1, content: 2)

        self.getColorsUseCase = .mocked(returnedColors: self.expectedColors)
        self.getBorderLayoutUseCase = .mocked(returnedBorderLayout: self.expectedBorderLayout)
        self.getSpacingsUseCase = .mocked(returnedSpacings: self.expectedSpacings)
        self.viewModel = .init(
            theme: self.theme,
            intent: self.intent,
            borderStyle: self.borderStyle,
            getColorsUseCase: self.getColorsUseCase,
            getBorderLayoutUseCase: self.getBorderLayoutUseCase,
            getSpacingsUseCase: self.getSpacingsUseCase
        )

        self.setupPublishers()
    }

    // MARK: - init
    @Test("Init")
    func initialization() throws {
        // GIVEN / WHEN - Inits from setUp()
        // THEN - Simple variables
        #expect(self.viewModel.theme as? ThemeGeneratedMock === self.theme, "Wrong theme")
        #expect(self.viewModel.intent == self.intent, "Wrong intent")
        #expect(self.viewModel.borderStyle == self.borderStyle, "Wrong borderStyle")
        #expect(self.viewModel.isEnabled, "Wrong isEnabled")
        #expect(!self.viewModel.isReadOnly, "Wrong isReadOnly")
        #expect(!self.viewModel.isFocused, "Wrong isFocused")
        #expect(self.viewModel.dim == self.theme.dims.none, "Wrong dim")
        #expect(self.viewModel.font as? TypographyFontTokenGeneratedMock === self.theme.typography.body1 as? TypographyFontTokenGeneratedMock, "Wrong font")

        // THEN - Colors
        #expect(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCallsCount == 1, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should have been called once")
        let getColorsReceivedArguments = try #require(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReceivedArguments, "Couldn't unwrap getColorsReceivedArguments")
        #expect(getColorsReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getColorsReceivedArguments.theme")
        #expect(getColorsReceivedArguments.intent == self.intent, "Wrong getColorsReceivedArguments.intent")
        #expect(!getColorsReceivedArguments.isFocused, "Wrong getColorsReceivedArguments.isFocused")
        #expect(getColorsReceivedArguments.isEnabled, "Wrong getColorsReceivedArguments.isEnabled")
        #expect(!getColorsReceivedArguments.isReadOnly, "Wrong getColorsReceivedArguments.isReadOnly")
        #expect(self.viewModel.textColor.equals(self.expectedColors.text), "Wrong textColor")
        #expect(self.viewModel.placeholderColor.equals(self.expectedColors.placeholder), "Wrong placeholderColor")
        #expect(self.viewModel.borderColor.equals(self.expectedColors.border), "Wrong borderColor")
        #expect(self.viewModel.backgroundColor.equals(self.expectedColors.background), "Wrong backgroundColor")

        // THEN - Border Layout
        #expect(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCallsCount == 1, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should have been called once")
        let getBorderLayoutReceivedArguments = try #require(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReceivedArguments, "Couldn't unwrap getBorderLayoutReceivedArguments")
        #expect(getBorderLayoutReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getBorderLayoutReceivedArguments.theme")
        #expect(getBorderLayoutReceivedArguments.borderStyle == .roundedRect, "Wrong getBorderLayoutReceivedArguments.borderStyle")
        #expect(!getBorderLayoutReceivedArguments.isFocused, "Wrong getBorderLayoutReceivedArguments.isFocused")
        #expect(self.viewModel.borderWidth == self.expectedBorderLayout.width, "Wrong borderWidth")
        #expect(self.viewModel.borderRadius == self.expectedBorderLayout.radius, "Wrong borderRadius")

        // THEN - Spacings
        #expect(self.getSpacingsUseCase.executeWithThemeAndBorderStyleCallsCount == 1, "getSpacingsUseCase.executeWithThemeAndBorderStyle should have been called once")
        let getSpacingsUseCaseReceivedArguments = try #require(self.getSpacingsUseCase.executeWithThemeAndBorderStyleReceivedArguments, "Couldn't unwrap getSpacingsUseCaseReceivedArguments")
        #expect(getSpacingsUseCaseReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getSpacingsUseCaseReceivedArguments.theme")
        #expect(getSpacingsUseCaseReceivedArguments.borderStyle == .roundedRect, "Wrong getSpacingsUseCaseReceivedArguments.borderStyle")
        #expect(self.viewModel.leftSpacing == self.expectedSpacings.horizontal, "Wrong horizontalSpacing")
        #expect(self.viewModel.contentSpacing == self.expectedSpacings.content, "Wrong contentSpacing")
        #expect(self.viewModel.rightSpacing == self.expectedSpacings.horizontal, "Wrong horizontalSpacing")

        // THEN - Publishers
        #expect(self.publishers.textColor.sinkCount == 1, "$textColor should have been called once")
        #expect(self.publishers.borderColor.sinkCount == 1, "$borderColorIndicatorColor should have been called once")
        #expect(self.publishers.backgroundColor.sinkCount == 1, "$backgroundColor should have been called once")
        #expect(self.publishers.placeholderColor.sinkCount == 1, "$placeholderColor should have been called once")

        #expect(self.publishers.borderWidth.sinkCount == 1, "$borderWidth should have been called once")
        #expect(self.publishers.borderRadius.sinkCount == 1, "$borderRadius should have been called once")

        #expect(self.publishers.leftSpacing.sinkCount == 1, "$leftSpacing should have been called once")
        #expect(self.publishers.contentSpacing.sinkCount == 1, "$contentSpacing should have been called once")
        #expect(self.publishers.rightSpacing.sinkCount == 1, "$rightSpacing should have been called once")

        #expect(self.publishers.dim.sinkCount == 1, "$dim should have been called once")
        #expect(self.publishers.font.sinkCount == 1, "$font should have been called once")
    }

    // MARK: any Theme
    @Test("Theme did set")
    func themeDidSet() throws {
        // GIVEN - Inits from setUp()
        let newTheme = ThemeGeneratedMock()
        newTheme.typography = TypographyGeneratedMock.mocked()
        newTheme.dims = DimsGeneratedMock.mocked()

        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        let newExpectedColors = TextInputColors.mocked(
            text: .red(),
            placeholder: .blue(),
            border: .green(),
            background: .red()
        )
        self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReturnValue = newExpectedColors

        let newExpectedBorderLayout = TextInputBorderLayout.mocked(radius: 20.0, width: 100.0)
        self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReturnValue = newExpectedBorderLayout

        let newExpectedSpacings = TextInputSpacings.mocked(horizontal: 10, content: 20)
        self.getSpacingsUseCase.executeWithThemeAndBorderStyleReturnValue = newExpectedSpacings

        // WHEN
        self.viewModel.theme = newTheme

        // THEN - Theme
        #expect(self.viewModel.theme as? ThemeGeneratedMock === newTheme, "Wrong theme")

        // THEN - Colors
        #expect(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCallsCount == 1, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should have been called once")
        let getColorsReceivedArguments = try #require(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReceivedArguments, "Couldn't unwrap getColorsReceivedArguments")
        #expect(getColorsReceivedArguments.theme as? ThemeGeneratedMock === newTheme, "Wrong getColorsReceivedArguments.theme")
        #expect(self.viewModel.textColor.equals(newExpectedColors.text), "Wrong textColor")
        #expect(self.viewModel.placeholderColor.equals(newExpectedColors.placeholder), "Wrong placeholderColor")
        #expect(self.viewModel.borderColor.equals(newExpectedColors.border), "Wrong borderColor")
        #expect(self.viewModel.backgroundColor.equals(newExpectedColors.background), "Wrong backgroundColor")

        // THEN - Border Layout
        #expect(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCallsCount == 1, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should have been called once")
        let getBorderLayoutReceivedArguments = try #require(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReceivedArguments, "Couldn't unwrap getBorderLayoutReceivedArguments")
        #expect(getBorderLayoutReceivedArguments.theme as? ThemeGeneratedMock === newTheme, "Wrong getBorderLayoutReceivedArguments.theme")
        #expect(self.viewModel.borderWidth == newExpectedBorderLayout.width, "Wrong borderWidth")
        #expect(self.viewModel.borderRadius == newExpectedBorderLayout.radius, "Wrong borderRadius")

        // THEN - Spacings
        #expect(self.getSpacingsUseCase.executeWithThemeAndBorderStyleCallsCount == 1, "getSpacingsUseCase.executeWithThemeAndBorderStyle should have been called once")
        let getSpacingsUseCaseReceivedArguments = try #require(self.getSpacingsUseCase.executeWithThemeAndBorderStyleReceivedArguments, "Couldn't unwrap getSpacingsUseCaseReceivedArguments")
        #expect(getSpacingsUseCaseReceivedArguments.theme as? ThemeGeneratedMock === newTheme, "Wrong getSpacingsUseCaseReceivedArguments.theme")
        #expect(self.viewModel.leftSpacing == newExpectedSpacings.horizontal, "Wrong horizontalSpacing")
        #expect(self.viewModel.contentSpacing == newExpectedSpacings.content, "Wrong contentSpacing")
        #expect(self.viewModel.rightSpacing == newExpectedSpacings.horizontal, "Wrong horizontalSpacing")

        // THEN - Publishers
        #expect(self.publishers.textColor.sinkCount == 1, "$textColor should have been called once")
        #expect(self.publishers.borderColor.sinkCount == 1, "$borderColorIndicatorColor should have been called once")
        #expect(self.publishers.backgroundColor.sinkCount == 1, "$backgroundColor should have been called once")
        #expect(self.publishers.placeholderColor.sinkCount == 1, "$placeholderColor should have been called once")

        #expect(self.publishers.borderWidth.sinkCount == 1, "$borderWidth should have been called once")
        #expect(self.publishers.borderRadius.sinkCount == 1, "$borderRadius should have been called once")

        #expect(self.publishers.leftSpacing.sinkCount == 1, "$leftSpacing should have been called once")
        #expect(self.publishers.contentSpacing.sinkCount == 1, "$contentSpacing should have been called once")
        #expect(self.publishers.rightSpacing.sinkCount == 1, "$rightSpacing should have been called once")

        #expect(self.publishers.dim.sinkCount == 1, "$dim should have been called once")
        #expect(self.publishers.font.sinkCount == 1, "$font should have been called once")
    }

    // MARK: - Intent
    @Test("Intent did set equal")
    func intentDidSetEqual() throws {
        // GIVEN - Inits from setUp()
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // WHEN
        self.viewModel.intent = self.intent

        // THEN - Colors
        #expect(!self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCalled, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should not have been called")

        // THEN - Border Layout
        #expect(!self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should not have been called")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(!self.publishers.textColor.sinkCalled, "$textColor should not have been called")
        #expect(!self.publishers.borderColor.sinkCalled, "$borderColorIndicatorColor should not have been called")
        #expect(!self.publishers.backgroundColor.sinkCalled, "$backgroundColor should not have been called")
        #expect(!self.publishers.placeholderColor.sinkCalled, "$placeholderColor should not have been called")

        #expect(!self.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should not have been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should not have been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should not have been called")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    @Test("Intent did set not equal")
    func intentDidSetNotEqual() throws {
        // GIVEN - Inits from setUp()
        self.viewModel.intent = .alert
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        let newExpectedColors = TextInputColors.mocked(
            text: .red(),
            placeholder: .blue(),
            border: .green(),
            background: .red()
        )
        self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReturnValue = newExpectedColors

        // WHEN
        self.viewModel.intent = .neutral

        // THEN - Colors
        #expect(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCallsCount == 1, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should have been called once")
        let getColorsReceivedArguments = try #require(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReceivedArguments, "Couldn't unwrap getColorsReceivedArguments")
        #expect(getColorsReceivedArguments.intent == .neutral, "Wrong getColorsReceivedArguments.intent")
        #expect(self.viewModel.textColor.equals(newExpectedColors.text), "Wrong textColor")
        #expect(self.viewModel.placeholderColor.equals(newExpectedColors.placeholder), "Wrong placeholderColor")
        #expect(self.viewModel.borderColor.equals(newExpectedColors.border), "Wrong borderColor")
        #expect(self.viewModel.backgroundColor.equals(newExpectedColors.background), "Wrong backgroundColor")

        // THEN - Border Layout
        #expect(!self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should not have been called")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(self.publishers.textColor.sinkCount == 1, "$textColor should have been called once")
        #expect(self.publishers.borderColor.sinkCount == 1, "$borderColorIndicatorColor should have been called once")
        #expect(self.publishers.backgroundColor.sinkCount == 1, "$backgroundColor should have been called once")
        #expect(self.publishers.placeholderColor.sinkCount == 1, "$placeholderColor should have been called once")

        #expect(!self.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should not have been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should not have been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should not have been called")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    // MARK: - Border Style
    @Test("Border style did set equal")
    func borderStyleDidSetEqual() throws {
        // GIVEN - Inits from setUp()
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // WHEN
        self.viewModel.borderStyle = self.borderStyle

        // THEN - Colors
        #expect(!self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCalled, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should not have been called")

        // THEN - Border Layout
        #expect(!self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should not have been called")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(!self.publishers.textColor.sinkCalled, "$textColor should not have been called")
        #expect(!self.publishers.borderColor.sinkCalled, "$borderColorIndicatorColor should not have been called")
        #expect(!self.publishers.backgroundColor.sinkCalled, "$backgroundColor should not have been called")
        #expect(!self.publishers.placeholderColor.sinkCalled, "$placeholderColor should not have been called")

        #expect(!self.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should not have been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should not have been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should not have been called")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    @Test("Border style did set not equal")
    func borderStyleDidSetNotEqual() throws {
        // GIVEN - Inits from setUp()
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        let newExpectedBorderLayout = TextInputBorderLayout.mocked(radius: 20.0, width: 100.0)
        self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReturnValue = newExpectedBorderLayout

        let newExpectedSpacings = TextInputSpacings.mocked(horizontal: 10, content: 20)
        self.getSpacingsUseCase.executeWithThemeAndBorderStyleReturnValue = newExpectedSpacings

        // WHEN
        self.viewModel.borderStyle = .none

        // THEN - Colors
        #expect(!self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCalled, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should not have been called")

        // THEN - Border Layout
        #expect(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCallsCount == 1, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should have been called once")
        let getBorderLayoutReceivedArguments = try #require(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReceivedArguments, "Couldn't unwrap getBorderLayoutReceivedArguments")
        #expect(getBorderLayoutReceivedArguments.borderStyle == .none, "Wrong getBorderLayoutReceivedArguments.borderStyle")
        #expect(self.viewModel.borderWidth == newExpectedBorderLayout.width, "Wrong borderWidth")
        #expect(self.viewModel.borderRadius == newExpectedBorderLayout.radius, "Wrong borderRadius")

        // THEN - Spacings
        #expect(self.getSpacingsUseCase.executeWithThemeAndBorderStyleCallsCount == 1, "getSpacingsUseCase.executeWithThemeAndBorderStyle should have been called once")
        let getSpacingsUseCaseReceivedArguments = try #require(self.getSpacingsUseCase.executeWithThemeAndBorderStyleReceivedArguments, "Couldn't unwrap getSpacingsUseCaseReceivedArguments")
        #expect(getSpacingsUseCaseReceivedArguments.borderStyle == .none, "Wrong getSpacingsUseCaseReceivedArguments.borderStyle")
        #expect(self.viewModel.leftSpacing == newExpectedSpacings.horizontal, "Wrong horizontalSpacing")
        #expect(self.viewModel.contentSpacing == newExpectedSpacings.content, "Wrong contentSpacing")
        #expect(self.viewModel.rightSpacing == newExpectedSpacings.horizontal, "Wrong horizontalSpacing")

        // THEN - Publishers
        #expect(!self.publishers.textColor.sinkCalled, "$textColor should not have been called")
        #expect(!self.publishers.borderColor.sinkCalled, "$borderColorIndicatorColor should not have been called")
        #expect(!self.publishers.backgroundColor.sinkCalled, "$backgroundColor should not have been called")
        #expect(!self.publishers.placeholderColor.sinkCalled, "$placeholderColor should not have been called")

        #expect(self.publishers.borderWidth.sinkCount == 1, "$borderWidth should have been called once")
        #expect(self.publishers.borderRadius.sinkCount == 1, "$borderRadius should have been called once")

        #expect(self.publishers.leftSpacing.sinkCount == 1, "$leftSpacing should have been called once")
        #expect(self.publishers.contentSpacing.sinkCount == 1, "$contentSpacing should have been called once")
        #expect(self.publishers.rightSpacing.sinkCount == 1, "$rightSpacing should have been called once")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    // MARK: - Is Focused
    @Test("Is focused did set equal")
    func isFocusedDidSetEqual() throws {
        // GIVEN - Inits from setUp()
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // WHEN
        self.viewModel.isFocused = false

        // THEN - Colors
        #expect(!self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCalled, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should not have been called")

        // THEN - Border Layout
        #expect(!self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should not have been called")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(!self.publishers.textColor.sinkCalled, "$textColor should not have been called")
        #expect(!self.publishers.borderColor.sinkCalled, "$borderColorIndicatorColor should not have been called")
        #expect(!self.publishers.backgroundColor.sinkCalled, "$backgroundColor should not have been called")
        #expect(!self.publishers.placeholderColor.sinkCalled, "$placeholderColor should not have been called")

        #expect(!self.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should not have been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should not have been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should not have been called")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    @Test("Is focused did set not equal")
    func isFocusedDidSetNotEqual() throws {
        // GIVEN - Inits from setUp()
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        let newExpectedColors = TextInputColors.mocked(
            text: .red(),
            placeholder: .blue(),
            border: .green(),
            background: .red()
        )
        self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReturnValue = newExpectedColors

        let newExpectedBorderLayout = TextInputBorderLayout.mocked(radius: 20.0, width: 100.0)
        self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReturnValue = newExpectedBorderLayout

        // WHEN
        self.viewModel.isFocused = true

        // THEN - Colors
        #expect(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCallsCount == 1, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should have been called once")
        let getColorsReceivedArguments = try #require(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReceivedArguments, "Couldn't unwrap getColorsReceivedArguments")
        #expect(getColorsReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getColorsReceivedArguments.theme")
        #expect(getColorsReceivedArguments.intent == self.intent, "Wrong getColorsReceivedArguments.intent")
        #expect(getColorsReceivedArguments.isFocused, "Wrong getColorsReceivedArguments.isFocused")
        #expect(self.viewModel.textColor.equals(newExpectedColors.text), "Wrong textColor")
        #expect(self.viewModel.placeholderColor.equals(newExpectedColors.placeholder), "Wrong placeholderColor")
        #expect(self.viewModel.borderColor.equals(newExpectedColors.border), "Wrong borderColor")
        #expect(self.viewModel.backgroundColor.equals(newExpectedColors.background), "Wrong backgroundColor")

        // THEN - Border Layout
        #expect(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCallsCount == 1, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should have been called once")
        let getBorderLayoutReceivedArguments = try #require(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReceivedArguments, "Couldn't unwrap getBorderLayoutReceivedArguments")
        #expect(getBorderLayoutReceivedArguments.isFocused, "Wrong getBorderLayoutReceivedArguments.isFocused")
        #expect(self.viewModel.borderWidth == newExpectedBorderLayout.width, "Wrong borderWidth")
        #expect(self.viewModel.borderRadius == newExpectedBorderLayout.radius, "Wrong borderRadius")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(self.publishers.textColor.sinkCount == 1, "$textColor should have been called once")
        #expect(self.publishers.borderColor.sinkCount == 1, "$borderColorIndicatorColor should have been called once")
        #expect(self.publishers.backgroundColor.sinkCount == 1, "$backgroundColor should have been called once")
        #expect(self.publishers.placeholderColor.sinkCount == 1, "$placeholderColor should have been called once")

        #expect(self.publishers.borderWidth.sinkCount == 1, "$borderWidth should have been called once")
        #expect(self.publishers.borderRadius.sinkCount == 1, "$borderRadius should have been called once")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should have not been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should have not been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should have not been called")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    // MARK: - Is Enabled
    @Test("Is enabled did set equal")
    func isEnabledDidSetEqual() throws {
        // GIVEN - Inits from setUp()
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // WHEN
        self.viewModel.isEnabled = true

        // THEN - Colors
        #expect(!self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCalled, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should not have been called")

        // THEN - Border Layout
        #expect(!self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should not have been called")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(!self.publishers.textColor.sinkCalled, "$textColor should not have been called")
        #expect(!self.publishers.borderColor.sinkCalled, "$borderColorIndicatorColor should not have been called")
        #expect(!self.publishers.backgroundColor.sinkCalled, "$backgroundColor should not have been called")
        #expect(!self.publishers.placeholderColor.sinkCalled, "$placeholderColor should not have been called")

        #expect(!self.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should not have been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should not have been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should not have been called")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    @Test("Is enabled did set not equal")
    func isEnabledDidSetNotEqual() throws {
        // GIVEN - Inits from setUp()
        self.viewModel.isEnabled = false
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        let newExpectedColors = TextInputColors.mocked(
            text: .red(),
            placeholder: .blue(),
            border: .green(),
            background: .red()
        )
        self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReturnValue = newExpectedColors

        // WHEN
        self.viewModel.isEnabled = true

        // THEN - Colors
        #expect(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCallsCount == 1, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should have been called once")
        let getColorsReceivedArguments = try #require(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReceivedArguments, "Couldn't unwrap getColorsReceivedArguments")
        #expect(getColorsReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getColorsReceivedArguments.theme")
        #expect(getColorsReceivedArguments.intent == self.intent, "Wrong getColorsReceivedArguments.intent")
        #expect(getColorsReceivedArguments.isEnabled, "Wrong getColorsReceivedArguments.isEnabledd")
        #expect(self.viewModel.textColor.equals(newExpectedColors.text), "Wrong textColor")
        #expect(self.viewModel.placeholderColor.equals(newExpectedColors.placeholder), "Wrong placeholderColor")
        #expect(self.viewModel.borderColor.equals(newExpectedColors.border), "Wrong borderColor")
        #expect(self.viewModel.backgroundColor.equals(newExpectedColors.background), "Wrong backgroundColor")

        // THEN - Border Layout
        #expect(!self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should not have been called")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(self.publishers.textColor.sinkCount == 1, "$textColor should have been called once")
        #expect(self.publishers.borderColor.sinkCount == 1, "$borderColorIndicatorColor should have been called once")
        #expect(self.publishers.backgroundColor.sinkCount == 1, "$backgroundColor should have been called once")
        #expect(self.publishers.placeholderColor.sinkCount == 1, "$placeholderColor should have been called once")

        #expect(!self.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should have not been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should have not been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should have not been called")

        #expect(self.publishers.dim.sinkCount == 1, "$dim should have been called once")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    // MARK: - Is  Read Only
    @Test("Is read only did set equal")
    func isReadOnlyDidSetEqual() throws {
        // GIVEN - Inits from setUp()
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // WHEN
        self.viewModel.isReadOnly = false

        // THEN - Colors
        #expect(!self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCalled, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should not have been called")

        // THEN - Border Layout
        #expect(!self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled should not have been called")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(!self.publishers.textColor.sinkCalled, "$textColor should not have been called")
        #expect(!self.publishers.borderColor.sinkCalled, "$borderColorIndicatorColor should not have been called")
        #expect(!self.publishers.backgroundColor.sinkCalled, "$backgroundColor should not have been called")
        #expect(!self.publishers.placeholderColor.sinkCalled, "$placeholderColor should not have been called")

        #expect(!self.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should not have been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should not have been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should not have been called")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    @Test("Is read only did set not equal")
    func isReadOnlyDidSetNotEqual() throws {
        // GIVEN - Inits from setUp()
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        let newExpectedColors = TextInputColors.mocked(
            text: .red(),
            placeholder: .blue(),
            border: .green(),
            background: .red()
        )
        self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReturnValue = newExpectedColors

        // WHEN
        self.viewModel.isReadOnly = true

        // THEN - Colors
        #expect(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCallsCount == 1, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnly should have been called once")
        let getColorsReceivedArguments = try #require(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReceivedArguments, "Couldn't unwrap getColorsReceivedArguments")
        #expect(getColorsReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getColorsReceivedArguments.theme")
        #expect(getColorsReceivedArguments.intent == self.intent, "Wrong getColorsReceivedArguments.intent")
        #expect(getColorsReceivedArguments.isReadOnly, "Wrong getColorsReceivedArguments.isReadOnly")
        #expect(self.viewModel.textColor.equals(newExpectedColors.text), "Wrong textColor")
        #expect(self.viewModel.placeholderColor.equals(newExpectedColors.placeholder), "Wrong placeholderColor")
        #expect(self.viewModel.borderColor.equals(newExpectedColors.border), "Wrong borderColor")
        #expect(self.viewModel.backgroundColor.equals(newExpectedColors.background), "Wrong backgroundColor")

        // THEN - Border Layout
        #expect(!self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCalled, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should not have been called")

        // THEN - Spacings
        #expect(!self.getSpacingsUseCase.executeWithThemeAndBorderStyleCalled, "getSpacingsUseCase.executeWithThemeAndBorderStyle should not have been called")

        // THEN - Publishers
        #expect(self.publishers.textColor.sinkCount == 1, "$textColor should have been called once")
        #expect(self.publishers.borderColor.sinkCount == 1, "$borderColorIndicatorColor should have been called once")
        #expect(self.publishers.backgroundColor.sinkCount == 1, "$backgroundColor should have been called once")
        #expect(self.publishers.placeholderColor.sinkCount == 1, "$placeholderColor should have been called once")

        #expect(!self.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")

        #expect(!self.publishers.leftSpacing.sinkCalled, "$leftSpacing should have not been called")
        #expect(!self.publishers.contentSpacing.sinkCalled, "$contentSpacing should have not been called")
        #expect(!self.publishers.rightSpacing.sinkCalled, "$rightSpacing should have not been called")

        #expect(!self.publishers.dim.sinkCalled, "$dim should not have been called")
        #expect(!self.publishers.font.sinkCalled, "$font should not have been called")
    }

    // MARK: - Utils
    func setupPublishers() {
        self.publishers = .init(
            textColor: PublisherMock(publisher: self.viewModel.$textColor),
            placeholderColor: PublisherMock(publisher: self.viewModel.$placeholderColor),
            borderColor: PublisherMock(publisher: self.viewModel.$borderColor),
            backgroundColor: PublisherMock(publisher: self.viewModel.$backgroundColor),
            borderRadius: PublisherMock(publisher: self.viewModel.$borderRadius),
            borderWidth: PublisherMock(publisher: self.viewModel.$borderWidth),
            leftSpacing: PublisherMock(publisher: self.viewModel.$leftSpacing),
            contentSpacing: PublisherMock(publisher: self.viewModel.$contentSpacing),
            rightSpacing: PublisherMock(publisher: self.viewModel.$rightSpacing),
            dim: PublisherMock(publisher: self.viewModel.$dim),
            font: PublisherMock(publisher: self.viewModel.$font)
        )
        self.publishers.load()
    }

    func resetUseCases() {
        self.getColorsUseCase.reset()
        self.getBorderLayoutUseCase.reset()
        self.getSpacingsUseCase.reset()
    }
}

final class TextFieldPublishers {
    var cancellables = Set<AnyCancellable>()

    var textColor: PublisherMock<Published<any ColorToken>.Publisher>
    var placeholderColor: PublisherMock<Published<any ColorToken>.Publisher>
    var borderColor: PublisherMock<Published<any ColorToken>.Publisher>
    var backgroundColor: PublisherMock<Published<any ColorToken>.Publisher>

    var borderRadius: PublisherMock<Published<CGFloat>.Publisher>
    var borderWidth: PublisherMock<Published<CGFloat>.Publisher>

    var leftSpacing: PublisherMock<Published<CGFloat>.Publisher>
    var contentSpacing: PublisherMock<Published<CGFloat>.Publisher>
    var rightSpacing: PublisherMock<Published<CGFloat>.Publisher>

    var dim: PublisherMock<Published<CGFloat>.Publisher>

    var font: PublisherMock<Published<any TypographyFontToken>.Publisher>

    init(
        textColor: PublisherMock<Published<any ColorToken>.Publisher>,
        placeholderColor: PublisherMock<Published<any ColorToken>.Publisher>,
        borderColor: PublisherMock<Published<any ColorToken>.Publisher>,
        backgroundColor: PublisherMock<Published<any ColorToken>.Publisher>,
        borderRadius: PublisherMock<Published<CGFloat>.Publisher>,
        borderWidth: PublisherMock<Published<CGFloat>.Publisher>,
        leftSpacing: PublisherMock<Published<CGFloat>.Publisher>,
        contentSpacing: PublisherMock<Published<CGFloat>.Publisher>,
        rightSpacing: PublisherMock<Published<CGFloat>.Publisher>,
        dim: PublisherMock<Published<CGFloat>.Publisher>,
        font: PublisherMock<Published<any TypographyFontToken>.Publisher>
    ) {
        self.textColor = textColor
        self.placeholderColor = placeholderColor
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
        self.borderRadius = borderRadius
        self.borderWidth = borderWidth
        self.leftSpacing = leftSpacing
        self.contentSpacing = contentSpacing
        self.rightSpacing = rightSpacing
        self.dim = dim
        self.font = font
    }

    func load() {
        self.cancellables = Set<AnyCancellable>()

        [self.textColor, self.placeholderColor, self.borderColor, self.backgroundColor].forEach {
            $0.loadTesting(on: &self.cancellables)
        }

        [self.borderWidth, self.borderRadius, self.leftSpacing, self.contentSpacing, self.rightSpacing, self.dim].forEach {
            $0.loadTesting(on: &self.cancellables)
        }

        self.font.loadTesting(on: &self.cancellables)
    }

    func reset() {
        [self.textColor, self.placeholderColor, self.borderColor, self.backgroundColor].forEach {
            $0.reset()
        }

        [self.borderWidth, self.borderRadius, self.leftSpacing, self.contentSpacing, self.rightSpacing, self.dim].forEach {
            $0.reset()
        }

        self.font.reset()
    }
}
