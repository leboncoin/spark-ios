//
//  SpinnerAccessibilityIdentifierTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import XCTest

final class SpinnerAccessibilityIdentifierTests: XCTestCase {

    // MARK: - Tests

    func test_view_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SpinnerAccessibilityIdentifier.view, "spark-spinner")
    }

    func test_spinner_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SpinnerAccessibilityIdentifier.spinner, "spark-spinner")
    }
}
