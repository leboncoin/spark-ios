//
//  DimsEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming

final class DimsEquatableTests: XCTestCase {

    // MARK: - Tests

    func testEquatable_SameProperties_ShouldBeEqual() {
        // GIVEN
        let dims1 = DimsMock.createMock1()
        let dims2 = DimsMock.createMock2()

        XCTAssertTrue(dims1.equals(dims2), "Two dims with identical properties should be equal")
        XCTAssertEqual(dims1, dims2, "Two dims with identical properties should be equal using == operator")
    }

    func testEquatable_DifferentProperties_ShouldNotBeEqual() {
        // GIVEN
        let dims1 = DimsMock.createMock1()
        let differentDims = DimsMock.createDifferentMock()

        XCTAssertFalse(dims1.equals(differentDims), "Two dims with different properties should not be equal")
        XCTAssertNotEqual(dims1, differentDims, "Two dims with different properties should not be equal using == operator")
    }

    func testEquatable_SelfComparison_ShouldBeEqual() {
        // GIVEN
        let dims = DimsMock.createMock1()

        XCTAssertTrue(dims.equals(dims), "Dims should be equal to itself")
        XCTAssertEqual(dims, dims, "Dims should be equal to itself using == operator")
    }

    func testHashable_SameProperties_ShouldHaveSameHashValue() {
        // GIVEN
        let dims1 = DimsMock.createMock1()
        let dims2 = DimsMock.createMock2()

        XCTAssertEqual(dims1.hashValue, dims2.hashValue, "Dims with identical properties should have the same hash value")
    }

    func testHashable_DifferentProperties_ShouldHaveDifferentHashValue() {
        // GIVEN
        let dims1 = DimsMock.createMock1()
        let differentDims = DimsMock.createDifferentMock()

        XCTAssertNotEqual(dims1.hashValue, differentDims.hashValue, "Dims with different properties should have different hash values")
    }
}
