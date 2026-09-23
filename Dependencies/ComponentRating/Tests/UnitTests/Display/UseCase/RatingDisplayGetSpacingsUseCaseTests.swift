//
//  RatingDisplayGetSpacingsUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class RatingDisplayGetSpacingsUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingDisplayGetSpacingsUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingDisplayGetSpacingsUseCase()
    }

    // MARK: - Tests

    func test_execute() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        let expectedSpacings = RatingDisplaySpacings(
            content: self.theme.layout.spacing.medium,
            stars: self.theme.layout.spacing.small
        )

        XCTAssertEqual(result, expectedSpacings)
    }

    func test_execute_returns_correct_content_spacing() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        XCTAssertEqual(result.content, self.theme.layout.spacing.medium)
    }

    func test_execute_returns_correct_stars_spacing() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        XCTAssertEqual(result.stars, self.theme.layout.spacing.small)
    }
}
