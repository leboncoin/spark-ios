//
//  TextLinkConstantsTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextLink

@Suite("Text Link Constants Tests")
struct TextLinkConstantsTests {

    // MARK: - Tests

    @Test("Animation duration value")
    func animationDurationValue() {
        // GIVEN / WHEN
        let animationDuration = TextLinkConstants.animationDuration

        // THEN
        #expect(animationDuration == 0.2, "Animation duration should be 0.2 seconds (200ms)")
    }
}
