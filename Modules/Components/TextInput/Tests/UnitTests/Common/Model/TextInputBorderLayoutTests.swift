//
//  TextInputBorderLayoutTests.swift
//  SparkTextField
//
//  Created by louis.borlee on 25/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Input Border Layout Tests")
struct TextInputBorderLayoutTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let object = TextInputBorderLayout()

        // THEN
        #expect(object.radius == 0, "Wrong radius value")
        #expect(object.width == 0, "Wrong width value")
    }
}
