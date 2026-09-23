//
//  ChipLayoutTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip

final class ChipLayoutTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let layout = ChipLayout()

        // THEN
        XCTAssertEqual(layout.spacing, 0)
        XCTAssertEqual(layout.extraContentSpacing, 0)
        XCTAssertEqual(layout.padding, 0)
    }

    func test_equality_when_same_values() {
        // GIVEN / WHEN
        let layout1 = ChipLayout(
            spacing: 6.0,
            extraContentSpacing: 8.0,
            padding: 12.0
        )

        let layout2 = ChipLayout(
            spacing: 6.0,
            extraContentSpacing: 8.0,
            padding: 12.0
        )

        // THEN
        XCTAssertEqual(layout1, layout2)
    }
}
