//
//  SpinnerSizeTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import Testing

@Suite("Spinner Size Tests")
struct SpinnerSizeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [SpinnerSize] = [.medium, .small]

        // WHEN / THEN
        #expect(SpinnerSize.allCases.count == expectedCases.count)
        #expect(Set(SpinnerSize.allCases) == Set(expectedCases))
    }

    @Test("Default value is medium")
    func defaultValueIsMedium() {
        // GIVEN / WHEN / THEN
        #expect(SpinnerSize.default == .medium)
    }
}
