//
//  ProgressTrackerAccessibilityIdentifierTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 09.02.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkComponentProgressTracker
import Testing

@Suite("Progress Tracker Accessibility Identifier Tests")
struct ProgressTrackerAccessibilityIdentifierTests {

    @Test("Indicator identifier")
    func indicatorIdentifier() {
        #expect(ProgressTrackerAccessibilityIdentifier.indicator(forIndex: 99) == "spark-progress-tracker-indicator-99")
    }

    @Test("Label identifier")
    func labelIdentifier() {
        #expect(ProgressTrackerAccessibilityIdentifier.label(forIndex: 99) == "spark-progress-tracker-label-99")
    }
}
