//
//  RatingDisplayGetSpacingsUseCaseTests.swift
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

@Suite("Rating Display Get Spacings Use Case Tests")
struct RatingDisplayGetSpacingsUseCaseTests {

    // MARK: - Properties

    var sut: RatingDisplayGetSpacingsUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    init() {

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingDisplayGetSpacingsUseCase()
    }

    // MARK: - Tests

    @Test("Execute")
    func execute() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        let expectedSpacings = RatingDisplaySpacings(
            content: self.theme.layout.spacing.medium,
            stars: self.theme.layout.spacing.small
        )

        #expect(result == expectedSpacings)
    }

    @Test("Execute returns correct content spacing")
    func executeReturnsCorrectContentSpacing() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        #expect(result.content == self.theme.layout.spacing.medium)
    }

    @Test("Execute returns correct stars spacing")
    func executeReturnsCorrectStarsSpacing() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        #expect(result.stars == self.theme.layout.spacing.small)
    }
}
