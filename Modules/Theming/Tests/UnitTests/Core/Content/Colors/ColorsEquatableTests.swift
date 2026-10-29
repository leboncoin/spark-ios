//
//  ColorsEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Colors Equatable Tests")
struct ColorsEquatableTests {

    // MARK: - Tests

    @Test("Equatable same parameters should be equal")
    func equatableSameParametersShouldBeEqual() {
        // GIVEN
        let colors1 = ColorsMock.createMock1()
        let colors2 = ColorsMock.createMock2()

        // WHEN / THEN
        #expect(colors1.equals(colors2), "Two colors with identical properties should be equal")
        #expect(colors1 == colors2, "Two colors with identical properties should be equal using == operator")
    }

    @Test("Equatable different parameters should not be equal")
    func equatableDifferentParametersShouldNotBeEqual() {
        // GIVEN
        let colors1 = ColorsMock.createMock1()
        let differentColors = ColorsMock.createDifferentMock()

        // WHEN / THEN
        #expect(!(colors1.equals(differentColors)), "Two colors with different properties should not be equal")
        #expect(colors1 != differentColors, "Two colors with different properties should not be equal using == operator")
    }

    @Test("Equatable self comparison should be equal")
    func equatableSelfComparisonShouldBeEqual() {
        // GIVEN
        let colors = ColorsMock.createMock1()

        // WHEN / THEN
        #expect(colors.equals(colors), "Colors should be equal to itself")
        #expect(colors == colors, "Colors should be equal to itself using == operator")
    }

    @Test("Hashable same parameters should have same hash value")
    func hashableSameParametersShouldHaveSameHashValue() {
        // GIVEN
        let colors1 = ColorsMock.createMock1()
        let colors2 = ColorsMock.createMock2()

        // WHEN / THEN
        #expect(colors1.hashValue == colors2.hashValue, "Colorss with identical properties should have the same hash value")
    }

    @Test("Hashable different parameters should have different hash value")
    func hashableDifferentParametersShouldHaveDifferentHashValue() {
        // GIVEN
        let colors1 = ColorsMock.createMock1()
        let differentColors = ColorsMock.createDifferentMock()

        // WHEN / THEN
        #expect(colors1.hashValue != differentColors.hashValue, "ColorsWidths with different properties should have different hash values")
    }
}
