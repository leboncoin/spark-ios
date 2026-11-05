//
//  SliderIntentTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
import Testing

@Suite("Slider Intent Tests")
struct SliderIntentTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [SliderIntent] = [.accent, .main, .support]

        // WHEN / THEN
        #expect(SliderIntent.allCases.count == expectedCases.count)
        #expect(Set(SliderIntent.allCases) == Set(expectedCases))
    }

    @Test("Default value is main")
    func defaultValueIsMain() {
        // GIVEN / WHEN / THEN
        #expect(SliderIntent.default == .support)
    }

    @Test("All cases does not contain deprecated cases")
    func allCasesDoesNotContainDeprecatedCases() {
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
            #expect(!SliderIntent.allCases.contains(deprecatedCase))
        }
    }
}
