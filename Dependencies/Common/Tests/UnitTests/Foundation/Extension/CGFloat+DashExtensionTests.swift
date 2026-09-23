//
//  CGFloat+DashExtensionTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkCommon

class CGFloatDashExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_toDashArray_with_positiveValue() {
        let value: CGFloat = 5.0

        let result = value.toDashArray

        XCTAssertEqual(result, [5.0])
    }

    func test_toDashArray_with_smallPositiveValue() {
        let value: CGFloat = 0.1

        let result = value.toDashArray

        XCTAssertEqual(result, [0.1])
    }

    func test_toDashArray_with_zeroValue() {
        let value: CGFloat = 0.0

        let result = value.toDashArray

        XCTAssertEqual(result, [])
    }

    func test_toDashArray_with_negativeValue() {
        let value: CGFloat = -5.0

        let result = value.toDashArray

        XCTAssertEqual(result, [])
    }

    func test_toDashArray_with_largeValue() {
        let value: CGFloat = 1000.0

        let result = value.toDashArray

        XCTAssertEqual(result, [1000.0])
    }
}
