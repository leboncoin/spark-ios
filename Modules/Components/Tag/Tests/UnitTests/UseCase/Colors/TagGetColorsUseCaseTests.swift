//
//  TagGetColorsUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentTag
@_spi(SI_SPI) @testable import SparkComponentTagTesting
@_spi(SI_SPI) import SparkThemingTesting

struct TagGetColorsUseCaseTests {

    // MARK: - Tests

    @Test
    func test_execute_variant_filled() throws {
        // GIVEN
        let expectedValue = TagColors.mocked()
        let filledUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        filledUseCase.executeWithThemeAndIntentReturnValue = expectedValue
        let outlinedUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        let tintedUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        let theme = ThemeGeneratedMock.mocked()

        let useCase = TagGetColorsUseCase(
            filledUseCase: filledUseCase,
            outlinedUseCase: outlinedUseCase,
            tintedUseCase: tintedUseCase
        )
        let variant = TagVariant.filled
        let intent = TagIntent.alert

        // WHEN
        let sut = useCase.execute(
            theme: theme,
            intent: intent,
            variant: variant
        )

        // THEN
        TagGetColorsVariantUseCaseableMockTest.expectCalled(
            outlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )
        TagGetColorsVariantUseCaseableMockTest.expectCalled(
            tintedUseCase,
            executeWithThemeAndIntentCalled: false
        )
        TagGetColorsVariantUseCaseableMockTest.expect(
            filledUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedValue
        )
        #expect(sut == expectedValue)
    }

    @Test
    func test_execute_variant_outlined() throws {
        // GIVEN
        let expectedValue = TagColors.mocked()
        let filledUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        let outlinedUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        outlinedUseCase.executeWithThemeAndIntentReturnValue = expectedValue
        let tintedUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        let theme = ThemeGeneratedMock.mocked()

        let useCase = TagGetColorsUseCase(
            filledUseCase: filledUseCase,
            outlinedUseCase: outlinedUseCase,
            tintedUseCase: tintedUseCase
        )
        let variant = TagVariant.outlined
        let intent = TagIntent.danger

        // WHEN
        let sut = useCase.execute(
            theme: theme,
            intent: intent,
            variant: variant
        )

        // THEN
        TagGetColorsVariantUseCaseableMockTest.expectCalled(
            filledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        TagGetColorsVariantUseCaseableMockTest.expectCalled(
            tintedUseCase,
            executeWithThemeAndIntentCalled: false
        )
        TagGetColorsVariantUseCaseableMockTest.expect(
            outlinedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedValue
        )
        #expect(sut == expectedValue)
    }

    @Test
    func test_execute_variant_tinted() throws {
        // GIVEN
        let expectedValue = TagColors.mocked()
        let filledUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        let outlinedUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        let tintedUseCase = TagGetColorsVariantUseCaseableGeneratedMock()
        tintedUseCase.executeWithThemeAndIntentReturnValue = expectedValue
        let theme = ThemeGeneratedMock.mocked()

        let useCase = TagGetColorsUseCase(
            filledUseCase: filledUseCase,
            outlinedUseCase: outlinedUseCase,
            tintedUseCase: tintedUseCase
        )
        let variant = TagVariant.tinted
        let intent = TagIntent.success

        // WHEN
        let sut = useCase.execute(
            theme: theme,
            intent: intent,
            variant: variant
        )

        // THEN
        TagGetColorsVariantUseCaseableMockTest.expectCalled(
            filledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        TagGetColorsVariantUseCaseableMockTest.expectCalled(
            outlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )
        TagGetColorsVariantUseCaseableMockTest.expect(
            tintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedValue
        )
        #expect(sut == expectedValue)
    }
}
