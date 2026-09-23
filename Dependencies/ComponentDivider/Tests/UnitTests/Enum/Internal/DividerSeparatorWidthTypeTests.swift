//
//  DividerSeparatorWidthTypeTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentDivider

final class DividerSeparatorWidthTypeTests: XCTestCase {

    // MARK: - Tests

    func test_default() {
        // GIVEN & WHEN
        let defaultWidthType = DividerSeparatorWidthType.default

        // THEN
        XCTAssertEqual(defaultWidthType, .equal, "DividerSeparatorWidthType.default should be .equal")
    }

    // MARK: - IsEqual Tests

    func test_isEqual_whenEqual() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.equal

        // WHEN
        let isEqual = widthType.isEqual

        // THEN
        XCTAssertTrue(isEqual, "DividerSeparatorWidthType.equal.isEqual should be true")
    }

    func test_isEqual_whenFixed() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.fixed

        // WHEN
        let isEqual = widthType.isEqual

        // THEN
        XCTAssertFalse(isEqual, "DividerSeparatorWidthType.fixed.isEqual should be false")
    }

    func test_isEqual_whenDynamic() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.dynamic

        // WHEN
        let isEqual = widthType.isEqual

        // THEN
        XCTAssertFalse(isEqual, "DividerSeparatorWidthType.dynamic.isEqual should be false")
    }

    // MARK: - IsFixed Tests

    func test_isFixed_whenFixed() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.fixed

        // WHEN
        let isFixed = widthType.isFixed

        // THEN
        XCTAssertTrue(isFixed, "DividerSeparatorWidthType.fixed.isFixed should be true")
    }

    func test_isFixed_whenEqual() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.equal

        // WHEN
        let isFixed = widthType.isFixed

        // THEN
        XCTAssertFalse(isFixed, "DividerSeparatorWidthType.equal.isFixed should be false")
    }

    func test_isFixed_whenDynamic() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.dynamic

        // WHEN
        let isFixed = widthType.isFixed

        // THEN
        XCTAssertFalse(isFixed, "DividerSeparatorWidthType.dynamic.isFixed should be false")
    }
}
