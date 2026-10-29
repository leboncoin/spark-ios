//
//  ElevationEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Elevation Equatable Tests")
struct ElevationEquatableTests {

    // MARK: - Tests

    @Test("Equatable same properties should be equal")
    func equatableSamePropertiesShouldBeEqual() {
        // GIVEN
        let elevation1 = ElevationMock.createMock1()
        let elevation2 = ElevationMock.createMock2()

        #expect(elevation1.equals(elevation2), "Two elevation with identical properties should be equal")
        #expect(elevation1 == elevation2, "Two elevation with identical properties should be equal using == operator")
    }

    @Test("Equatable different properties should not be equal")
    func equatableDifferentPropertiesShouldNotBeEqual() {
        // GIVEN
        let elevation1 = ElevationMock.createMock1()
        let differentElevation = ElevationMock.createDifferentMock()

        #expect(!(elevation1.equals(differentElevation)), "Two elevation with different properties should not be equal")
        #expect(elevation1 != differentElevation, "Two elevation with different properties should not be equal using == operator")
    }

    @Test("Equatable self comparison should be equal")
    func equatableSelfComparisonShouldBeEqual() {
        // GIVEN
        let elevation = ElevationMock.createMock1()

        #expect(elevation.equals(elevation), "Elevation should be equal to itself")
        #expect(elevation == elevation, "Elevation should be equal to itself using == operator")
    }

    @Test("Hashable same properties should have same hash value")
    func hashableSamePropertiesShouldHaveSameHashValue() {
        // GIVEN
        let elevation1 = ElevationMock.createMock1()
        let elevation2 = ElevationMock.createMock2()

        #expect(elevation1.hashValue == elevation2.hashValue, "Elevation with identical properties should have the same hash value")
    }

    @Test("Hashable different properties should have different hash value")
    func hashableDifferentPropertiesShouldHaveDifferentHashValue() {
        // GIVEN
        let elevation1 = ElevationMock.createMock1()
        let differentElevation = ElevationMock.createDifferentMock()

        #expect(elevation1.hashValue != differentElevation.hashValue, "Elevation with different properties should have different hash values")
    }
}
