//
//  PopoverIntentTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by louis.borlee on 26/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentPopover

@Suite("Popover Intent Tests")
struct PopoverIntentTests {

    // MARK: - Cases Tests

    @Test("All cases count")
    func allCasesCount() {
        // THEN
        #expect(PopoverIntent.allCases.count == 2, "Wrong allCases count")
    }

    @Test("All cases contains all non deprecated cases")
    func allCasesContainsAllNonDeprecatedCases() {
        // THEN
        #expect(PopoverIntent.allCases.contains(.info), "allCases should contain .info")
        #expect(PopoverIntent.allCases.contains(.surface), "allCases should contain .surface")
    }

    @Test("All cases does not contain deprecated cases")
    func allCasesDoesNotContainDeprecatedCases() {
        // THEN
        #expect(!PopoverIntent.allCases.contains(.neutral), "allCases should not contain .neutral (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.accent), "allCases should not contain .accent (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.main), "allCases should not contain .main (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.support), "allCases should not contain .support (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.success), "allCases should not contain .success (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.alert), "allCases should not contain .alert (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.error), "allCases should not contain .error (deprecated)")
    }

    // MARK: - Default Tests

    @Test("Default should return surface")
    func defaultShouldReturnSurface() {
        #expect(PopoverIntent.default == .surface)
    }
}
