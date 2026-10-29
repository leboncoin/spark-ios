//
//  SliderGetTypographiesUseCaseTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Slider Get Typographies UseCase Tests")
struct SliderGetTypographiesUseCaseTests {

    // MARK: - Private properties

    private let sut: SliderGetTypographiesUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Setup

    init() {
        self.sut = SliderGetTypographiesUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Execute when is floating value label is false")
    func executeWhenIsFloatingValueLabelIsFalse() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, isFloatingValueLabel: false)

        // THEN
        #expect(result.titleFontToken.equals(self.theme.typography.body1))
        #expect(result.valueFontToken.equals(self.theme.typography.body1Highlight))
        #expect(result.rangeValuesFontToken.equals(self.theme.typography.body2))
    }

    @Test("Execute when is floating value label is true")
    func executeWhenIsFloatingValueLabelIsTrue() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, isFloatingValueLabel: true)

        // THEN
        #expect(result.titleFontToken.equals(self.theme.typography.body1Highlight))
        #expect(result.valueFontToken.equals(self.theme.typography.body2Highlight))
        #expect(result.rangeValuesFontToken.equals(self.theme.typography.body2))
    }
}
