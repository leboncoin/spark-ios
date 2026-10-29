//
//  DimsEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming

@Suite("Dims Equatable Tests")
struct DimsEquatableTests {

    // MARK: - Tests

    @Test("Equatable same properties should be equal")
    func equatableSamePropertiesShouldBeEqual() {
        // GIVEN
        let dims1 = DimsMock.createMock1()
        let dims2 = DimsMock.createMock2()

        #expect(dims1.equals(dims2), "Two dims with identical properties should be equal")
        #expect(dims1 == dims2, "Two dims with identical properties should be equal using == operator")
    }

    @Test("Equatable different properties should not be equal")
    func equatableDifferentPropertiesShouldNotBeEqual() {
        // GIVEN
        let dims1 = DimsMock.createMock1()
        let differentDims = DimsMock.createDifferentMock()

        #expect(!(dims1.equals(differentDims)), "Two dims with different properties should not be equal")
        #expect(dims1 != differentDims, "Two dims with different properties should not be equal using == operator")
    }

    @Test("Equatable self comparison should be equal")
    func equatableSelfComparisonShouldBeEqual() {
        // GIVEN
        let dims = DimsMock.createMock1()

        #expect(dims.equals(dims), "Dims should be equal to itself")
        #expect(dims == dims, "Dims should be equal to itself using == operator")
    }

    @Test("Hashable same properties should have same hash value")
    func hashableSamePropertiesShouldHaveSameHashValue() {
        // GIVEN
        let dims1 = DimsMock.createMock1()
        let dims2 = DimsMock.createMock2()

        #expect(dims1.hashValue == dims2.hashValue, "Dims with identical properties should have the same hash value")
    }

    @Test("Hashable different properties should have different hash value")
    func hashableDifferentPropertiesShouldHaveDifferentHashValue() {
        // GIVEN
        let dims1 = DimsMock.createMock1()
        let differentDims = DimsMock.createDifferentMock()

        #expect(dims1.hashValue != differentDims.hashValue, "Dims with different properties should have different hash values")
    }
}
