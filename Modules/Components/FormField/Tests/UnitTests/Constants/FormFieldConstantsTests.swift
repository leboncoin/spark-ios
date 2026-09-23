//
//  FormFieldConstantsTests.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 07/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentFormField

final class FormFieldConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_iconSize() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(
            FormFieldConstants.iconSize,
            18
        )
    }

    func test_defaultTitle() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(
            FormFieldConstants.defaultTitle,
            String(localized: "clear", bundle: .current)
        )
    }
}
