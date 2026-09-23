//
//  CGSize+InitExtensionTests.swift
//  SparkCoreUnitTests
//
//  Created by robin.lemaire on 12/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@_spi(SI_SPI) @testable import SparkCommon

final class CGSizeInitExtensionTests: XCTestCase {

    // MARK: - Tests

    func testInitWithSingleValue() throws {
        // GIVEN
        let size = CGSize(value: 10.0)

        // WHEN / THEN
        XCTAssertEqual(size.width, 10.0, "Width should equal the provided value")
        XCTAssertEqual(size.height, 10.0, "Height should equal the provided value")
    }

    func testInitWithZero() throws {
        // GIVEN
        let size = CGSize(value: 0.0)

        // WHEN / THEN
        XCTAssertEqual(size.width, 0.0, "Width should be zero")
        XCTAssertEqual(size.height, 0.0, "Height should be zero")
    }

    func testInitWithNegativeValue() throws {
        // GIVEN
        let size = CGSize(value: -5.5)

        // WHEN / THEN
        XCTAssertEqual(size.width, -5.5, "Width should equal the negative value")
        XCTAssertEqual(size.height, -5.5, "Height should equal the negative value")
    }

    func testInitWithLargeValue() throws {
        // GIVEN
        let size = CGSize(value: 1000.0)

        // WHEN / THEN
        XCTAssertEqual(size.width, 1000.0, "Width should equal the large value")
        XCTAssertEqual(size.height, 1000.0, "Height should equal the large value")
    }

    func testInitWithDecimalValue() throws {
        // GIVEN
        let size = CGSize(value: 3.14)

        // WHEN / THEN
        XCTAssertEqual(size.width, 3.14, accuracy: 0.001, "Width should equal the decimal value")
        XCTAssertEqual(size.height, 3.14, accuracy: 0.001, "Height should equal the decimal value")
    }

}
