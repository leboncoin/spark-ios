//
//  SliderGetSpacingUseCaseTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Slider Get Spacing UseCase Tests")
struct SliderGetSpacingUseCaseTests {

    // MARK: - Private properties

    private let sut: SliderGetSpacingUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Setup

    init() {
        self.sut = SliderGetSpacingUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Execute returns correct spacing")
    func executeReturnsCorrectSpacing() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        #expect(result == self.theme.layout.spacing.small)
    }
}
