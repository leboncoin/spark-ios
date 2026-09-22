//
//  TextInputBorderLayoutTests.swift
//  SparkTextField
//
//  Created by louis.borlee on 25/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class TextInputBorderLayoutTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let object = TextInputBorderLayout()

        // THEN
        XCTAssertEqual(object.radius, 0, "Wrong radius value")
        XCTAssertEqual(object.width, 0, "Wrong width value")
    }
}
