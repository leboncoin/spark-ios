//
//  SpinnerSizeTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import XCTest

final class SpinnerSizeTests: XCTestCase {

    // MARK: - Tests

    func test_allCases_containsExpectedCases() {
        // GIVEN
        let expectedCases: [SpinnerSize] = [.medium, .small]

        // WHEN / THEN
        XCTAssertEqual(SpinnerSize.allCases.count, expectedCases.count)
        XCTAssertEqual(Set(SpinnerSize.allCases), Set(expectedCases))
    }

    func test_defaultValue_isMedium() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SpinnerSize.default, .medium)
    }
}
