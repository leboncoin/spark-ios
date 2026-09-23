//
//  AwarenessCardConstantsTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkComponentButton
import SparkComponentTextLink
@testable import SparkComponentCard

// MARK: - Tests

@Suite("AwarenessCardConstants Tests")
struct AwarenessCardConstantsTests {

    // MARK: - Tests

    @Test("Icon size value")
    func testIconSize() {
        // GIVEN / WHEN
        let iconSize = AwarenessCardConstants.iconSize

        // THEN
        #expect(iconSize == 24.0)
    }

    @Test("TextLink typography value")
    func testTextLinkTypography() {
        // GIVEN / WHEN
        let textLinkTypography = AwarenessCardConstants.textLinkTypography

        // THEN
        #expect(textLinkTypography == .body2)
    }
}
