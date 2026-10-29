//
//  CaseIterable+RandomExtensionTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) @testable import SparkCommonTesting

@Suite("Case Iterable Random Extension Tests")
struct CaseIterableRandomExtensionTests {

    // MARK: - Enum

    private enum TestEnum: CaseIterable, Equatable {
        case first
        case second
        case third
        case fourth
    }

    // MARK: - Tests

    @Test("Other random returns different value")
    func otherRandomReturnsDifferentValue() {
        // GIVEN
        let originalValue = TestEnum.first

        // WHEN
        let otherValue = originalValue.otherRandom

        // THEN
        #expect(originalValue != otherValue)
        #expect(TestEnum.allCases.contains(otherValue))
    }

    @Test("Other random multiple calls return valid values")
    func otherRandomMultipleCallsReturnValidValues() {
        // GIVEN
        let originalValue = TestEnum.second

        // WHEN & THEN
        for _ in 0..<100 {
            let otherValue = originalValue.otherRandom
            #expect(originalValue != otherValue)
            #expect(TestEnum.allCases.contains(otherValue))
        }
    }

    @Test("Other random with all enum cases")
    func otherRandomWithAllEnumCases() {
        // GIVEN & WHEN & THEN
        for enumCase in TestEnum.allCases {
            let otherValue = enumCase.otherRandom
            #expect(enumCase != otherValue)
            #expect(TestEnum.allCases.contains(otherValue))
        }
    }
}
