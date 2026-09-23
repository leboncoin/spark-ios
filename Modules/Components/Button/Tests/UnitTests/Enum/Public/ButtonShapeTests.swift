//
//  ButtonShapeTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import Testing

@Suite("Button Shape Tests")
struct ButtonShapeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [ButtonShape] = [.pill, .rounded]

        // WHEN / THEN
        #expect(ButtonShape.allCases.count == expectedCases.count)
        #expect(Set(ButtonShape.allCases) == Set(expectedCases))
    }

    @Test("Default value is rounded")
    func defaultValueIsRounded() {
        // GIVEN / WHEN / THEN
        #expect(ButtonShape.default == .rounded)
    }
}
