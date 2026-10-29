//
//  RatingInputGetDimUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Rating Input Get Dim Use Case Tests")
struct RatingInputGetDimUseCaseTests {

    // MARK: - Properties

    var sut: RatingInputGetDimUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    init() {

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingInputGetDimUseCase()
    }

    // MARK: - Tests

    @Test("Execute when enabled returns none dim")
    func executeWhenEnabledReturnsNoneDim() {
        // GIVEN
        let expectedDim = self.theme.dims.none

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isEnabled: true
        )

        // THEN
        #expect(result == expectedDim)
    }

    @Test("Execute when disabled returns dim3")
    func executeWhenDisabledReturnsDim3() {
        // GIVEN
        let expectedDim = self.theme.dims.dim3

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isEnabled: false
        )

        // THEN
        #expect(result == expectedDim)
    }
}
