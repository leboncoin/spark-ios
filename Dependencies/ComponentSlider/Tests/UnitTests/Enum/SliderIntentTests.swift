//
//  SliderIntentTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
import XCTest

final class SliderIntentTests: XCTestCase {

    // MARK: - Tests

    func test_allCases_containsExpectedCases() {
        // GIVEN
        let expectedCases: [SliderIntent] = [.accent, .main, .support]

        // WHEN / THEN
        XCTAssertEqual(SliderIntent.allCases.count, expectedCases.count)
        XCTAssertEqual(Set(SliderIntent.allCases), Set(expectedCases))
    }

    func test_defaultValue_isMain() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SliderIntent.default, .support)
    }

    func test_allCases_doesNotContainDeprecatedCases() {
        // GIVEN
        let deprecatedCases: [SliderIntent] = [
            .alert,
            .error,
            .info,
            .neutral,
            .success
        ]

        // WHEN / THEN
        for deprecatedCase in deprecatedCases {
            XCTAssertFalse(SliderIntent.allCases.contains(deprecatedCase))
        }
    }
}
