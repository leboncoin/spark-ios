//
//  TextFieldAddonConfigurationTests.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 18/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class TextFieldAddonConfigurationTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let object = TextFieldAddonConfiguration()

        // THEN
        XCTAssertEqual(object.hasPadding, false, "Wrong hasPadding value")
        XCTAssertEqual(object.hasSeparator, false, "Wrong hasSeparator value")
        XCTAssertEqual(object.layoutPriority, 1, "Wrong layoutPriority value")
    }
}
