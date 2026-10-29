//
//  BorderEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Border Equatable Tests")
struct BorderEquatableTests {

    // MARK: - Tests

    @Test("Equatable same parameters should be equal")
    func equatableSameParametersShouldBeEqual() {
        // GIVEN
        let border1 = BorderMock.createMock1()
        let border2 = BorderMock.createMock2()

        // WHEN / THEN
        #expect(border1.equals(border2), "Two borders with identical properties should be equal")
        #expect(border1 == border2, "Two borders with identical properties should be equal using == operator")
    }

    @Test("Equatable different parameters should not be equal")
    func equatableDifferentParametersShouldNotBeEqual() {
        // GIVEN
        let border1 = BorderMock.createMock1()
        let differentBorder = BorderMock.createDifferentMock()

        // WHEN / THEN
        #expect(!(border1.equals(differentBorder)), "Two borders with different properties should not be equal")
        #expect(border1 != differentBorder, "Two borders with different properties should not be equal using == operator")
    }

    @Test("Equatable self comparison should be equal")
    func equatableSelfComparisonShouldBeEqual() {
        // GIVEN
        let border = BorderMock.createMock1()

        // WHEN / THEN
        #expect(border.equals(border), "Border should be equal to itself")
        #expect(border == border, "Border should be equal to itself using == operator")
    }

    @Test("Hashable same parameters should have same hash value")
    func hashableSameParametersShouldHaveSameHashValue() {
        // GIVEN
        let border1 = BorderMock.createMock1()
        let border2 = BorderMock.createMock2()

        // WHEN / THEN
        #expect(border1.hashValue == border2.hashValue, "Borders with identical properties should have the same hash value")
    }

    @Test("Hashable different parameters should have different hash value")
    func hashableDifferentParametersShouldHaveDifferentHashValue() {
        // GIVEN
        let border1 = BorderMock.createMock1()
        let differentBorder = BorderMock.createDifferentMock()

        // WHEN / THEN
        #expect(border1.hashValue != differentBorder.hashValue, "BorderWidths with different properties should have different hash values")
    }
}
