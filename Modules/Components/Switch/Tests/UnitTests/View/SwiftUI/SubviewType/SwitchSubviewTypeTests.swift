//
//  SwitchSubviewTypeTests.swift
//  SparkComponentSwitchTests
//
//  Created by robin.lemaire on 14/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSwitch

@Suite("Switch Subview Type Tests")
struct SwitchSubviewTypeTests {

    // MARK: - Tests

    @Test("All cases when is left alignment is true and show space is false")
    func allCasesWhenIsLeftAlignmentIsTrueAndShowSpaceIsFalse() {
        // GIVEN / WHEN
        let allCases = SwitchSubviewType.allCases(
            isLeftAlignment: true,
            showSpace: false
        )

        // THEN
        #expect(
            allCases == [.toggle, .text]
        )
    }

    @Test("All cases when is left alignment is true and show space is true")
    func allCasesWhenIsLeftAlignmentIsTrueAndShowSpaceIsTrue() {
        // GIVEN / WHEN
        let allCases = SwitchSubviewType.allCases(
            isLeftAlignment: true,
            showSpace: true
        )

        // THEN
        #expect(
            allCases == [.toggle, .space, .text]
        )
    }

    @Test("All cases when is left alignment is false and show space is false")
    func allCasesWhenIsLeftAlignmentIsFalseAndShowSpaceIsFalse() {
        // GIVEN / WHEN
        let allCases = SwitchSubviewType.allCases(
            isLeftAlignment: false,
            showSpace: false
        )

        // THEN
        #expect(
            allCases == [.text, .toggle]
        )
    }

    @Test("All cases when is left alignment is false and show space is true")
    func allCasesWhenIsLeftAlignmentIsFalseAndShowSpaceIsTrue() {
        // GIVEN / WHEN
        let allCases = SwitchSubviewType.allCases(
            isLeftAlignment: false,
            showSpace: true
        )

        // THEN
        #expect(
            allCases == [.text, .space, .toggle]
        )
    }
}
