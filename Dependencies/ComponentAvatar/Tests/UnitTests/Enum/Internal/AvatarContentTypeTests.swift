//
//  AvatarContentTypeTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarContentTypeTests {

    // MARK: - Tests

    @Test
    func allCasesShouldContainAllExpectedValues() {
        // GIVEN / WHEN
        let result = AvatarContentType.allCases

        // THEN
        #expect(result.count == 2)
        #expect(result.contains(.company))
        #expect(result.contains(.user))
    }
}
