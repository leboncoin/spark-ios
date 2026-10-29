//
//  BadgeSizesTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentBadge

@MainActor
@Suite("Badge Sizes Tests")
struct BadgeSizesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let sizes = BadgeSizes()

        // THEN
        #expect(sizes.content == 0)
        #expect(sizes.border == 0)
        #expect(sizes.horizontalSpacing == 0)
        #expect(sizes.attachHorizontalSpacing == 0)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let sizes1 = BadgeSizes(
            content: 6.0,
            border: 8.0,
            horizontalSpacing: 10,
            attachHorizontalSpacing: 11
        )

        let sizes2 = BadgeSizes(
            content: 6.0,
            border: 8.0,
            horizontalSpacing: 10,
            attachHorizontalSpacing: 11
        )

        // THEN
        #expect(sizes1 == sizes2)
    }
}
