//
//  CircularMeterGetTypographiesUseCaseTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Circular Meter Get Typographies Use Case Tests")
struct CircularMeterGetTypographiesUseCaseTests {

    // MARK: - Private properties

    private let sut = CircularMeterGetTypographiesUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with small size")
    func executeWithSmallSize() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, size: .small)

        // THEN
        #expect(result.valueFontToken.equals(self.theme.typography.body2Highlight))
        #expect(result.contentFontToken.equals(self.theme.typography.small))
    }

    @Test("Execute with medium size")
    func executeWithMediumSize() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, size: .medium)

        // THEN
        #expect(result.valueFontToken.equals(self.theme.typography.body2Highlight))
        #expect(result.contentFontToken.equals(self.theme.typography.small))
    }

    @Test("Execute with large size")
    func executeWithLargeSize() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, size: .large)

        // THEN
        #expect(result.valueFontToken.equals(self.theme.typography.body1Highlight))
        #expect(result.contentFontToken.equals(self.theme.typography.caption))
    }

    @Test("Execute with xLarge size")
    func executeWithXLargeSize() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, size: .xLarge)

        // THEN
        #expect(result.valueFontToken.equals(self.theme.typography.display3))
        #expect(result.contentFontToken.equals(self.theme.typography.body2))
    }
}
