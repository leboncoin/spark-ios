//
//  ElevationEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ElevationEquatableTests: XCTestCase {

    // MARK: - Tests

    func testEquatable_SameProperties_ShouldBeEqual() {
        // GIVEN
        let elevation1 = ElevationMock.createMock1()
        let elevation2 = ElevationMock.createMock2()

        XCTAssertTrue(elevation1.equals(elevation2), "Two elevation with identical properties should be equal")
        XCTAssertEqual(elevation1, elevation2, "Two elevation with identical properties should be equal using == operator")
    }

    func testEquatable_DifferentProperties_ShouldNotBeEqual() {
        // GIVEN
        let elevation1 = ElevationMock.createMock1()
        let differentElevation = ElevationMock.createDifferentMock()

        XCTAssertFalse(elevation1.equals(differentElevation), "Two elevation with different properties should not be equal")
        XCTAssertNotEqual(elevation1, differentElevation, "Two elevation with different properties should not be equal using == operator")
    }

    func testEquatable_SelfComparison_ShouldBeEqual() {
        // GIVEN
        let elevation = ElevationMock.createMock1()

        XCTAssertTrue(elevation.equals(elevation), "Elevation should be equal to itself")
        XCTAssertEqual(elevation, elevation, "Elevation should be equal to itself using == operator")
    }

    func testHashable_SameProperties_ShouldHaveSameHashValue() {
        // GIVEN
        let elevation1 = ElevationMock.createMock1()
        let elevation2 = ElevationMock.createMock2()

        XCTAssertEqual(elevation1.hashValue, elevation2.hashValue, "Elevation with identical properties should have the same hash value")
    }

    func testHashable_DifferentProperties_ShouldHaveDifferentHashValue() {
        // GIVEN
        let elevation1 = ElevationMock.createMock1()
        let differentElevation = ElevationMock.createDifferentMock()

        XCTAssertNotEqual(elevation1.hashValue, differentElevation.hashValue, "Elevation with different properties should have different hash values")
    }
}
