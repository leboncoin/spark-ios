//
//  BorderEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class BorderEquatableTests: XCTestCase {

    // MARK: - Tests

    func testEquatable_SameParameters_ShouldBeEqual() {
        // GIVEN
        let border1 = BorderMock.createMock1()
        let border2 = BorderMock.createMock2()

        // WHEN / THEN
        XCTAssertTrue(border1.equals(border2), "Two borders with identical properties should be equal")
        XCTAssertEqual(border1, border2, "Two borders with identical properties should be equal using == operator")
    }

    func testEquatable_DifferentParameters_ShouldNotBeEqual() {
        // GIVEN
        let border1 = BorderMock.createMock1()
        let differentBorder = BorderMock.createDifferentMock()

        // WHEN / THEN
        XCTAssertFalse(border1.equals(differentBorder), "Two borders with different properties should not be equal")
        XCTAssertNotEqual(border1, differentBorder, "Two borders with different properties should not be equal using == operator")
    }

    func testEquatable_SelfComparison_ShouldBeEqual() {
        // GIVEN
        let border = BorderMock.createMock1()

        // WHEN / THEN
        XCTAssertTrue(border.equals(border), "Border should be equal to itself")
        XCTAssertEqual(border, border, "Border should be equal to itself using == operator")
    }

    func testHashable_SameParameters_ShouldHaveSameHashValue() {
        // GIVEN
        let border1 = BorderMock.createMock1()
        let border2 = BorderMock.createMock2()

        // WHEN / THEN
        XCTAssertEqual(border1.hashValue, border2.hashValue, "Borders with identical properties should have the same hash value")
    }

    func testHashable_DifferentParameters_ShouldHaveDifferentHashValue() {
        // GIVEN
        let border1 = BorderMock.createMock1()
        let differentBorder = BorderMock.createDifferentMock()

        // WHEN / THEN
        XCTAssertNotEqual(border1.hashValue, differentBorder.hashValue, "BorderWidths with different properties should have different hash values")
    }
}
