//
//  AvatarAccessibilityIdentifierTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View should return expected value")
    func viewShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = AvatarAccessibilityIdentifier.view

        // THEN
        #expect(result == "spark-avatar-view")
    }
}
