//
//  SegmentedGaugeLevelsTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robot.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Levels Tests")
struct SegmentedGaugeLevelsTests {

    // MARK: - Default Values Tests

    @Test("Default initializer sets zero values")
    func defaultInitializerSetsZeroValues() {
        // GIVEN / WHEN
        let levels = SegmentedGaugeLevels()

        // THEN
        #expect(levels.currentLevel == 0)
        #expect(levels.levels == 1)
    }

    // MARK: - Accessibility Label Tests

    @Test("Accessibility label with default values")
    func accessibilityLabelWithDefaultValues() {
        // GIVEN
        let levels = SegmentedGaugeLevels()

        // WHEN
        let accessibilityLabel = levels.accessibilityLabel

        // THEN
        #expect(!accessibilityLabel.isEmpty)
        #expect(accessibilityLabel.contains("0"))
        #expect(accessibilityLabel.contains("1"))
    }

    @Test("Accessibility label with custom values")
    func accessibilityLabelWithCustomValues() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        // WHEN
        let accessibilityLabel = levels.accessibilityLabel

        // THEN
        #expect(!accessibilityLabel.isEmpty)
        #expect(accessibilityLabel.contains("3"))
        #expect(accessibilityLabel.contains("5"))
    }

    // MARK: - Display Marker Tests

    @Test("Display marker behavior consistency with with marker at true")
    func displayMarkerBehaviorConsistencyWithWithMarkerAtTrue() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        // WHEN / THEN
        #expect(!levels.displayMarker(at: 0, withMarker: true))
        #expect(!levels.displayMarker(at: 1, withMarker: true))
        #expect(!levels.displayMarker(at: 2, withMarker: true))
        #expect(levels.displayMarker(at: 3, withMarker: true))
        #expect(!levels.displayMarker(at: 4, withMarker: true))
    }

    @Test("Display marker behavior consistency with with marker at false")
    func displayMarkerBehaviorConsistencyWithWithMarkerAtFalse() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        // WHEN / THEN
        #expect(!levels.displayMarker(at: 0, withMarker: false))
        #expect(!levels.displayMarker(at: 1, withMarker: false))
        #expect(!levels.displayMarker(at: 2, withMarker: false))
        #expect(!levels.displayMarker(at: 3, withMarker: false))
        #expect(!levels.displayMarker(at: 4, withMarker: false))
    }

    // MARK: - Is Plain Segment Tests

    @Test("Is plain segment edge cases")
    func isPlainSegmentEdgeCases() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 2, levels: 5)

        // WHEN / THEN
        #expect(levels.isPlainSegment(at: 0)) // Well below
        #expect(levels.isPlainSegment(at: 1)) // Just below
        #expect(levels.isPlainSegment(at: 2)) // Equal
        #expect(!levels.isPlainSegment(at: 3)) // Just above
        #expect(!levels.isPlainSegment(at: 4)) // Well above
        #expect(!levels.isPlainSegment(at: 5)) // At max levels
    }

    // MARK: - Is Segment Tests

    @Test("Is segment edge cases")
    func isSegmentEdgeCases() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 2, levels: 5)

        // WHEN / THEN
        #expect(levels.isSegment(at: 0)) // Well below
        #expect(levels.isSegment(at: 1)) // Just below current level
        #expect(levels.isSegment(at: 2)) // Equal to current level
        #expect(levels.isSegment(at: 3)) // Above current level but within total levels
        #expect(levels.isSegment(at: 4)) // Just below max levels
        #expect(levels.isSegment(at: 5)) // Equal to max levels
        #expect(!levels.isSegment(at: 6)) // Above max levels
        #expect(!levels.isSegment(at: 10)) // Well above max levels
    }

    // MARK: - Equatable Tests

    @Test("Equality when values match")
    func equalityWhenValuesMatch() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLevels(currentLevel: 2, levels: 5)
        let rhs = SegmentedGaugeLevels(currentLevel: 2, levels: 5)

        #expect(lhs == rhs)
    }

    @Test("Inequality when current level differs")
    func inequalityWhenCurrentLevelDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLevels(currentLevel: 2, levels: 5)
        let rhs = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        #expect(lhs != rhs)
    }

    @Test("Inequality when levels differs")
    func inequalityWhenLevelsDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLevels(currentLevel: 3, levels: 5)
        let rhs = SegmentedGaugeLevels(currentLevel: 3, levels: 4)

        #expect(lhs != rhs)
    }
}
