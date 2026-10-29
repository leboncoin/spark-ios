//
//  SelectionControlsIntentTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Selection Controls Intent Tests")
struct SelectionControlsIntentTests {

    // MARK: - Properties Tests

    @Test("Default should return support")
    func defaultShouldReturnSupport() {
        // GIVEN / WHEN
        let result = SelectionControlsIntent.default

        // THEN
        #expect(result == .support)
    }
}
