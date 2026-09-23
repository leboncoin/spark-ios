//
//  TextInputSpacingsTests.swift
//  SparkTextField
//
//  Created by louis.borlee on 25/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class TextInputSpacingsTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let object = TextInputSpacings()

        // THEN
        XCTAssertEqual(object.horizontal, 0, "Wrong horizontal value")
        XCTAssertEqual(object.content, 0, "Wrong content value")
    }
}
