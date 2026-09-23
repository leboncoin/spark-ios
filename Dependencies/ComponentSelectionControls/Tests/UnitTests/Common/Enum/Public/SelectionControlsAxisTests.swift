//
//  SelectionControlsAxisTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class SelectionControlsAxisTests: XCTestCase {

    // MARK: - Properties Tests

    func test_default_shouldReturnVertical() {
        // GIVEN / WHEN
        let result = SelectionControlsAxis.default

        // THEN
        XCTAssertEqual(result, .vertical)
    }
}
