//
//  ScaledUIFrameTests.swift
//  SparkTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import XCTest
@testable import SparkCommon

class ScaledUIFrameTests: XCTestCase {

    // MARK: - Tests Init

    func test_init() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = ScaledUIFrame(wrappedValue: baseValue)

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    // MARK: - Test Wrapped Value

    func test_wrappedValue_setter() {
        // GIVEN
        var metric = ScaledUIFrame(wrappedValue: 16.0)

        // WHEN
        let newBaseValue: CGFloat = 20.0
        metric.wrappedValue = newBaseValue

        // THEN
        XCTAssertEqual(metric.wrappedValue, newBaseValue)
    }

    // MARK: - Tests Scale Value

    func test_scaledValue() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        var metric = ScaledUIFrame(wrappedValue: baseValue)

        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .extraSmall)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        XCTAssertLessThan(scaledValue, 16)
    }
}
