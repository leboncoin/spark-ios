//
//  ProgressBarAccessibilityIdentifierTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import XCTest

final class ProgressBarAccessibilityIdentifierTests: XCTestCase {

    // MARK: - Tests

    func test_view_identifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.view

        // THEN
        XCTAssertEqual(identifier, "spark-progress-bar")
    }

    func test_contentView_identifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.contentView

        // THEN
        XCTAssertEqual(identifier, "spark-progressBar-contentView")
    }

    func test_progressBar_identifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.progressBar

        // THEN
        XCTAssertEqual(identifier, "spark-progress-bar")
    }

    func test_indicatorView_identifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.indicatorView

        // THEN
        XCTAssertEqual(identifier, "spark-progressBar-indicatorView")
    }

    func test_bottomIndicatorView_identifier() {
        // GIVEN / WHEN
        let identifier = ProgressBarAccessibilityIdentifier.bottomIndicatorView

        // THEN
        XCTAssertEqual(identifier, "spark-progressBar-bottomIndicatorView")
    }
}
