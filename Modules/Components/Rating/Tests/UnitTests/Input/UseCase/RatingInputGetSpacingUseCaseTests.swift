//
//  RatingInputGetSpacingUseCaseTests.swift
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

final class RatingInputGetSpacingUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingInputGetSpacingUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingInputGetSpacingUseCase()
    }

    // MARK: - Tests

    func test_execute_returns_medium_spacing() {
        // GIVEN
        let expectedSpacing = self.theme.layout.spacing.medium

        // WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        XCTAssertEqual(result, expectedSpacing)
    }
}
