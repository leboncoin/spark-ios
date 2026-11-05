//
//  ProgressBarIndeterminateConstantsTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import Testing

@Suite("Progress Bar Indeterminate Constants Tests")
struct ProgressBarIndeterminateConstantsTests {

    // MARK: - Animation Tests

    @Test("Animation duration value")
    func animationDurationValue() {
        // GIVEN / WHEN
        let duration = ProgressBarIndeterminateConstants.Animation.duration

        // THEN
        #expect(duration == 0.4)
    }

    @Test("Animation max width ratio value")
    func animationMaxWidthRatioValue() {
        // GIVEN / WHEN
        let maxWidthRatio = ProgressBarIndeterminateConstants.Animation.maxWidthRatio

        // THEN
        #expect(maxWidthRatio == 0.5)
    }
}
