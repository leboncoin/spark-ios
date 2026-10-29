//
//  BadgeIntentTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentBadge

@Suite("Badge Intent Tests")
struct BadgeIntentTests {

    // MARK: - Tests

    @Test("Default intent is danger")
    func defaultIntentIsDanger() {
        #expect(BadgeIntent.default == .danger)
    }
}
