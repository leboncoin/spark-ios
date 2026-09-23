//
//  CardConstantsTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

// MARK: - Tests

@Suite("CardConstants Tests")
struct CardConstantsTests {

    // MARK: - Tests

    @Test("Test spacing")
    func testSpacing() {
        // GIVEN / WHEN
        let spacing = CardConstants.spacing

        // THEN
        #expect(spacing == -8.0)
    }
}
