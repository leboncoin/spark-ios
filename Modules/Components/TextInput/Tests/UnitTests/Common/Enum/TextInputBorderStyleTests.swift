//
//  TextInputBorderStyleTests.swift
//  SparkComponentTextInputUnitTests
//
//  Created by Robin Lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Input Border Style Tests")
struct TextInputBorderStyleTests {

    // MARK: - Tests

    @Test("Default")
    func defaultValue() {
        // GIVEN / WHEN / THEN
        #expect(TextInputBorderStyle.default == .roundedRect)
    }
}
