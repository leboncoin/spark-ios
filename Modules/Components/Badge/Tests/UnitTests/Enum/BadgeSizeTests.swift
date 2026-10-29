//
//  BadgeSizeTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentBadge

@Suite("Badge Size Tests")
struct BadgeSizeTests {

    // MARK: - Tests

    @Test("Default intent is medium")
    func defaultIntentIsMedium() {
        #expect(BadgeSize.default == .medium)
    }
}
