//
//  SwitchGetColorsUseCaseTests.swift
//  SparkComponentSwitchTests
//
//  Created by robin.lemaire on 12/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentSwitch
@_spi(SI_SPI) @testable import SparkComponentSwitchTesting
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Switch Get Colors UseCase Tests")
struct SwitchGetColorsUseCaseTests {

    // MARK: - Tests

    @Test("Execute should return the colors and call the get color use case")
    func execute() throws {
        // GIVEN
        let intentMock = SwitchIntent.alert
        let colorTokenMock = ColorTokenGeneratedMock.random()

        let colorsMock = ColorsGeneratedMock.mocked()
        let dimsMock = DimsGeneratedMock.mocked()

        let getColorUseCaseMock = SwitchGetColorUseCaseableGeneratedMock()
        getColorUseCaseMock.executeWithIntentAndColorsReturnValue = colorTokenMock

        let expectedOnColorToken = colorTokenMock
        let expectedOffColorToken = colorsMock.base.onSurface.opacity(dimsMock.dim4)

        let useCase = SwitchGetColorsUseCase(getColorUseCase: getColorUseCaseMock)

        // WHEN

        let colors = useCase.execute(
            intent: intentMock,
            colors: colorsMock,
            dims: dimsMock
        )

        // **
        // Status background colors
        #expect(
            colors.toggleBackgroundColors.onColorToken.hashValue == expectedOnColorToken.hashValue,
            "Wrong onColorToken on toggleBackgroundColors"
        )
        #expect(
            colors.toggleBackgroundColors.offColorToken.hashValue == expectedOffColorToken.hashValue,
            "Wrong offColorToken on toggleBackgroundColors"
        )
        // **

        #expect(
            colors.toggleDotBackgroundColor.hashValue == colorsMock.base.surface.hashValue,
            "Wrong toggleBackgroundColor color"
        )

        // **
        // State foreground colors
        #expect(
            colors.toggleDotForegroundColors.onColorToken.hashValue == expectedOnColorToken.hashValue,
            "Wrong onColorToken on toggleDotForegroundColors"
        )
        #expect(
            colors.toggleDotForegroundColors.offColorToken.hashValue == expectedOffColorToken.hashValue,
            "Wrong offColorToken on toggleDotForegroundColors"
        )
        // **

        #expect(
            colors.textForegroundColor.hashValue == colorsMock.base.onSurface.hashValue,
            "Wrong textForegroundColor color"
        )

        // **
        // GetColorUseCase
        let getColorUseCaseArgs = getColorUseCaseMock.executeWithIntentAndColorsReceivedArguments
        #expect(
            getColorUseCaseMock.executeWithIntentAndColorsCallsCount == 1,
            "Wrong call number on execute on getColorUseCase"
        )
        #expect(
            getColorUseCaseArgs?.intent == intentMock,
            "Wrong intent parameter on execute on getColorUseCaseMock"
        )
        #expect(
            getColorUseCaseArgs?.colors as? ColorsGeneratedMock === colorsMock,
            "Wrong colors parameter on execute on getColorUseCaseMock"
        )
        // **
    }
}
