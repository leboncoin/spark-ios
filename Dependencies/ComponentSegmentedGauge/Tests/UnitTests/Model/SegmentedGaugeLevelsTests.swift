//
//  SegmentedGaugeLevelsTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robot.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeLevelsTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_defaultInitializer_setsZeroValues() {
        // GIVEN / WHEN
        let levels = SegmentedGaugeLevels()

        // THEN
        XCTAssertEqual(levels.currentLevel, 0)
        XCTAssertEqual(levels.levels, 1)
    }

    // MARK: - Accessibility Label Tests

    func test_accessibilityLabel_withDefaultValues() {
        // GIVEN
        let levels = SegmentedGaugeLevels()

        // WHEN
        let accessibilityLabel = levels.accessibilityLabel

        // THEN
        XCTAssertFalse(accessibilityLabel.isEmpty)
        XCTAssertTrue(accessibilityLabel.contains("0"))
        XCTAssertTrue(accessibilityLabel.contains("1"))
    }

    func test_accessibilityLabel_withCustomValues() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        // WHEN
        let accessibilityLabel = levels.accessibilityLabel

        // THEN
        XCTAssertFalse(accessibilityLabel.isEmpty)
        XCTAssertTrue(accessibilityLabel.contains("3"))
        XCTAssertTrue(accessibilityLabel.contains("5"))
    }

    // MARK: - Display Marker Tests

    func test_displayMarker_behaviorConsistency_with_withMarker_at_true() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        // WHEN / THEN
        XCTAssertFalse(levels.displayMarker(at: 0, withMarker: true))
        XCTAssertFalse(levels.displayMarker(at: 1, withMarker: true))
        XCTAssertFalse(levels.displayMarker(at: 2, withMarker: true))
        XCTAssertTrue(levels.displayMarker(at: 3, withMarker: true))
        XCTAssertFalse(levels.displayMarker(at: 4, withMarker: true))
    }

    func test_displayMarker_behaviorConsistency_with_withMarker_at_false() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        // WHEN / THEN
        XCTAssertFalse(levels.displayMarker(at: 0, withMarker: false))
        XCTAssertFalse(levels.displayMarker(at: 1, withMarker: false))
        XCTAssertFalse(levels.displayMarker(at: 2, withMarker: false))
        XCTAssertFalse(levels.displayMarker(at: 3, withMarker: false))
        XCTAssertFalse(levels.displayMarker(at: 4, withMarker: false))
    }

    // MARK: - Is Plain Segment Tests

    func test_isPlainSegment_edgeCases() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 2, levels: 5)

        // WHEN / THEN
        XCTAssertTrue(levels.isPlainSegment(at: 0)) // Well below
        XCTAssertTrue(levels.isPlainSegment(at: 1)) // Just below
        XCTAssertTrue(levels.isPlainSegment(at: 2)) // Equal
        XCTAssertFalse(levels.isPlainSegment(at: 3)) // Just above
        XCTAssertFalse(levels.isPlainSegment(at: 4)) // Well above
        XCTAssertFalse(levels.isPlainSegment(at: 5)) // At max levels
    }

    // MARK: - Is Segment Tests

    func test_isSegment_edgeCases() {
        // GIVEN
        let levels = SegmentedGaugeLevels(currentLevel: 2, levels: 5)

        // WHEN / THEN
        XCTAssertTrue(levels.isSegment(at: 0)) // Well below
        XCTAssertTrue(levels.isSegment(at: 1)) // Just below current level
        XCTAssertTrue(levels.isSegment(at: 2)) // Equal to current level
        XCTAssertTrue(levels.isSegment(at: 3)) // Above current level but within total levels
        XCTAssertTrue(levels.isSegment(at: 4)) // Just below max levels
        XCTAssertTrue(levels.isSegment(at: 5)) // Equal to max levels
        XCTAssertFalse(levels.isSegment(at: 6)) // Above max levels
        XCTAssertFalse(levels.isSegment(at: 10)) // Well above max levels
    }

    // MARK: - Equatable Tests

    func test_equality_whenValuesMatch() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLevels(currentLevel: 2, levels: 5)
        let rhs = SegmentedGaugeLevels(currentLevel: 2, levels: 5)

        XCTAssertEqual(lhs, rhs)
    }

    func test_inequality_whenCurrentLevelDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLevels(currentLevel: 2, levels: 5)
        let rhs = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenLevelsDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLevels(currentLevel: 3, levels: 5)
        let rhs = SegmentedGaugeLevels(currentLevel: 3, levels: 4)

        XCTAssertNotEqual(lhs, rhs)
    }
}
