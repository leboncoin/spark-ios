//
//  ProgressBarAccessibilityIdentifierTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import Testing

@Suite("Progress Bar Accessibility Identifier Tests")
struct ProgressBarAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View identifier")
    func viewIdentifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.view

        // THEN
        #expect(identifier == "spark-progress-bar")
    }

    @Test("Content view identifier")
    func contentViewIdentifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.contentView

        // THEN
        #expect(identifier == "spark-progressBar-contentView")
    }

    @Test("Progress bar identifier")
    func progressBarIdentifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.progressBar

        // THEN
        #expect(identifier == "spark-progress-bar")
    }

    @Test("Indicator view identifier")
    func indicatorViewIdentifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.indicatorView

        // THEN
        #expect(identifier == "spark-progressBar-indicatorView")
    }

    @Test("Bottom indicator view identifier")
    func bottomIndicatorViewIdentifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.bottomIndicatorView

        // THEN
        #expect(identifier == "spark-progressBar-bottomIndicatorView")
    }
}
