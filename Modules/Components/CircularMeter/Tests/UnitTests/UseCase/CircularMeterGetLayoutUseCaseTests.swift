//
//  CircularMeterGetLayoutUseCaseTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Circular Meter Get Layout Use Case Tests")
struct CircularMeterGetLayoutUseCaseTests {

    // MARK: - Private properties

    private let sut = CircularMeterGetLayoutUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute returns correct layout")
    func executeReturnsCorrectLayout() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        #expect(result.spacing == self.theme.layout.spacing.medium)
        #expect(result.padding == self.theme.layout.spacing.small)
    }
}
