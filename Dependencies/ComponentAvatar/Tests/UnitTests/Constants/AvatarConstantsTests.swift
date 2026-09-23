//
//  AvatarConstantsTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarConstantsTests {

    // MARK: - Tests

    @Test
    func animationDurationShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = AvatarConstants.animationDuration

        // THEN
        #expect(result == 0.15)
    }
}
