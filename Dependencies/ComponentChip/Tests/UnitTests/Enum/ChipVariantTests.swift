//
//  ChipVariantTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentChip

final class ChipVariantTests: XCTestCase {

    // MARK: - Tests

    func test_default_variant_is_tinted() {
        // Then
        XCTAssertEqual(ChipVariant.default, .tinted)
    }
}
