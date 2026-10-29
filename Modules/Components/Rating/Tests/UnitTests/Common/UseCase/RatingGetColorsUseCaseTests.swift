//
//  RatingGetColorsUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Rating Get Colors Use Case Tests")
struct RatingGetColorsUseCaseTests {

    // MARK: - Properties

    var sut: RatingGetColorsUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    init() {

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingGetColorsUseCase()
    }

    // MARK: - Tests

    @Test("Execute")
    func execute() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme)

        // THEN
        let expectedColors = RatingColors(
            filledStarTintColorToken: self.theme.colors.main.mainVariant,
            strokeStarTintColorToken: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim3)
        )

        #expect(colors == expectedColors)
    }
}
