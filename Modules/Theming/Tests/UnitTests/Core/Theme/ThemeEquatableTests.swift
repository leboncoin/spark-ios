//
//  ThemeEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
import SparkTheming

@Suite("Theme Equatable Tests")
struct ThemeEquatableTests {

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

    @Test("Equatable same properties should be equal")
    func equatableSamePropertiesShouldBeEqual() {
        // GIVEN
        let theme1 = Self.createMock1()
        let theme2 = Self.createMock2()

        // WHEN / THEN
        #expect(theme1.equals(theme2), "Two themes with identical properties should be equal")
        #expect(theme1 == theme2, "Two themes with identical properties should be equal using == operator")
    }

    @Test("Equatable different properties should not be equal")
    func equatableDifferentPropertiesShouldNotBeEqual() {
        // GIVEN
        let theme1 = Self.createMock1()
        let differentTheme = Self.createDifferentMock()

        // WHEN / THEN
        #expect(!(theme1.equals(differentTheme)), "Two themes with different properties should not be equal")
        #expect(theme1 != differentTheme, "Two themes with different properties should not be equal using == operator")
    }

    @Test("Equatable self comparison should be equal")
    func equatableSelfComparisonShouldBeEqual() {
        // GIVEN
        let theme = Self.createMock1()

        // WHEN / THEN
        #expect(theme.equals(theme), "A theme should be equal to itself")
        #expect(theme == theme, "A theme should be equal to itself using == operator")
    }

    @Test("Hashable same properties should have same hash value")
    func hashableSamePropertiesShouldHaveSameHashValue() {
        // GIVEN
        let theme1 = Self.createMock1()
        let theme2 = Self.createMock2()

        // WHEN / THEN
        #expect(theme1.hashValue == theme2.hashValue, "Themes with identical properties should have the same hash value")
    }

    @Test("Hashable different properties should have different hash value")
    func hashableDifferentPropertiesShouldHaveDifferentHashValue() {
        // GIVEN
        let theme1 = Self.createMock1()
        let differentTheme = Self.createDifferentMock()

        // WHEN / THEN
        #expect(theme1.hashValue != differentTheme.hashValue, "Themes with different properties should have different hash values")
    }

    // MARK: - Optional Tests

    @Test("Optional theme equatable both nil should be equal")
    func optionalThemeEquatableBothNilShouldBeEqual() {
        // GIVEN
        let theme1: (any Theme)? = nil
        let theme2: (any Theme)? = nil

        // WHEN / THEN
        #expect(theme1.equals(theme2), "Two nil themes should be equal")
    }

    @Test("Optional theme equatable one nil one not nil should not be equal")
    func optionalThemeEquatableOneNilOneNotNilShouldNotBeEqual() {
        // GIVEN
        let theme1: (any Theme)? = nil
        let theme2: (any Theme)? = Self.createMock1()

        // WHEN / THEN
        #expect(!(theme1.equals(theme2)), "A nil theme and a non-nil theme should not be equal")
        #expect(!(theme2.equals(theme1)), "A non-nil theme and a nil theme should not be equal")
    }

    @Test("Optional theme equatable both not nil and same should be equal")
    func optionalThemeEquatableBothNotNilAndSameShouldBeEqual() {
        // GIVEN
        let theme1: (any Theme)? = Self.createMock1()
        let theme2: (any Theme)? = Self.createMock2()

        // WHEN / THEN
        #expect(theme1.equals(theme2), "Two non-nil themes with identical properties should be equal")
    }

    @Test("Optional theme equatable both not nil and different should not be equal")
    func optionalThemeEquatableBothNotNilAndDifferentShouldNotBeEqual() {
        // GIVEN
        let theme1: (any Theme)? = Self.createMock1()
        let theme2: (any Theme)? = Self.createDifferentMock()

        // WHEN / THEN
        #expect(!(theme1.equals(theme2)), "Two non-nil themes with different properties should not be equal")
    }
}
