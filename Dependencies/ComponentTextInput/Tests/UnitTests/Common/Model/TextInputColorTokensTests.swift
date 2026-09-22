//
//  TextInputColorsTests.swift
//  SparkTextField
//
//  Created by Quentin.richard on 22/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkTheming

final class TextInputColorsTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let object = TextInputColors()

        // THEN
        XCTAssertTrue(object.text is ColorTokenClear, "Wrong text value")
        XCTAssertTrue(object.placeholder is ColorTokenClear, "Wrong placeholder value")
        XCTAssertTrue(object.border is ColorTokenClear, "Wrong border value")
        XCTAssertTrue(object.background is ColorTokenClear, "Wrong background value")
    }
}
