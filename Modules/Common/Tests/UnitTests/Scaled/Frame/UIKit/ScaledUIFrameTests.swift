//
//  ScaledUIFrameTests.swift
//  SparkTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import UIKit
import Testing
@testable import SparkCommon

@MainActor
@Suite("Scaled UI Frame Tests")
struct ScaledUIFrameTests {

    // MARK: - Tests Init

    @Test("Init")
    func initialization() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = ScaledUIFrame(wrappedValue: baseValue)

        // THEN
        #expect(metric.wrappedValue == baseValue)
    }

    // MARK: - Test Wrapped Value

    @Test("Wrapped value setter")
    func wrappedValueSetter() {
        // GIVEN
        var metric = ScaledUIFrame(wrappedValue: 16.0)

        // WHEN
        let newBaseValue: CGFloat = 20.0
        metric.wrappedValue = newBaseValue

        // THEN
        #expect(metric.wrappedValue == newBaseValue)
    }

    // MARK: - Tests Scale Value

    @Test("Scaled value")
    func scaledValue() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        var metric = ScaledUIFrame(wrappedValue: baseValue)

        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .extraSmall)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        #expect(scaledValue < 16)
    }
}
