//
//  BadgeSizesTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentBadge

final class BadgeSizesTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let sizes = BadgeSizes()

        // THEN
        XCTAssertEqual(sizes.content, 0)
        XCTAssertEqual(sizes.border, 0)
        XCTAssertEqual(sizes.horizontalSpacing, 0)
        XCTAssertEqual(sizes.attachHorizontalSpacing, 0)
    }

    func test_equality_when_same_values() {
        // GIVEN / WHEN
        let sizes1 = BadgeSizes(
            content: 6.0,
            border: 8.0,
            horizontalSpacing: 10,
            attachHorizontalSpacing: 11
        )

        let sizes2 = BadgeSizes(
            content: 6.0,
            border: 8.0,
            horizontalSpacing: 10,
            attachHorizontalSpacing: 11
        )

        // THEN
        XCTAssertEqual(sizes1, sizes2)
    }
}
