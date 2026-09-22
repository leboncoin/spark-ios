//
//  TabSizeTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
import Testing

@Suite("Tab Size Tests")
struct TabSizeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [TabSize] = [.xSmall, .small, .medium]

        // WHEN / THEN
        #expect(TabSize.allCases.count == expectedCases.count)
        #expect(Set(TabSize.allCases) == Set(expectedCases))
    }

    @Test("Default value is medium")
    func defaultValueIsMedium() {
        // GIVEN / WHEN / THEN
        #expect(TabSize.default == .medium)
    }
}
