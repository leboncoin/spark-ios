//
//  TextFieldClearModeValueTests.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 19/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Field Clear Mode Value Tests")
struct TextFieldClearModeValueTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let object = TextFieldClearModeValue()

        // THEN
        #expect(object.mode == .default, "Wrong mode value")
        #expect(object.action == nil, "Wrong action value")
    }
}
