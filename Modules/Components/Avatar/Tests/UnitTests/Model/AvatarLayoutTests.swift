//
//  AvatarLayoutTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 03/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarLayoutTests {

    // MARK: - Tests

    @Test
    func defaultInitializationShouldHaveExpectedValues() {
        // GIVEN / WHEN
        let layout = AvatarLayout()

        // THEN
        #expect(layout.actionPadding == .zero)
    }

    @Test
    func equalityShouldReturnTrueWhenSameValues() {
        // GIVEN
        let layout1 = AvatarLayout(
            actionPadding: 8.0
        )

        let layout2 = AvatarLayout(
            actionPadding: 8.0
        )

        // THEN
        #expect(layout1 == layout2)
    }

    @Test
    func equalityShouldReturnFalseWhenDifferentValues() {
        // GIVEN
        let layout1 = AvatarLayout(
            actionPadding: 8.0
        )

        let layout2 = AvatarLayout(
            actionPadding: 16.0
        )

        // THEN
        #expect(layout1 != layout2)
    }
}
