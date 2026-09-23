//
//  AvatarBorderTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarBorderTests {

    // MARK: - Tests

    @Test
    func defaultInitializationShouldHaveExpectedValues() {
        // GIVEN / WHEN
        let border = AvatarBorder()

        // THEN
        #expect(border.radius == .zero)
        #expect(border.width == .zero)
    }

    @Test
    func equalityShouldReturnTrueWhenSameValues() {
        // GIVEN
        let border1 = AvatarBorder(
            radius: 10.0,
            width: 2.0
        )

        let border2 = AvatarBorder(
            radius: 10.0,
            width: 2.0
        )

        // THEN
        #expect(border1 == border2)
    }

    @Test
    func equalityShouldReturnFalseWhenDifferentValues() {
        // GIVEN
        let border1 = AvatarBorder(
            radius: 10.0,
            width: 2.0
        )

        let border2 = AvatarBorder(
            radius: 15.0,
            width: 3.0
        )

        // THEN
        #expect(border1 != border2)
    }
}
