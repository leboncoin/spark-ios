//
//  SpinnerConstantsTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import XCTest

final class SpinnerConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_stroke_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SpinnerConstants.strokeWidth, 2.0)
    }

    func test_animationDuration_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SpinnerConstants.animationDuration, 1.0)
    }
}
