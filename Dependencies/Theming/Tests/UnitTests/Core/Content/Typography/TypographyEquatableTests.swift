//
//  TypographyEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class TypographyEquatableTests: XCTestCase {

    // MARK: - Tests

    func testEquatable_SameProperties_ShouldBeEqual() {
        let typography1 = TypographyMock.createMock1()
        let typography2 = TypographyMock.createMock2()

        // WHEN / THEN
        XCTAssertTrue(typography1.equals(typography2), "Two typography with identical properties should be equal")
        XCTAssertEqual(typography1, typography2, "Two typography with identical properties should be equal using == operator")
    }

    func testEquatable_DifferentProperties_ShouldNotBeEqual() {
        let typography1 = TypographyMock.createMock1()
        let differentTypography = TypographyMock.createDifferentMock()

        // WHEN / THEN
        XCTAssertFalse(typography1.equals(differentTypography), "Two typography with different properties should not be equal")
        XCTAssertNotEqual(typography1, differentTypography, "Two typography with different properties should not be equal using == operator")
    }

    func testEquatable_SelfComparison_ShouldBeEqual() {
        let typography = TypographyMock.createMock1()

        // WHEN / THEN
        XCTAssertTrue(typography.equals(typography), "Typography should be equal to itself")
        XCTAssertEqual(typography, typography, "Typography should be equal to itself using == operator")
    }

    func testHashable_SameProperties_ShouldHaveSameHashValue() {
        let typography1 = TypographyMock.createMock1()
        let typography2 = TypographyMock.createMock2()

        // WHEN / THEN
        XCTAssertEqual(typography1.hashValue, typography2.hashValue, "Typography with identical properties should have the same hash value")
    }

    func testHashable_DifferentProperties_ShouldHaveDifferentHashValue() {
        let typography1 = TypographyMock.createMock1()
        let differentTypography = TypographyMock.createDifferentMock()

        // WHEN / THEN
        XCTAssertNotEqual(typography1.hashValue, differentTypography.hashValue, "Typography with different properties should have different hash values")
    }
}
