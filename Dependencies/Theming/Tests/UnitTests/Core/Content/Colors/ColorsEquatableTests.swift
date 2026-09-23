//
//  ColorsEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ColorsEquatableTests: XCTestCase {

    // MARK: - Tests

    func testEquatable_SameParameters_ShouldBeEqual() {
        // GIVEN
        let colors1 = ColorsMock.createMock1()
        let colors2 = ColorsMock.createMock2()

        // WHEN / THEN
        XCTAssertTrue(colors1.equals(colors2), "Two colors with identical properties should be equal")
        XCTAssertEqual(colors1, colors2, "Two colors with identical properties should be equal using == operator")
    }

    func testEquatable_DifferentParameters_ShouldNotBeEqual() {
        // GIVEN
        let colors1 = ColorsMock.createMock1()
        let differentColors = ColorsMock.createDifferentMock()

        // WHEN / THEN
        XCTAssertFalse(colors1.equals(differentColors), "Two colors with different properties should not be equal")
        XCTAssertNotEqual(colors1, differentColors, "Two colors with different properties should not be equal using == operator")
    }

    func testEquatable_SelfComparison_ShouldBeEqual() {
        // GIVEN
        let colors = ColorsMock.createMock1()

        // WHEN / THEN
        XCTAssertTrue(colors.equals(colors), "Colors should be equal to itself")
        XCTAssertEqual(colors, colors, "Colors should be equal to itself using == operator")
    }

    func testHashable_SameParameters_ShouldHaveSameHashValue() {
        // GIVEN
        let colors1 = ColorsMock.createMock1()
        let colors2 = ColorsMock.createMock2()

        // WHEN / THEN
        XCTAssertEqual(colors1.hashValue, colors2.hashValue, "Colorss with identical properties should have the same hash value")
    }

    func testHashable_DifferentParameters_ShouldHaveDifferentHashValue() {
        // GIVEN
        let colors1 = ColorsMock.createMock1()
        let differentColors = ColorsMock.createDifferentMock()

        // WHEN / THEN
        XCTAssertNotEqual(colors1.hashValue, differentColors.hashValue, "ColorsWidths with different properties should have different hash values")
    }
}
