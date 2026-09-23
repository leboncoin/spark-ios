//
//  TabIntentTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
import Testing

@Suite("Tab Intent Tests")
struct TabIntentTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [TabIntent] = [.main, .support]

        // WHEN / THEN
        #expect(TabIntent.allCases.count == expectedCases.count)
        #expect(Set(TabIntent.allCases) == Set(expectedCases))
    }

    @Test("Default value is support")
    func defaultValueIsSupport() {
        // GIVEN / WHEN / THEN
        #expect(TabIntent.default == .support)
    }
}
