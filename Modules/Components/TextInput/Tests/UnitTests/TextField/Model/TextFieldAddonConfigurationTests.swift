//
//  TextFieldAddonConfigurationTests.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 18/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Field Addon Configuration Tests")
struct TextFieldAddonConfigurationTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let object = TextFieldAddonConfiguration()

        // THEN
        #expect(object.hasPadding == false, "Wrong hasPadding value")
        #expect(object.hasSeparator == false, "Wrong hasSeparator value")
        #expect(object.layoutPriority == 1, "Wrong layoutPriority value")
    }
}
