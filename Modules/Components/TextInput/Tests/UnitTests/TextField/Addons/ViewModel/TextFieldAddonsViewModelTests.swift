//
//  TextFieldAddonsViewModelTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 21/03/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import Combine
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("TextField Addons ViewModel Tests")
final class TextFieldAddonsViewModelTests {

    // MARK: - Properties

    private var theme: ThemeGeneratedMock!
    private var publishers: TextFieldAddonsPublishers!
    private var getColorsUseCase: TextInputGetColorsUseCaseableGeneratedMock!
    private var getBorderLayoutUseCase: TextInputGetBorderLayoutUseCaseableGeneratedMock!
    private var getSpacingsUseCase: TextInputGetSpacingsUseCaseableGeneratedMock!
    private var viewModel: TextFieldAddonsViewModel!

    private let intent = TextInputIntent.success
    private let borderStyle = TextInputBorderStyle.roundedRect

    private var expectedColors: TextInputColors!
    private var expectedBorderLayout: TextInputBorderLayout!
    private var expectedSpacings: TextInputSpacings!

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
            getColorsUseCase: self.getColorsUseCase,
            getBorderLayoutUseCase: self.getBorderLayoutUseCase,
            getSpacingsUseCase: self.getSpacingsUseCase
        )

        self.setupPublishers()
    }

    // MARK: - Tests

    @Test("Init")
    func initialization() throws {
        // GIVEN / WHEN - Inits from setUp()

        // THEN - Colors
        #expect(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyCallsCount == 1, "getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsUserInteractionEnabled should have been called once")
        let getColorsReceivedArguments = try #require(self.getColorsUseCase.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReceivedArguments, "Couldn't unwrap getColorsReceivedArguments")
        #expect(getColorsReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getColorsReceivedArguments.theme")
        #expect(getColorsReceivedArguments.intent == self.intent, "Wrong getColorsReceivedArguments.intent")
        #expect(!getColorsReceivedArguments.isFocused, "Wrong getColorsReceivedArguments.isFocused")
        #expect(getColorsReceivedArguments.isEnabled, "Wrong getColorsReceivedArguments.isEnabled")
        #expect(!getColorsReceivedArguments.isReadOnly, "Wrong getColorsReceivedArguments.isReadOnly")
        #expect(self.viewModel.backgroundColor.equals(self.expectedColors.background), "Wrong backgroundColor")

        // THEN - Border Layout
        #expect(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCallsCount == 2, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should have been called twice (one for textfield, one for addons)")
        let getBorderLayoutReceivedArguments = try #require(self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReceivedArguments, "Couldn't unwrap getBorderLayoutReceivedArguments")
        #expect(getBorderLayoutReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getBorderLayoutReceivedArguments.theme")
        #expect(getBorderLayoutReceivedArguments.borderStyle == .roundedRect, "Wrong getBorderLayoutReceivedArguments.borderStyle")
        #expect(!getBorderLayoutReceivedArguments.isFocused, "Wrong getBorderLayoutReceivedArguments.isFocused")
        #expect(self.viewModel.borderWidth == self.expectedBorderLayout.width, "Wrong borderWidth")
        #expect(self.viewModel.borderRadius == self.expectedBorderLayout.radius, "Wrong borderRadius")

        // THEN - Spacings
        #expect(self.getSpacingsUseCase.executeWithThemeAndBorderStyleCallsCount == 2, "getSpacingsUseCase.executeWithThemeAndBorderStyle should have been called twice (one for textfield, one for addons)")
        let getSpacingsUseCaseReceivedArguments = try #require(self.getSpacingsUseCase.executeWithThemeAndBorderStyleReceivedArguments, "Couldn't unwrap getSpacingsUseCaseReceivedArguments")
        #expect(getSpacingsUseCaseReceivedArguments.theme as? ThemeGeneratedMock === self.theme, "Wrong getSpacingsUseCaseReceivedArguments.theme")
        #expect(getSpacingsUseCaseReceivedArguments.borderStyle == .roundedRect, "Wrong getSpacingsUseCaseReceivedArguments.borderStyle")
        #expect(self.viewModel.leftSpacing == self.expectedSpacings.horizontal, "Wrong horizontalSpacing")
        #expect(self.viewModel.contentSpacing == self.expectedSpacings.content, "Wrong contentSpacing")
        #expect(self.viewModel.rightSpacing == self.expectedSpacings.horizontal, "Wrong horizontalSpacing")

        #expect(self.viewModel.dim == self.theme.dims.none, "Wrong dim")

        // THEN - Publishers
        #expect(self.publishers.backgroundColor.sinkCount == 1, "$backgroundColor should have been called once")

        #expect(self.publishers.borderWidth.sinkCount == 1, "$borderWidth should have been called once")
        #expect(self.publishers.borderRadius.sinkCount == 1, "$borderRadius should have been called once")

        #expect(self.publishers.leftSpacing.sinkCount == 1, "$leftSpacing should have been called once")
        #expect(self.publishers.contentSpacing.sinkCount == 1, "$contentSpacing should have been called once")
        #expect(self.publishers.rightSpacing.sinkCount == 1, "$rightSpacing should have been called once")

        #expect(self.publishers.dim.sinkCount == 1, "$dim should have been called once")
    }

    @Test("Set background color")
    func setBackgroundColor() {
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // GIVEN
        let newBackgroundColor = ColorTokenDefault.clear

        // WHEN
        self.viewModel.textFieldViewModel.backgroundColor = newBackgroundColor

        // THEN
        #expect(self.publishers.backgroundColor.sinkCount == 1, "backgroundColor should have been called once")
        #expect(self.viewModel.backgroundColor.equals(newBackgroundColor), "Wrong backgroundColor")
    }

    @Test("Set border layout")
    func setBorderLayout() {
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // GIVEN
        let newValue = TextInputBorderLayout(radius: -1, width: -2)
        self.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReturnValue = newValue

        // WHEN
        self.viewModel.textFieldViewModel.setBorderLayout()

        // THEN
        #expect(self.publishers.borderWidth.sinkCount == 1, "borderWidth should have been called once")
        #expect(self.viewModel.borderWidth == newValue.width, "Wrong borderWidth")
        #expect(self.publishers.borderRadius.sinkCount == 1, "borderRadius should have been called once")
        #expect(self.viewModel.borderRadius == newValue.radius, "Wrong borderRadius")
    }

    @Test("Set spacings")
    func setSpacings() {
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // GIVEN
        let newValue = TextInputSpacings(horizontal: -1, content: -2)
        self.getSpacingsUseCase.executeWithThemeAndBorderStyleReturnValue = newValue

        // WHEN
        self.viewModel.textFieldViewModel.setSpacings()

        // THEN
        #expect(self.publishers.leftSpacing.sinkCount == 1, "leftSpacing should have been called once")
        #expect(self.viewModel.leftSpacing == newValue.horizontal, "Wrong horizontalSpacing")
        #expect(self.publishers.contentSpacing.sinkCount == 1, "contentSpacing should have been called once")
        #expect(self.viewModel.contentSpacing == newValue.content, "Wrong contentSpacing")
        #expect(self.publishers.rightSpacing.sinkCount == 1, "rightSpacing should have been called once")
        #expect(self.viewModel.rightSpacing == newValue.horizontal, "Wrong horizontalSpacing")
    }

    @Test("Set dim")
    func setDim() {
        self.resetUseCases() // Removes execute from init
        self.publishers.reset() // Removes publishes from init

        // GIVEN
        let newDim = self.theme.dims.none + 1

        // WHEN
        self.viewModel.textFieldViewModel.dim = newDim

        // THEN
        #expect(self.publishers.dim.sinkCount == 1, "dim should have been called once")
        #expect(self.viewModel.dim == newDim, "Wrong dim")
    }

    // MARK: - Utils
    private func setupPublishers() {
        self.publishers = .init(
            backgroundColor: PublisherMock(publisher: self.viewModel.$backgroundColor),
            borderRadius: PublisherMock(publisher: self.viewModel.$borderRadius),
            borderWidth: PublisherMock(publisher: self.viewModel.$borderWidth),
            leftSpacing: PublisherMock(publisher: self.viewModel.$leftSpacing),
            contentSpacing: PublisherMock(publisher: self.viewModel.$contentSpacing),
            rightSpacing: PublisherMock(publisher: self.viewModel.$rightSpacing),
            dim: PublisherMock(publisher: self.viewModel.$dim)
        )
        self.publishers.load()
    }

    private func resetUseCases() {
        self.getColorsUseCase.reset()
        self.getBorderLayoutUseCase.reset()
        self.getSpacingsUseCase.reset()
    }
}

final class TextFieldAddonsPublishers {
    var cancellables = Set<AnyCancellable>()

    var backgroundColor: PublisherMock<Published<any ColorToken>.Publisher>

    var borderRadius: PublisherMock<Published<CGFloat>.Publisher>
    var borderWidth: PublisherMock<Published<CGFloat>.Publisher>

    var leftSpacing: PublisherMock<Published<CGFloat>.Publisher>
    var contentSpacing: PublisherMock<Published<CGFloat>.Publisher>
    var rightSpacing: PublisherMock<Published<CGFloat>.Publisher>

    var dim: PublisherMock<Published<CGFloat>.Publisher>

    init(
        backgroundColor: PublisherMock<Published<any ColorToken>.Publisher>,
        borderRadius: PublisherMock<Published<CGFloat>.Publisher>,
        borderWidth: PublisherMock<Published<CGFloat>.Publisher>,
        leftSpacing: PublisherMock<Published<CGFloat>.Publisher>,
        contentSpacing: PublisherMock<Published<CGFloat>.Publisher>,
        rightSpacing: PublisherMock<Published<CGFloat>.Publisher>,
        dim: PublisherMock<Published<CGFloat>.Publisher>
    ) {
        self.backgroundColor = backgroundColor
        self.borderRadius = borderRadius
        self.borderWidth = borderWidth
        self.leftSpacing = leftSpacing
        self.contentSpacing = contentSpacing
        self.rightSpacing = rightSpacing
        self.dim = dim
    }

    func load() {
        self.cancellables = Set<AnyCancellable>()

        [self.backgroundColor].forEach {
            $0.loadTesting(on: &self.cancellables)
        }

        [self.borderWidth, self.borderRadius, self.leftSpacing, self.contentSpacing, self.rightSpacing, self.dim].forEach {
            $0.loadTesting(on: &self.cancellables)
        }
    }

    func reset() {
        [self.backgroundColor].forEach {
            $0.reset()
        }

        [self.borderWidth, self.borderRadius, self.leftSpacing, self.contentSpacing, self.rightSpacing, self.dim].forEach {
            $0.reset()
        }
    }
}
