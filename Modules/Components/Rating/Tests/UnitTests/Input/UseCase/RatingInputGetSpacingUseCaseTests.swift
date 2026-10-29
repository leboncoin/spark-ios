//
//  RatingInputGetSpacingUseCaseTests.swift
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

@Suite("Rating Input Get Spacing Use Case Tests")
struct RatingInputGetSpacingUseCaseTests {

    // MARK: - Properties

    var sut: RatingInputGetSpacingUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    init() {

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingInputGetSpacingUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns medium spacing")
    func executeReturnsMediumSpacing() {
        // GIVEN
        let expectedSpacing = self.theme.layout.spacing.medium

        // WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        #expect(result == expectedSpacing)
    }
}
