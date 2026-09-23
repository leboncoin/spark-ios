//
//  AvatarSizesTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkComponentBadge
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarSizesTests {

    // MARK: - Tests

    @Test
    func defaultInitializationShouldHaveExpectedValues() {
        // GIVEN / WHEN
        let sizes = AvatarSizes()

        // THEN
        #expect(sizes.size == .zero)
        #expect(sizes.placeholderSize == .zero)
        #expect(sizes.actionSize == .zero)
        #expect(sizes.badgeSize == .default)
    }

    @Test
    func equalityShouldReturnTrueWhenSameValues() {
        // GIVEN
        let sizes1 = AvatarSizes(
            size: 56.0,
            placeholderSize: 48.0,
            actionSize: 32.0,
            badgeSize: .medium
        )

        let sizes2 = AvatarSizes(
            size: 56.0,
            placeholderSize: 48.0,
            actionSize: 32.0,
            badgeSize: .medium
        )

        // THEN
        #expect(sizes1 == sizes2)
    }

    @Test
    func equalityShouldReturnFalseWhenDifferentValues() {
        // GIVEN
        let sizes1 = AvatarSizes(
            size: 56.0,
            placeholderSize: 48.0,
            actionSize: 32.0,
            badgeSize: .medium
        )

        let sizes2 = AvatarSizes(
            size: 64.0,
            placeholderSize: 56.0,
            actionSize: 0.0,
            badgeSize: .small
        )

        // THEN
        #expect(sizes1 != sizes2)
    }
}
