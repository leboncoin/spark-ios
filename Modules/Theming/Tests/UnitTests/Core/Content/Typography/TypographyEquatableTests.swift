//
//  TypographyEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Typography Equatable Tests")
struct TypographyEquatableTests {

    // MARK: - Tests

    @Test("Equatable same properties should be equal")
    func equatableSamePropertiesShouldBeEqual() {
        let typography1 = TypographyMock.createMock1()
        let typography2 = TypographyMock.createMock2()

        // WHEN / THEN
        #expect(typography1.equals(typography2), "Two typography with identical properties should be equal")
        #expect(typography1 == typography2, "Two typography with identical properties should be equal using == operator")
    }

    @Test("Equatable different properties should not be equal")
    func equatableDifferentPropertiesShouldNotBeEqual() {
        let typography1 = TypographyMock.createMock1()
        let differentTypography = TypographyMock.createDifferentMock()

        // WHEN / THEN
        #expect(!(typography1.equals(differentTypography)), "Two typography with different properties should not be equal")
        #expect(typography1 != differentTypography, "Two typography with different properties should not be equal using == operator")
    }

    @Test("Equatable self comparison should be equal")
    func equatableSelfComparisonShouldBeEqual() {
        let typography = TypographyMock.createMock1()

        // WHEN / THEN
        #expect(typography.equals(typography), "Typography should be equal to itself")
        #expect(typography == typography, "Typography should be equal to itself using == operator")
    }

    @Test("Hashable same properties should have same hash value")
    func hashableSamePropertiesShouldHaveSameHashValue() {
        let typography1 = TypographyMock.createMock1()
        let typography2 = TypographyMock.createMock2()

        // WHEN / THEN
        #expect(typography1.hashValue == typography2.hashValue, "Typography with identical properties should have the same hash value")
    }

    @Test("Hashable different properties should have different hash value")
    func hashableDifferentPropertiesShouldHaveDifferentHashValue() {
        let typography1 = TypographyMock.createMock1()
        let differentTypography = TypographyMock.createDifferentMock()

        // WHEN / THEN
        #expect(typography1.hashValue != differentTypography.hashValue, "Typography with different properties should have different hash values")
    }
}
