//
//  BadgeGetTextUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentBadge

final class BadgeGetTextUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: BadgeGetTextUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = BadgeGetTextUseCase()
    }

    // MARK: - Tests

    func test_execute_with_nil_value_should_return_nil() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: nil,
            unit: nil
        )

        // THEN
        XCTAssertNil(result)
    }

    func test_execute_with_nil_value_and_unit_should_return_nil() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: nil,
            unit: "€"
        )

        // THEN
        XCTAssertNil(result)
    }

    func test_execute_with_value_and_nil_unit_should_return_string_value() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 5,
            unit: nil
        )

        // THEN
        XCTAssertEqual(result, "5")
    }

    func test_execute_with_value_and_unit_should_return_concatenated_string() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 10,
            unit: "€"
        )

        // THEN
        XCTAssertEqual(result, "10€")
    }

    func test_execute_with_zero_value_and_nil_unit_should_return_zero_string() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 0,
            unit: nil
        )

        // THEN
        XCTAssertEqual(result, "0")
    }

    func test_execute_with_zero_value_and_unit_should_return_concatenated_string() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 0,
            unit: "€"
        )

        // THEN
        XCTAssertEqual(result, "0€")
    }

    func test_execute_with_value_below_max_and_nil_unit_should_return_string_value() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 50,
            unit: nil
        )

        // THEN
        XCTAssertEqual(result, "50")
    }

    func test_execute_with_value_at_max_and_nil_unit_should_return_string_value() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 99,
            unit: nil
        )

        // THEN
        XCTAssertEqual(result, "99")
    }

    func test_execute_with_value_above_max_and_nil_unit_should_return_max_value() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 150,
            unit: nil
        )

        // THEN
        XCTAssertEqual(result, "99+")
    }

    func test_execute_with_value_above_max_and_unit_should_return_max_value_with_unit() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 200,
            unit: "€"
        )

        // THEN
        XCTAssertEqual(result, "99+€")
    }
}
