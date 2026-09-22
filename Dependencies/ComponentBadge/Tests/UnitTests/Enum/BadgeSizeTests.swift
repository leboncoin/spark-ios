//
//  BadgeSizeTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentBadge

final class BadgeSizeTests: XCTestCase {

    // MARK: - Tests

    func test_default_intent_is_medium() {
        XCTAssertEqual(BadgeSize.default, .medium)
    }
}
