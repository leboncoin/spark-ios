//
//  TextFieldContentPaddingTests.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 19/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Field Content Padding Tests")
struct TextFieldContentPaddingTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let object = TextFieldContentPadding()

        // THEN
        #expect(object.top == 0, "Wrong top value")
        #expect(object.leading == 0, "Wrong leading value")
        #expect(object.bottom == 0, "Wrong bottom value")
        #expect(object.trailing == 0, "Wrong trailing value")
        #expect(object.inputTrailing == 0, "Wrong inputTrailing value")
    }
}
