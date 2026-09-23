//
//  PopoverViewModelTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by louis.borlee on 26/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentPopover
@_spi(SI_SPI) @testable import SparkComponentPopoverTesting
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class PopoverViewModelTests: XCTestCase {

    private let theme = ThemeGeneratedMock.mocked()

    func test_init() throws {
        // GIVEN
        let getColorsUseCaseMock = PopoverGetColorsUseCasableGeneratedMock()
        getColorsUseCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReturnValue = .init(
            background: self.theme.colors.feedback.alertContainer,
            foreground: self.theme.colors.support.supportContainer
        )

        let getSpacesUseCaseMock = PopoverGetSpacesUseCasableGeneratedMock()
        getSpacesUseCaseMock.executeWithLayoutSpacingAndIsLiquidGlassReturnValue = .init(
            horizontal: 4,
            vertical: 2
        )

        // WHEN
        let viewModel = PopoverViewModel(
            theme: self.theme,
            intent: .support,
            showArrow: true,
            getColorsUseCase: getColorsUseCaseMock,
            getSpacesUseCase: getSpacesUseCaseMock
        )

        // THEN - Values
        XCTAssertTrue(viewModel.colors.background.equals(self.theme.colors.feedback.alertContainer), "Wrong colors.background")
        XCTAssertTrue(viewModel.colors.foreground.equals(self.theme.colors.support.supportContainer), "Wrong colors.foreground")

        XCTAssertEqual(viewModel.spaces.horizontal, 4.0, "Wrong spaces.horizontal")
        XCTAssertEqual(viewModel.spaces.vertical, 2.0, "Wrong spaces.vertical")

        XCTAssertTrue(viewModel.showArrow, "showArrow should be true")

        XCTAssertEqual(viewModel.arrowSize, self.theme.layout.spacing.medium, "Wrong arrowSize")

        // THEN - GetColorsUseCase
        XCTAssertEqual(getColorsUseCaseMock.executeWithColorsAndIntentAndIsLiquidGlassCallsCount, 1, "getColorsUseCaseMock.executeWithColorsAndIntent should have been called once")
        let getColorsUseCaseReceivedArguments = try XCTUnwrap(getColorsUseCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReceivedArguments, "Couldn't unwrap getColorsUseCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReceivedArguments")
        XCTAssertIdentical(
            getColorsUseCaseReceivedArguments.colors as? ColorsGeneratedMock,
            self.theme.colors as? ColorsGeneratedMock,
            "Wrong getColorsUseCaseReceivedArguments.colors"
        )
        XCTAssertEqual(getColorsUseCaseReceivedArguments.intent, .support, "Wrong getColorsUseCaseReceivedArguments.intent")
        XCTAssertEqual(getColorsUseCaseReceivedArguments.isLiquidGlass, PopoverConstants.isLiquidGlass, "Wrong getColorsUseCaseReceivedArguments.isLiquidGlass")

        // THEN - GetSpacesUseCase
        XCTAssertEqual(getSpacesUseCaseMock.executeWithLayoutSpacingAndIsLiquidGlassCallsCount, 1, "getSpacesUseCaseMock.executeWithLayoutSpacing should have been called once")
        let getSpacesUseCaseReceivedArguments = try XCTUnwrap(getSpacesUseCaseMock.executeWithLayoutSpacingAndIsLiquidGlassReceivedArguments, "Couldn't unwrap getSpacesUseCaseMock.executeWithLayoutSpacingAndIsLiquidGlassReceivedArguments")
        XCTAssertIdentical(
            getSpacesUseCaseReceivedArguments.layoutSpacing as? LayoutSpacingGeneratedMock,
            self.theme.layout.spacing as? LayoutSpacingGeneratedMock,
            "Wrong getSpacesUseCaseReceivedLayoutSpacing"
        )
        XCTAssertEqual(getSpacesUseCaseReceivedArguments.isLiquidGlass, PopoverConstants.isLiquidGlass, "Wrong getSpacesUseCaseMock.isLiquidGlass")
    }
}
