//
//  ChipBorderTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip

final class ChipBorderTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let border = ChipBorder()

        // THEN
        XCTAssertEqual(border.width, 0)
        XCTAssertEqual(border.radius, 0)
        XCTAssertEqual(border.dash, 0)
    }

    func test_equality_when_same_properties() {
        // GIVEN
        let border1 = ChipBorder(
            width: 1.5,
            radius: 10.0,
            dash: 5
        )

        let border2 = ChipBorder(
            width: 1.5,
            radius: 10.0,
            dash: 5
        )

        // THEN
         XCTAssertEqual(border1, border2)
    }
}
