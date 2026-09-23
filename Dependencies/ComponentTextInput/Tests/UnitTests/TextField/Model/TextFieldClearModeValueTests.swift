//
//  TextFieldClearModeValueTests.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 19/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class TextFieldClearModeValueTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let object = TextFieldClearModeValue()

        // THEN
        XCTAssertEqual(object.mode, .default, "Wrong mode value")
        XCTAssertNil(object.action, "Wrong action value")
    }
}
