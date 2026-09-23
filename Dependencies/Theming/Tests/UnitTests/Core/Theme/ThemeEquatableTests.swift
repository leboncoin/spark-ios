//
//  ThemeEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming

final class ThemeEquatableTests: XCTestCase {

    // MARK: - Test Data

    static func createMock1() -> ThemeDefault {
        return ThemeDefault(
            border: BorderMock.createMock1(),
            colors: ColorsMock.createMock1(),
            elevation: ElevationMock.createMock1(),
            layout: LayoutMock.createMock1(),
            typography: TypographyMock.createMock1(),
            dims: DimsMock.createMock1()
        )
    }

    static func createMock2() -> ThemeDefault {
        return ThemeDefault(
            border: BorderMock.createMock2(),
            colors: ColorsMock.createMock2(),
            elevation: ElevationMock.createMock2(),
            layout: LayoutMock.createMock2(),
            typography: TypographyMock.createMock2(),
            dims: DimsMock.createMock2()
        )
    }

    static func createDifferentMock() -> ThemeDefault {
        return ThemeDefault(
            border: BorderMock.createDifferentMock(),
            colors: ColorsMock.createDifferentMock(),
            elevation: ElevationMock.createDifferentMock(),
            layout: LayoutMock.createDifferentMock(),
            typography: TypographyMock.createDifferentMock(),
            dims: DimsMock.createDifferentMock()
        )
    }

    // MARK: - Tests

    func testEquatable_SameProperties_ShouldBeEqual() {
        // GIVEN
        let theme1 = Self.createMock1()
        let theme2 = Self.createMock2()

        // WHEN / THEN
        XCTAssertTrue(theme1.equals(theme2), "Two themes with identical properties should be equal")
        XCTAssertEqual(theme1, theme2, "Two themes with identical properties should be equal using == operator")
    }

    func testEquatable_DifferentProperties_ShouldNotBeEqual() {
        // GIVEN
        let theme1 = Self.createMock1()
        let differentTheme = Self.createDifferentMock()

        // WHEN / THEN
        XCTAssertFalse(theme1.equals(differentTheme), "Two themes with different properties should not be equal")
        XCTAssertNotEqual(theme1, differentTheme, "Two themes with different properties should not be equal using == operator")
    }

    func testEquatable_SelfComparison_ShouldBeEqual() {
        // GIVEN
        let theme = Self.createMock1()

        // WHEN / THEN
        XCTAssertTrue(theme.equals(theme), "A theme should be equal to itself")
        XCTAssertEqual(theme, theme, "A theme should be equal to itself using == operator")
    }

    func testHashable_SameProperties_ShouldHaveSameHashValue() {
        // GIVEN
        let theme1 = Self.createMock1()
        let theme2 = Self.createMock2()

        // WHEN / THEN
        XCTAssertEqual(theme1.hashValue, theme2.hashValue, "Themes with identical properties should have the same hash value")
    }

    func testHashable_DifferentProperties_ShouldHaveDifferentHashValue() {
        // GIVEN
        let theme1 = Self.createMock1()
        let differentTheme = Self.createDifferentMock()

        // WHEN / THEN
        XCTAssertNotEqual(theme1.hashValue, differentTheme.hashValue, "Themes with different properties should have different hash values")
    }

    // MARK: - Optional Tests

    func testOptionalThemeEquatable_BothNil_ShouldBeEqual() {
        // GIVEN
        let theme1: (any Theme)? = nil
        let theme2: (any Theme)? = nil

        // WHEN / THEN
        XCTAssertTrue(theme1.equals(theme2), "Two nil themes should be equal")
    }

    func testOptionalThemeEquatable_OneNilOneNotNil_ShouldNotBeEqual() {
        // GIVEN
        let theme1: (any Theme)? = nil
        let theme2: (any Theme)? = Self.createMock1()

        // WHEN / THEN
        XCTAssertFalse(theme1.equals(theme2), "A nil theme and a non-nil theme should not be equal")
        XCTAssertFalse(theme2.equals(theme1), "A non-nil theme and a nil theme should not be equal")
    }

    func testOptionalThemeEquatable_BothNotNilAndSame_ShouldBeEqual() {
        // GIVEN
        let theme1: (any Theme)? = Self.createMock1()
        let theme2: (any Theme)? = Self.createMock2()

        // WHEN / THEN
        XCTAssertTrue(theme1.equals(theme2), "Two non-nil themes with identical properties should be equal")
    }

    func testOptionalThemeEquatable_BothNotNilAndDifferent_ShouldNotBeEqual() {
        // GIVEN
        let theme1: (any Theme)? = Self.createMock1()
        let theme2: (any Theme)? = Self.createDifferentMock()

        // WHEN / THEN
        XCTAssertFalse(theme1.equals(theme2), "Two non-nil themes with different properties should not be equal")
    }
}
