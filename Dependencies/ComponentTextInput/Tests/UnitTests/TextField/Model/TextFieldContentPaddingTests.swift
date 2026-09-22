//
//  TextFieldContentPaddingTests.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 19/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class TextFieldContentPaddingTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let object = TextFieldContentPadding()

        // THEN
        XCTAssertEqual(object.top, 0, "Wrong top value")
        XCTAssertEqual(object.leading, 0, "Wrong leading value")
        XCTAssertEqual(object.bottom, 0, "Wrong bottom value")
        XCTAssertEqual(object.trailing, 0, "Wrong trailing value")
        XCTAssertEqual(object.inputTrailing, 0, "Wrong inputTrailing value")
    }
}
