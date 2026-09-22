//
//  RatingInputGetDimUseCaseTests.swift
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

final class RatingInputGetDimUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingInputGetDimUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingInputGetDimUseCase()
    }

    // MARK: - Tests

    func test_execute_when_enabled_returns_none_dim() {
        // GIVEN
        let expectedDim = self.theme.dims.none

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, expectedDim)
    }

    func test_execute_when_disabled_returns_dim3() {
        // GIVEN
        let expectedDim = self.theme.dims.dim3

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isEnabled: false
        )

        // THEN
        XCTAssertEqual(result, expectedDim)
    }
}
