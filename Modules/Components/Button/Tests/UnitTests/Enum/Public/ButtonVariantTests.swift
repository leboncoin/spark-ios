//
//  ButtonVariantTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import Testing

@Suite("Button Variant Tests")
struct ButtonVariantTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [ButtonVariant] = [.contrast, .filled, .ghost, .outlined, .tinted]

        // WHEN / THEN
        #expect(ButtonVariant.allCases.count == expectedCases.count)
        #expect(Set(ButtonVariant.allCases) == Set(expectedCases))
    }

    @Test("Default value is filled")
    func defaultValueIsFilled() {
        // GIVEN / WHEN / THEN
        #expect(ButtonVariant.default == .filled)
    }
}
