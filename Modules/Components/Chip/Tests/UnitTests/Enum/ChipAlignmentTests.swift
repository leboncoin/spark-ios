//
//  ChipAlignmentTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentChip

final class ChipAlignmentTests: XCTestCase {

    // MARK: - Tests

    func test_default_alignment_is_leading_icon() {
        XCTAssertEqual(ChipAlignment.default, .leadingIcon)
    }
}
