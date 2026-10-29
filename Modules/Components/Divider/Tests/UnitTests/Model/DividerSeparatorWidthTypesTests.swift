//
//  DividerSeparatorWidthTypesTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing

@testable import SparkComponentDivider

@Suite("Divider Separator Width Types Tests")
struct DividerSeparatorWidthTypesTests {

    // MARK: - Default Values Tests

    @Test("Init default values")
    func initDefaultValues() {
        // GIVEN & WHEN
        let widthTypes = DividerSeparatorWidthTypes()

        // THEN
        #expect(
            widthTypes.first == .default,
            "Default first should be .default"
        )
        #expect(
            widthTypes.last == .default,
            "Default last should be .default"
        )
    }

    @Test("Init with custom values")
    func initWithCustomValues() {
        // GIVEN & WHEN
        let widthTypes = DividerSeparatorWidthTypes(
            first: .fixed,
            last: .dynamic
        )

        // THEN
        #expect(
            widthTypes.first == .fixed,
            "First should be .fixed"
        )
        #expect(
            widthTypes.last == .dynamic,
            "Last should be .dynamic"
        )
    }

    // MARK: - Value Method Tests

    @Test("Value for first position")
    func valueForFirstPosition() {
        // GIVEN
        let widthTypes = DividerSeparatorWidthTypes(
            first: .fixed,
            last: .dynamic
        )

        // WHEN
        let value = widthTypes.value(for: .first)

        // THEN
        #expect(
            value == .fixed,
            "Value for .first position should return first property"
        )
    }

    @Test("Value for last position")
    func valueForLastPosition() {
        // GIVEN
        let widthTypes = DividerSeparatorWidthTypes(
            first: .fixed,
            last: .dynamic
        )

        // WHEN
        let value = widthTypes.value(for: .last)

        // THEN
        #expect(
            value == .dynamic,
            "Value for .last position should return last property"
        )
    }

    // MARK: - Equatable Tests

    @Test("Equatable same instances")
    func equatableSameInstances() {
        // GIVEN
        let widthTypes1 = DividerSeparatorWidthTypes()
        let widthTypes2 = DividerSeparatorWidthTypes()

        // WHEN & THEN
        #expect(
            widthTypes1 == widthTypes2,
            "Two DividerSeparatorWidthTypes instances with same values should be equal"
        )
    }

    @Test("Equatable same custom values")
    func equatableSameCustomValues() {
        // GIVEN
        let widthTypes1 = DividerSeparatorWidthTypes(first: .fixed, last: .dynamic)
        let widthTypes2 = DividerSeparatorWidthTypes(first: .fixed, last: .dynamic)

        // WHEN & THEN
        #expect(
            widthTypes1 == widthTypes2,
            "Two DividerSeparatorWidthTypes instances with same custom values should be equal"
        )
    }

    @Test("Equatable different first values")
    func equatableDifferentFirstValues() {
        // GIVEN
        let widthTypes1 = DividerSeparatorWidthTypes(first: .fixed, last: .dynamic)
        let widthTypes2 = DividerSeparatorWidthTypes(first: .equal, last: .dynamic)

        // WHEN & THEN
        #expect(
            widthTypes1 != widthTypes2,
            "DividerSeparatorWidthTypes with different first values should not be equal"
        )
    }

    @Test("Equatable different last values")
    func equatableDifferentLastValues() {
        // GIVEN
        let widthTypes1 = DividerSeparatorWidthTypes(first: .fixed, last: .dynamic)
        let widthTypes2 = DividerSeparatorWidthTypes(first: .fixed, last: .equal)

        // WHEN & THEN
        #expect(
            widthTypes1 != widthTypes2,
            "DividerSeparatorWidthTypes with different last values should not be equal"
        )
    }
}