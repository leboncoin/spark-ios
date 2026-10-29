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
import Testing
import Foundation

@MainActor
@Suite("Popover ViewModel Tests")
struct PopoverViewModelTests {

    private let theme = ThemeGeneratedMock.mocked()

    @Test("Initialization should set the values and call the use cases")
    func initialization() throws {
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
        #expect(viewModel.colors.background.equals(self.theme.colors.feedback.alertContainer), "Wrong colors.background")
        #expect(viewModel.colors.foreground.equals(self.theme.colors.support.supportContainer), "Wrong colors.foreground")

        #expect(viewModel.spaces.horizontal == 4.0, "Wrong spaces.horizontal")
        #expect(viewModel.spaces.vertical == 2.0, "Wrong spaces.vertical")

        #expect(viewModel.showArrow, "showArrow should be true")

        #expect(viewModel.arrowSize == self.theme.layout.spacing.medium, "Wrong arrowSize")

        // THEN - GetColorsUseCase
        #expect(getColorsUseCaseMock.executeWithColorsAndIntentAndIsLiquidGlassCallsCount == 1, "getColorsUseCaseMock.executeWithColorsAndIntent should have been called once")
        let getColorsUseCaseReceivedArguments = try #require(getColorsUseCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReceivedArguments, "Couldn't unwrap getColorsUseCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReceivedArguments")
        #expect(
            (getColorsUseCaseReceivedArguments.colors as? ColorsGeneratedMock) === (self.theme.colors as? ColorsGeneratedMock),
            "Wrong getColorsUseCaseReceivedArguments.colors"
        )
        #expect(getColorsUseCaseReceivedArguments.intent == .support, "Wrong getColorsUseCaseReceivedArguments.intent")
        #expect(getColorsUseCaseReceivedArguments.isLiquidGlass == PopoverConstants.isLiquidGlass, "Wrong getColorsUseCaseReceivedArguments.isLiquidGlass")

        // THEN - GetSpacesUseCase
        #expect(getSpacesUseCaseMock.executeWithLayoutSpacingAndIsLiquidGlassCallsCount == 1, "getSpacesUseCaseMock.executeWithLayoutSpacing should have been called once")
        let getSpacesUseCaseReceivedArguments = try #require(getSpacesUseCaseMock.executeWithLayoutSpacingAndIsLiquidGlassReceivedArguments, "Couldn't unwrap getSpacesUseCaseMock.executeWithLayoutSpacingAndIsLiquidGlassReceivedArguments")
        #expect(
            (getSpacesUseCaseReceivedArguments.layoutSpacing as? LayoutSpacingGeneratedMock) === (self.theme.layout.spacing as? LayoutSpacingGeneratedMock),
            "Wrong getSpacesUseCaseReceivedLayoutSpacing"
        )
        #expect(getSpacesUseCaseReceivedArguments.isLiquidGlass == PopoverConstants.isLiquidGlass, "Wrong getSpacesUseCaseMock.isLiquidGlass")
    }
}
