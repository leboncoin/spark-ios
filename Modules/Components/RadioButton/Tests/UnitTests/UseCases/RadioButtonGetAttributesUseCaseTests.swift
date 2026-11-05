//
//  RadioButtonGetAttributesUseCaseTests.swift
//  SparkComponentRadioButtonUnitTests
//
//  Created by michael.zimmermann on 26.10.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentRadioButton
@_spi(SI_SPI) @testable import SparkComponentRadioButtonTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheme
import Testing

@Suite("RadioButton Get Attributes UseCase Tests")
struct RadioButtonGetAttributesUseCaseTests {

    // MARK: - Properties

    let sut: RadioButtonGetAttributesUseCase
    let colorsUseCase: RadioButtonGetColorsUseCaseableGeneratedMock
    let theme: ThemeGeneratedMock
    let colors: RadioButtonColors

    // MARK: - Initialization

    init() {
        SparkConfiguration.load()
        self.theme = ThemeGeneratedMock.mocked()

        self.colorsUseCase = RadioButtonGetColorsUseCaseableGeneratedMock()
        self.sut = RadioButtonGetAttributesUseCase(colorsUseCase: self.colorsUseCase)
        self.colors = RadioButtonColors(
            button: ColorTokenGeneratedMock.random(),
            label: ColorTokenGeneratedMock.random(),
            halo: ColorTokenGeneratedMock.random(),
            fill: ColorTokenGeneratedMock.random(),
            surface: ColorTokenGeneratedMock.random()
        )
        self.colorsUseCase.executeWithThemeAndIntentAndIsSelectedReturnValue = self.colors
    }

    // MARK: - Tests

    @Test("Attributes for enabled state with leading alignment")
    func attributesEnabledStateLeadingAlignment() {
        // Given
        let expectedAttributes = RadioButtonAttributes(
            colors: self.colors,
            opacity: 1,
            spacing: self.theme.layout.spacing.medium,
            font: self.theme.typography.body1)

        // When
        let givenAttributes = self.sut.execute(
            theme: self.theme,
            intent: .support,
            state: .isEnabled,
            alignment: .leading
        )

        #expect(givenAttributes == expectedAttributes)
    }

    @Test("Attributes for enabled state with trailing alignment")
    func attributesEnabledStateTrailingAlignment() {
        // Given
        let expectedAttributes = RadioButtonAttributes(
            colors: self.colors,
            opacity: 1,
            spacing: self.theme.layout.spacing.medium,
            font: self.theme.typography.body1)

        // When
        let givenAttributes = self.sut.execute(
            theme: self.theme,
            intent: .support,
            state: .isEnabled,
            alignment: .trailing
        )

        #expect(givenAttributes == expectedAttributes)
    }

    @Test("Attributes for disabled state with trailing alignment")
    func attributesDisabledStateTrailingAlignment() {
        // Given
        let expectedAttributes = RadioButtonAttributes(
            colors: self.colors,
            opacity: self.theme.dims.dim3,
            spacing: self.theme.layout.spacing.medium,
            font: self.theme.typography.body1)

        // When
        let givenAttributes = self.sut.execute(
            theme: self.theme,
            intent: .support,
            state: .isDisabled,
            alignment: .trailing
        )

        #expect(givenAttributes == expectedAttributes)
    }
}

private extension RadioButtonStateAttribute {
    static var isEnabled = RadioButtonStateAttribute(isSelected: false, isEnabled: true)
    static var isDisabled = RadioButtonStateAttribute(isSelected: false, isEnabled: false)
}
