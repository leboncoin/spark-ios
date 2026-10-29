//
//  TextInputSpacingsTests.swift
//  SparkTextField
//
//  Created by louis.borlee on 25/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Input Spacings Tests")
struct TextInputSpacingsTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let object = TextInputSpacings()

        // THEN
        #expect(object.horizontal == 0, "Wrong horizontal value")
        #expect(object.content == 0, "Wrong content value")
    }
}
