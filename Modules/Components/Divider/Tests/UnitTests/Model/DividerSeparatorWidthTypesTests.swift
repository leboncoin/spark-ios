//
//  DividerSeparatorWidthTypesTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentDivider

final class DividerSeparatorWidthTypesTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_init_default_values() {
        // GIVEN & WHEN
        let widthTypes = DividerSeparatorWidthTypes()

        // THEN
        XCTAssertEqual(
            widthTypes.first,
            .default,
            "Default first should be .default"
        )
        XCTAssertEqual(
            widthTypes.last,
            .default,
            "Default last should be .default"
        )
    }

    func test_init_with_custom_values() {
        // GIVEN & WHEN
        let widthTypes = DividerSeparatorWidthTypes(
            first: .fixed,
            last: .dynamic
        )

        // THEN
        XCTAssertEqual(
            widthTypes.first,
            .fixed,
            "First should be .fixed"
        )
        XCTAssertEqual(
            widthTypes.last,
            .dynamic,
            "Last should be .dynamic"
        )
    }

    // MARK: - Value Method Tests

    func test_value_for_first_position() {
        // GIVEN
        let widthTypes = DividerSeparatorWidthTypes(
            first: .fixed,
            last: .dynamic
        )

        // WHEN
        let value = widthTypes.value(for: .first)

        // THEN
        XCTAssertEqual(
            value,
            .fixed,
            "Value for .first position should return first property"
        )
    }

    func test_value_for_last_position() {
        // GIVEN
        let widthTypes = DividerSeparatorWidthTypes(
            first: .fixed,
            last: .dynamic
        )

        // WHEN
        let value = widthTypes.value(for: .last)

        // THEN
        XCTAssertEqual(
            value,
            .dynamic,
            "Value for .last position should return last property"
        )
    }

    // MARK: - Equatable Tests

    func test_equatable_same_instances() {
        // GIVEN
        let widthTypes1 = DividerSeparatorWidthTypes()
        let widthTypes2 = DividerSeparatorWidthTypes()

        // WHEN & THEN
        XCTAssertEqual(
            widthTypes1,
            widthTypes2,
            "Two DividerSeparatorWidthTypes instances with same values should be equal"
        )
    }

    func test_equatable_same_custom_values() {
        // GIVEN
        let widthTypes1 = DividerSeparatorWidthTypes(first: .fixed, last: .dynamic)
        let widthTypes2 = DividerSeparatorWidthTypes(first: .fixed, last: .dynamic)

        // WHEN & THEN
        XCTAssertEqual(
            widthTypes1,
            widthTypes2,
            "Two DividerSeparatorWidthTypes instances with same custom values should be equal"
        )
    }

    func test_equatable_different_first_values() {
        // GIVEN
        let widthTypes1 = DividerSeparatorWidthTypes(first: .fixed, last: .dynamic)
        let widthTypes2 = DividerSeparatorWidthTypes(first: .equal, last: .dynamic)

        // WHEN & THEN
        XCTAssertNotEqual(
            widthTypes1,
            widthTypes2,
            "DividerSeparatorWidthTypes with different first values should not be equal"
        )
    }

    func test_equatable_different_last_values() {
        // GIVEN
        let widthTypes1 = DividerSeparatorWidthTypes(first: .fixed, last: .dynamic)
        let widthTypes2 = DividerSeparatorWidthTypes(first: .fixed, last: .equal)

        // WHEN & THEN
        XCTAssertNotEqual(
            widthTypes1,
            widthTypes2,
            "DividerSeparatorWidthTypes with different last values should not be equal"
        )
    }
}