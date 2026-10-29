//
//  DisplayedTextTypeTests.swift
//  SparkCoreTests
//
//  Created by robin.lemaire on 14/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) @testable import SparkCommon

@Suite("Displayed Text Type Tests")
struct DisplayedTextTypeTests {

    // MARK: - Tests

    @Test("Contains text when type is none")
    func containsTextWhenTypeIsNone() {
        // GIVEN
        let type: DisplayedTextType = .none

        // WHEN
        let containsText = type.containsText

        // THEN
        #expect(!containsText)
    }

    @Test("Contains text when type is text")
    func containsTextWhenTypeIsText() {
        // GIVEN
        let type: DisplayedTextType = .text

        // WHEN
        let containsText = type.containsText

        // THEN
        #expect(containsText)
    }

    @Test("Contains text when type is attributed text")
    func containsTextWhenTypeIsAttributedText() {
        // GIVEN
        let type: DisplayedTextType = .attributedText

        // WHEN
        let containsText = type.containsText

        // THEN
        #expect(containsText)
    }
}
