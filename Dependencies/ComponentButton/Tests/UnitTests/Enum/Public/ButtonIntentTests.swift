//
//  ButtonIntentTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import Testing

@Suite("Button Intent Tests")
struct ButtonIntentTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [ButtonIntent] = [
            .accent,
            .alert,
            .danger,
            .ai,
            .info,
            .main,
            .neutral,
            .success,
            .support,
            .surface,
            .surfaceInverse
        ]

        // WHEN / THEN
        #expect(ButtonIntent.allCases.count == expectedCases.count)
        #expect(Set(ButtonIntent.allCases) == Set(expectedCases))
    }

    @Test("Default value is main")
    func defaultValueIsMain() {
        // GIVEN / WHEN / THEN
        #expect(ButtonIntent.default == .main)
    }
}
