//
//  RatingSizeAttributesUseCaseDeprecatedTests.swift
//  SparkComponentRatingUnitTests
//
//  Created by Michael Zimmermann on 20.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkThemingTesting

final class RatingSizeAttributesUseCaseDeprecatedTests: XCTestCase {

    var spacing: LayoutSpacingGeneratedMock!
    var sut: RatingSizeAttributesUseCaseDeprecated!

    // MARK: - Setup
    override func setUp() {
        super.setUp()
        self.spacing = LayoutSpacingGeneratedMock.mocked()
        self.sut = RatingSizeAttributesUseCaseDeprecated()
    }

    // MARK: - Tests
    func test_small() {
        // When
        let sizes = sut.execute(spacing: self.spacing, size: .small)

        // Then
        XCTAssertEqual(sizes, .init(borderWidth: 1.0, height: 12.0, spacing: 3.0))
    }

    func test_medium() {
        // When
        let sizes = sut.execute(spacing: self.spacing, size: .medium)

        // Then
        XCTAssertEqual(sizes, .init(borderWidth: 1.33, height: 16.0, spacing: 3.0))
    }

    func test_large() {
        // When
        let sizes = sut.execute(spacing: self.spacing, size: .large)

        // Then
        XCTAssertEqual(sizes, .init(borderWidth: 2.0, height: 24.0, spacing: 3.0))
    }

    func test_input() {
        // When
        let sizes = sut.execute(spacing: self.spacing, size: .input)

        // Then
        XCTAssertEqual(sizes, .init(borderWidth: 3.33, height: 40.0, spacing: 5.0))
    }
}
