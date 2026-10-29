//
//  TextInputColorsTests.swift
//  SparkTextField
//
//  Created by Quentin.richard on 22/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkTheming

@Suite("Text Input Colors Tests")
struct TextInputColorsTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let object = TextInputColors()

        // THEN
        #expect(object.text is ColorTokenClear, "Wrong text value")
        #expect(object.placeholder is ColorTokenClear, "Wrong placeholder value")
        #expect(object.border is ColorTokenClear, "Wrong border value")
        #expect(object.background is ColorTokenClear, "Wrong background value")
    }
}
