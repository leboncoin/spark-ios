//
//  IntConvertedValueTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 21/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentBadge

final class IntConvertedValueTests: XCTestCase {

    // MARK: - Tests

    func test_converted_when_value_is_nil() {
        // GIVEN
        let sut: Int? = nil

        // WHEN
        let converted = sut.converted("kg")

        // THEN
        XCTAssertNil(converted)
    }

    func test_converted_when_unit_is_nil() {
        // GIVEN
        let sut: Int? = 42

        // WHEN
        let converted = sut.converted(nil)

        // THEN
        XCTAssertEqual(converted, "42")
    }

    func test_converted_when_unit_is_not_nil() {
        // GIVEN
        let sut: Int? = 42

        // WHEN
        let converted = sut.converted("kg")

        // THEN
        XCTAssertEqual(converted, "42kg")
    }

    func test_converted_when_value_is_greater_than_max() {
        // GIVEN
        let sut: Int? = 150

        // WHEN
        let converted = sut.converted("kg")

        // THEN
        XCTAssertEqual(converted, "99kg")
    }
}
