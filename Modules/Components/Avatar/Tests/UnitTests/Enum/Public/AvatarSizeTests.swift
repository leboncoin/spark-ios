//
//  AvatarSizeTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarSizeTests {

    // MARK: - Tests

    @Test
    func defaultShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = AvatarSize.default

        // THEN
        #expect(result == .lg)
    }

    @Test(
        arguments: [
            (AvatarSize.xs, false),
            (.sm, false),
            (.md, false),
            (.lg, false),
            (.xl, false),
            (.xxl, true),
            (.xxxl, true)
        ]
    )
    func isIconButtonShouldReturnExpectedValue(size: AvatarSize, expectedValue: Bool) {
        // GIVEN / WHEN
        let result = size.isIconButton

        // THEN
        #expect(result == expectedValue)
    }

    @Test
    func allCasesShouldContainAllExpectedValues() {
        // GIVEN / WHEN
        let result = AvatarSize.allCases

        // THEN
        #expect(result.count == 7)
        #expect(result.contains(.xs))
        #expect(result.contains(.sm))
        #expect(result.contains(.md))
        #expect(result.contains(.lg))
        #expect(result.contains(.xl))
        #expect(result.contains(.xxl))
        #expect(result.contains(.xxxl))
    }
}
