//
//  DividerSeparatorWidthTypeTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing

@testable import SparkComponentDivider

@Suite("Divider Separator Width Type Tests")
struct DividerSeparatorWidthTypeTests {

    // MARK: - Tests

    @Test("Default")
    func defaultValue() {
        // GIVEN & WHEN
        let defaultWidthType = DividerSeparatorWidthType.default

        // THEN
        #expect(defaultWidthType == .equal, "DividerSeparatorWidthType.default should be .equal")
    }

    // MARK: - IsEqual Tests

    @Test("Is equal when equal")
    func isEqualWhenEqual() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.equal

        // WHEN
        let isEqual = widthType.isEqual

        // THEN
        #expect(isEqual, "DividerSeparatorWidthType.equal.isEqual should be true")
    }

    @Test("Is equal when fixed")
    func isEqualWhenFixed() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.fixed

        // WHEN
        let isEqual = widthType.isEqual

        // THEN
        #expect(!isEqual, "DividerSeparatorWidthType.fixed.isEqual should be false")
    }

    @Test("Is equal when dynamic")
    func isEqualWhenDynamic() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.dynamic

        // WHEN
        let isEqual = widthType.isEqual

        // THEN
        #expect(!isEqual, "DividerSeparatorWidthType.dynamic.isEqual should be false")
    }

    // MARK: - IsFixed Tests

    @Test("Is fixed when fixed")
    func isFixedWhenFixed() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.fixed

        // WHEN
        let isFixed = widthType.isFixed

        // THEN
        #expect(isFixed, "DividerSeparatorWidthType.fixed.isFixed should be true")
    }

    @Test("Is fixed when equal")
    func isFixedWhenEqual() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.equal

        // WHEN
        let isFixed = widthType.isFixed

        // THEN
        #expect(!isFixed, "DividerSeparatorWidthType.equal.isFixed should be false")
    }

    @Test("Is fixed when dynamic")
    func isFixedWhenDynamic() {
        // GIVEN
        let widthType = DividerSeparatorWidthType.dynamic

        // WHEN
        let isFixed = widthType.isFixed

        // THEN
        #expect(!isFixed, "DividerSeparatorWidthType.dynamic.isFixed should be false")
    }
}
