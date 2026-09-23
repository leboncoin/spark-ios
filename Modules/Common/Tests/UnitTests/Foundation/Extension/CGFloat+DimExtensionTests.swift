//
//  CGFloat+DimExtensionTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkCommon

class CGFloatDimExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_showViewFromDim_with_valueLessThanOne() {
        // GIVEN
        let value: CGFloat = 0.5

        // WHEN
        let result = value.showViewFromDim

        // THEN
        XCTAssertTrue(result)
    }

    func test_showViewFromDim_with_valueEqualToOne() {
        // GIVEN
        let value: CGFloat = 1.0

        // WHEN
        let result = value.showViewFromDim

        // THEN
        XCTAssertFalse(result)
    }

    func test_showViewFromDim_with_valueGreaterThanOne() {
        // GIVEN
        let value: CGFloat = 2.0

        // WHEN
        let result = value.showViewFromDim

        // THEN
        XCTAssertFalse(result)
    }

    func test_showViewFromDim_with_zero() {
        // GIVEN
        let value: CGFloat = 0.0

        // WHEN
        let result = value.showViewFromDim

        // THEN
        XCTAssertTrue(result)
    }

    func test_showViewFromDim_with_negativeValue() {
        // GIVEN
        let value: CGFloat = -0.5

        // WHEN
        let result = value.showViewFromDim

        // THEN
        XCTAssertTrue(result)
    }

    func test_showViewFromDim_with_smallPositiveValue() {
        // GIVEN
        let value: CGFloat = 0.1

        // WHEN
        let result = value.showViewFromDim

        // THEN
        XCTAssertTrue(result)
    }

    func test_showViewFromDim_with_verySmallValue() {
        // GIVEN
        let value: CGFloat = 0.0001

        // WHEN
        let result = value.showViewFromDim

        // THEN
        XCTAssertTrue(result)
    }

    func test_showViewFromDim_with_largeValue() {
        // GIVEN
        let value: CGFloat = 100.0

        // WHEN
        let result = value.showViewFromDim

        // THEN
        XCTAssertFalse(result)
    }
}
