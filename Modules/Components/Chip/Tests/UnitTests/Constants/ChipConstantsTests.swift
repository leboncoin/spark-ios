//
//  ChipConstantsTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentChip

final class ChipConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_iconSize_constant() {
        // Then
        XCTAssertEqual(ChipConstants.iconSize, 16)
    }

    func test_height_constant() {
        // Then
        XCTAssertEqual(ChipConstants.height, 32)
    }

    func test_borderWidth_constant() {
        // Then
        XCTAssertEqual(ChipConstants.borderWidth, 1)
    }

    func test_dashLength_constant() {
        // Then
        XCTAssertEqual(ChipConstants.dashLength, 2)
    }
}
