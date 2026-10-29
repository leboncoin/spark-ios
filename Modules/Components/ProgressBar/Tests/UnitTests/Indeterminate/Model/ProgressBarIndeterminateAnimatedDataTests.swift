//
//  ProgressBarIndeterminateAnimatedDataTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import Foundation
import Testing

@Suite("Progress Bar Indeterminate Animated Data Tests")
struct ProgressBarIndeterminateAnimatedDataTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let animatedData = ProgressBarIndeterminateAnimatedData()

        // THEN
        #expect(animatedData.leadingSpaceWidth == .zero)
        #expect(animatedData.indicatorWidth == .zero)
    }

    @Test("Property modification")
    func propertyModification() {
        // GIVEN
        var animatedData = ProgressBarIndeterminateAnimatedData()

        // WHEN
        animatedData.leadingSpaceWidth = 100.0
        animatedData.indicatorWidth = 50.0

        // THEN
        #expect(animatedData.leadingSpaceWidth == 100.0)
        #expect(animatedData.indicatorWidth == 50.0)
    }

    @Test("Custom initialization")
    func customInitialization() {
        // GIVEN / WHEN
        let animatedData = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 75.5,
            indicatorWidth: 25.2
        )

        // THEN
        #expect(animatedData.leadingSpaceWidth == 75.5)
        #expect(animatedData.indicatorWidth == 25.2)
    }

    @Test("Equatable conformance when equal")
    func equatableConformanceWhenEqual() {
        // GIVEN
        let animatedData1 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 50.0
        )
        let animatedData2 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 50.0
        )

        // WHEN / THEN
        #expect(animatedData1 == animatedData2)
    }

    @Test("Equatable conformance when not equal leading space width")
    func equatableConformanceWhenNotEqualLeadingSpaceWidth() {
        // GIVEN
        let animatedData1 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 50.0
        )
        let animatedData2 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 90.0,
            indicatorWidth: 50.0
        )

        // WHEN / THEN
        #expect(animatedData1 != animatedData2)
    }

    @Test("Equatable conformance when not equal indicator width")
    func equatableConformanceWhenNotEqualIndicatorWidth() {
        // GIVEN
        let animatedData1 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 50.0
        )
        let animatedData2 = ProgressBarIndeterminateAnimatedData(
            leadingSpaceWidth: 100.0,
            indicatorWidth: 40.0
        )

        // WHEN / THEN
        #expect(animatedData1 != animatedData2)
    }
}
