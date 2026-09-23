//
//  ProgressBarIndeterminateAnimatedDataTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import XCTest

final class ProgressBarIndeterminateAnimatedDataTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let animatedData = ProgressBarIndeterminateAnimatedData()

        // THEN
        XCTAssertEqual(animatedData.leadingSpaceWidth, .zero)
        XCTAssertEqual(animatedData.indicatorWidth, .zero)
    }

    func test_property_modification() {
        // GIVEN
        var animatedData = ProgressBarIndeterminateAnimatedData()

        // WHEN
        animatedData.leadingSpaceWidth = 100.0
        animatedData.indicatorWidth = 50.0

        // THEN
        XCTAssertEqual(animatedData.leadingSpaceWidth, 100.0)
        XCTAssertEqual(animatedData.indicatorWidth, 50.0)
    }

    func test_custom_initialization() {
        // GIVEN / WHEN
        let animatedData = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 75.5,
            indicatorWidth: 25.2
        )

        // THEN
        XCTAssertEqual(animatedData.leadingSpaceWidth, 75.5)
        XCTAssertEqual(animatedData.indicatorWidth, 25.2)
    }

    func test_equatable_conformance_when_equal() {
        // GIVEN
        let animatedData1 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 50.0
        )
        let animatedData2 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 50.0
        )

        // WHEN / THEN
        XCTAssertEqual(animatedData1, animatedData2)
    }

    func test_equatable_conformance_when_not_equal_leadingSpaceWidth() {
        // GIVEN
        let animatedData1 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 50.0
        )
        let animatedData2 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 90.0,
            indicatorWidth: 50.0
        )

        // WHEN / THEN
        XCTAssertNotEqual(animatedData1, animatedData2)
    }

    func test_equatable_conformance_when_not_equal_indicatorWidth() {
        // GIVEN
        let animatedData1 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 50.0
        )
        let animatedData2 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 40.0
        )

        // WHEN / THEN
        XCTAssertNotEqual(animatedData1, animatedData2)
    }
}
