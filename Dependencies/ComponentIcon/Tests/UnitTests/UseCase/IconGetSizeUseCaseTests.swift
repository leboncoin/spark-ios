//
//  IconGetSizeUseCaseTests.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentIcon

final class IconGetSizeUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: IconGetSizeUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = IconGetSizeUseCase()
    }

    // MARK: - Predefined Sizes Tests

    func test_execute_all_predefined_sizes() {
        // GIVEN
        let testCases: [(IconSize, CGFloat)] = [
            (.small, 16.0),
            (.medium, 24.0),
            (.large, 32.0),
            (.extraLarge, 40.0)
        ]

        // WHEN / THEN
        for (size, expectedValue) in testCases {
            let result = self.sut.execute(size: size)
            XCTAssertEqual(result, expectedValue, "Expected size \(size) to return \(expectedValue)")
        }
    }

    // MARK: - Custom Sizes Tests

    func test_execute_with_custom_size() {
        // GIVEN
        let customValue: CGFloat = 50.0
        let size = IconSize.custom(customValue)

        // WHEN
        let result = self.sut.execute(size: size)

        // THEN
        XCTAssertEqual(result, customValue)
    }

    func test_execute_with_custom_zero_size() {
        // GIVEN
        let size = IconSize.custom(0.0)

        // WHEN
        let result = self.sut.execute(size: size)

        // THEN
        XCTAssertEqual(result, 0.0)
    }

    func test_execute_with_custom_negative_size() {
        // GIVEN
        let size = IconSize.custom(-10.0)

        // WHEN
        let result = self.sut.execute(size: size)

        // THEN
        XCTAssertEqual(result, -10.0)
    }

    func test_execute_with_custom_fractional_size() {
        // GIVEN
        let size = IconSize.custom(24.5)

        // WHEN
        let result = self.sut.execute(size: size)

        // THEN
        XCTAssertEqual(result, 24.5)
    }
}
