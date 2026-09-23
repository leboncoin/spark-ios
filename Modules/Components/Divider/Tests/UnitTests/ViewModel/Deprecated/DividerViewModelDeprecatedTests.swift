//
//  DividerViewModelDeprecatedTests.swift
//  SparkComponentDividerTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import Combine
import SparkTheming

@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

final class DividerViewModelDeprecatedTests: XCTestCase {

    var publishers: DividerPublishers!

    override func setUp() {
        super.setUp()
        self.publishers = nil
    }

    func setupPublishers(viewModel: DividerViewModelDeprecated) {
        self.publishers = .init(
            textColor: PublisherMock(publisher: viewModel.$textColor),
            separatorColor: PublisherMock(publisher: viewModel.$separatorColor),
            spacing: PublisherMock(publisher: viewModel.$spacing),
            textFont: PublisherMock(publisher: viewModel.$textFont)
        )
        self.publishers.load()
    }

    func test_init() throws {
        // GIVEç
        let theme = ThemeGeneratedMock.mocked()
        let intent = DividerIntent.outlineHigh
        let useCase = DividierGetColorsUseCasableDeprecatedGeneratedMock()
        useCase.executeWithColorsAndIntentReturnValue = .init(
            text: ColorTokenGeneratedMock.blue(),
            separator: ColorTokenGeneratedMock.red()
        )

        // WHEN
        let viewModel = DividerViewModelDeprecated(
            theme: theme,
            intent: intent,
            getColorsUseCase: useCase
        )
        self.setupPublishers(viewModel: viewModel)

        // THEN - Variables
        XCTAssertIdentical(viewModel.theme as? ThemeGeneratedMock, theme, "Wrong theme")
        XCTAssertEqual(viewModel.intent, intent, "Wrong intent")
        XCTAssertEqual(viewModel.spacing, theme.layout.spacing.large, "Wrong spacing")
        XCTAssertIdentical(viewModel.textFont as? TypographyFontTokenGeneratedMock, theme.typography.body1 as? TypographyFontTokenGeneratedMock, "Wrong textFont")
        XCTAssertTrue(viewModel.textColor.equals(ColorTokenGeneratedMock.blue()), "Wrong textColor")
        XCTAssertTrue(viewModel.separatorColor.equals(ColorTokenGeneratedMock.red()), "Wrong separatorColor")

        // THEN - UseCase
        XCTAssertEqual(useCase.executeWithColorsAndIntentCallsCount, 1, "executeWithColorsAndIntentCalls should have been called once")
        let receivedArguments = try XCTUnwrap(useCase.executeWithColorsAndIntentReceivedArguments, "Couldn't unwrap receivedArguments")
        XCTAssertEqual(receivedArguments.intent, intent, "Wrong received intent")
        XCTAssertIdentical(receivedArguments.colors as? ColorsGeneratedMock, theme.colors as? ColorsGeneratedMock, "Wrong received colors")

        // THEN - Publishers
        XCTAssertEqual(self.publishers.textColor.sinkCount, 1, "$textColor should have been called once")
        XCTAssertEqual(self.publishers.separatorColor.sinkCount, 1, "$separatorColor should have been called once")
        XCTAssertEqual(self.publishers.textFont.sinkCount, 1, "$textFont should have been called once")
        XCTAssertEqual(self.publishers.spacing.sinkCount, 1, "$spacing should have been called once")
    }

    func test_didSet_theme() throws {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = DividerIntent.outlineHigh
        let useCase = DividierGetColorsUseCasableDeprecatedGeneratedMock()
        useCase.executeWithColorsAndIntentReturnValue = .init()
        let viewModel = DividerViewModelDeprecated(
            theme: theme,
            intent: intent,
            getColorsUseCase: useCase
        )

        let newTheme = ThemeGeneratedMock.mocked()
        self.setupPublishers(viewModel: viewModel)

        let spacing = LayoutSpacingGeneratedMock.mocked()
        spacing.large = -99
        let layout = LayoutGeneratedMock.mocked()
        layout.spacing = spacing
        newTheme.layout = layout

        self.publishers.reset()
        useCase.reset()

        // WHEN
        viewModel.theme = newTheme

        // THEN - Variables
        XCTAssertIdentical(viewModel.theme as? ThemeGeneratedMock, newTheme, "Wrong theme")
        XCTAssertEqual(viewModel.spacing, -99, "Wrong spacing")
        XCTAssertIdentical(viewModel.textFont as? TypographyFontTokenGeneratedMock, newTheme.typography.body1 as? TypographyFontTokenGeneratedMock, "Wrong textFont")

        // THEN - UseCase
        XCTAssertEqual(useCase.executeWithColorsAndIntentCallsCount, 1, "executeWithColorsAndIntent should have been called once")
        let receivedArguments = try XCTUnwrap(useCase.executeWithColorsAndIntentReceivedArguments, "Couldn't unwrap receivedArguments")
        XCTAssertEqual(receivedArguments.intent, intent, "Wrong received intent")
        XCTAssertIdentical(receivedArguments.colors as? ColorsGeneratedMock, newTheme.colors as? ColorsGeneratedMock, "Wrong received colors")

        // THEN - Publishers
        XCTAssertEqual(self.publishers.textColor.sinkCount, 1, "$textColor should have been called once")
        XCTAssertEqual(self.publishers.separatorColor.sinkCount, 1, "$separatorColor should have been called once")
        XCTAssertEqual(self.publishers.textFont.sinkCount, 1, "$textFont should have been called once")
        XCTAssertEqual(self.publishers.spacing.sinkCount, 1, "$spacing should have been called once")
    }

    func test_didSet_intent() throws {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = DividerIntent.outlineHigh
        let useCase = DividierGetColorsUseCasableDeprecatedGeneratedMock()
        useCase.executeWithColorsAndIntentReturnValue = .init()
        let viewModel = DividerViewModelDeprecated(
            theme: theme,
            intent: intent,
            getColorsUseCase: useCase
        )
        self.setupPublishers(viewModel: viewModel)

        self.publishers.reset()
        useCase.reset()

        // WHEN
        viewModel.intent = .outline

        // THEN - UseCase
        XCTAssertEqual(useCase.executeWithColorsAndIntentCallsCount, 1, "executeWithColorsAndIntent should have been called once")
        let receivedArguments = try XCTUnwrap(useCase.executeWithColorsAndIntentReceivedArguments, "Couldn't unwrap receivedArguments")
        XCTAssertEqual(receivedArguments.intent, .outline, "Wrong received intent")
        XCTAssertIdentical(receivedArguments.colors as? ColorsGeneratedMock, theme.colors as? ColorsGeneratedMock, "Wrong received colors")

        // THEN - Publishers
        XCTAssertEqual(self.publishers.textColor.sinkCount, 1, "$textColor should have been called once")
        XCTAssertEqual(self.publishers.separatorColor.sinkCount, 1, "$separatorColor should have been called once")
        XCTAssertFalse(self.publishers.textFont.sinkCalled, "$textFont should not have been called")
        XCTAssertFalse(self.publishers.spacing.sinkCalled, "$spacing should not have been called")
    }

    func test_didSet_intent_equal() throws {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = DividerIntent.outlineHigh
        let useCase = DividierGetColorsUseCasableDeprecatedGeneratedMock()
        useCase.executeWithColorsAndIntentReturnValue = .init()
        let viewModel = DividerViewModelDeprecated(
            theme: theme,
            intent: intent,
            getColorsUseCase: useCase
        )
        self.setupPublishers(viewModel: viewModel)

        self.publishers.reset()
        useCase.reset()

        // WHEN
        viewModel.intent = intent

        // THEN - UseCase
        XCTAssertFalse(
            useCase.executeWithColorsAndIntentCalled,
            "executeWithColorsAndIntent should not be called when new intent is equal to the previous one"
        )

        // THEN - Publishers
        XCTAssertFalse(self.publishers.textColor.sinkCalled, "$textColor should not have been called")
        XCTAssertFalse(self.publishers.separatorColor.sinkCalled, "$separatorColor should not have been called")
        XCTAssertFalse(self.publishers.textFont.sinkCalled, "$textFont should not have been called")
        XCTAssertFalse(self.publishers.spacing.sinkCalled, "$spacing should not have been called")
    }
}

final class DividerPublishers {
    var cancellables = Set<AnyCancellable>()

    var textColor: PublisherMock<Published<any ColorToken>.Publisher>
    var separatorColor: PublisherMock<Published<any ColorToken>.Publisher>

    var spacing: PublisherMock<Published<CGFloat>.Publisher>

    var textFont: PublisherMock<Published<any TypographyFontToken>.Publisher>

    init(
        textColor: PublisherMock<Published<any ColorToken>.Publisher>,
        separatorColor: PublisherMock<Published<any ColorToken>.Publisher>,
        spacing: PublisherMock<Published<CGFloat>.Publisher>,
        textFont: PublisherMock<Published<any TypographyFontToken>.Publisher>
    ) {
        self.textColor = textColor
        self.separatorColor = separatorColor
        self.spacing = spacing
        self.textFont = textFont
    }

    func load() {
        self.cancellables = Set<AnyCancellable>()

        [self.textColor, self.separatorColor].forEach {
            $0.loadTesting(on: &self.cancellables)
        }

        self.spacing.loadTesting(on: &self.cancellables)

        self.textFont.loadTesting(on: &self.cancellables)
    }

    func reset() {
        [self.textColor, self.separatorColor].forEach {
            $0.reset()
        }

        self.spacing.reset()

        self.textFont.reset()
    }
}
