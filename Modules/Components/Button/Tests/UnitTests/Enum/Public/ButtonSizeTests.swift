//
//  ButtonSizeTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import SparkComponentSpinner
import Testing

@Suite("Button Size Tests")
struct ButtonSizeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [ButtonSize] = [.medium, .large]

        // WHEN / THEN
        #expect(ButtonSize.allCases.count == expectedCases.count)
        #expect(Set(ButtonSize.allCases) == Set(expectedCases))
    }

    @Test("Default value is medium")
    func defaultValueIsMedium() {
        // GIVEN / WHEN / THEN
        #expect(ButtonSize.default == .medium)
    }
}
