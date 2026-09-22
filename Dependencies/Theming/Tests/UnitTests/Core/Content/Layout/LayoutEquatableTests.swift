//
//  LayoutEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class LayoutEquatableTests: XCTestCase {

    // MARK: - Tests

    func testEquatable_SameProperties_ShouldBeEqual() {
        // GIVEN
        let layout1 = LayoutMock.createMock1()
        let layout2 = LayoutMock.createMock2()

        XCTAssertTrue(layout1.equals(layout2), "Two layout with identical properties should be equal")
        XCTAssertEqual(layout1, layout2, "Two layout with identical properties should be equal using == operator")
    }

    func testEquatable_DifferentProperties_ShouldNotBeEqual() {
        // GIVEN
        let layout1 = LayoutMock.createMock1()
        let differentLayout = LayoutMock.createDifferentMock()

        XCTAssertFalse(layout1.equals(differentLayout), "Two layout with different properties should not be equal")
        XCTAssertNotEqual(layout1, differentLayout, "Two layout with different properties should not be equal using == operator")
    }

    func testEquatable_SelfComparison_ShouldBeEqual() {
        // GIVEN
        let layout = LayoutMock.createMock1()

        XCTAssertTrue(layout.equals(layout), "Layout should be equal to itself")
        XCTAssertEqual(layout, layout, "Layout should be equal to itself using == operator")
    }

    func testHashable_SameProperties_ShouldHaveSameHashValue() {
        // GIVEN
        let layout1 = LayoutMock.createMock1()
        let layout2 = LayoutMock.createMock2()

        XCTAssertEqual(layout1.hashValue, layout2.hashValue, "Layout with identical properties should have the same hash value")
    }

    func testHashable_DifferentProperties_ShouldHaveDifferentHashValue() {
        // GIVEN
        let layout1 = LayoutMock.createMock1()
        let differentLayout = LayoutMock.createDifferentMock()

        XCTAssertNotEqual(layout1.hashValue, differentLayout.hashValue, "Layout with different properties should have different hash values")
    }
}
