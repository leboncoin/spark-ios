//
//  RatingGetColorsUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkThemingTesting

final class RatingGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingGetColorsUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingGetColorsUseCase()
    }

    // MARK: - Tests

    func test_execute() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme)

        // THEN
        let expectedColors = RatingColors(
            filledStarTintColorToken: self.theme.colors.main.mainVariant,
            strokeStarTintColorToken: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim3)
        )

        XCTAssertEqual(colors, expectedColors)
    }
}
