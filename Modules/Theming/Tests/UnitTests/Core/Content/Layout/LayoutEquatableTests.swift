//
//  LayoutEquatableTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Layout Equatable Tests")
struct LayoutEquatableTests {

    // MARK: - Tests

    @Test("Equatable same properties should be equal")
    func equatableSamePropertiesShouldBeEqual() {
        // GIVEN
        let layout1 = LayoutMock.createMock1()
        let layout2 = LayoutMock.createMock2()

        #expect(layout1.equals(layout2), "Two layout with identical properties should be equal")
        #expect(layout1 == layout2, "Two layout with identical properties should be equal using == operator")
    }

    @Test("Equatable different properties should not be equal")
    func equatableDifferentPropertiesShouldNotBeEqual() {
        // GIVEN
        let layout1 = LayoutMock.createMock1()
        let differentLayout = LayoutMock.createDifferentMock()

        #expect(!(layout1.equals(differentLayout)), "Two layout with different properties should not be equal")
        #expect(layout1 != differentLayout, "Two layout with different properties should not be equal using == operator")
    }

    @Test("Equatable self comparison should be equal")
    func equatableSelfComparisonShouldBeEqual() {
        // GIVEN
        let layout = LayoutMock.createMock1()

        #expect(layout.equals(layout), "Layout should be equal to itself")
        #expect(layout == layout, "Layout should be equal to itself using == operator")
    }

    @Test("Hashable same properties should have same hash value")
    func hashableSamePropertiesShouldHaveSameHashValue() {
        // GIVEN
        let layout1 = LayoutMock.createMock1()
        let layout2 = LayoutMock.createMock2()

        #expect(layout1.hashValue == layout2.hashValue, "Layout with identical properties should have the same hash value")
    }

    @Test("Hashable different properties should have different hash value")
    func hashableDifferentPropertiesShouldHaveDifferentHashValue() {
        // GIVEN
        let layout1 = LayoutMock.createMock1()
        let differentLayout = LayoutMock.createDifferentMock()

        #expect(layout1.hashValue != differentLayout.hashValue, "Layout with different properties should have different hash values")
    }
}
