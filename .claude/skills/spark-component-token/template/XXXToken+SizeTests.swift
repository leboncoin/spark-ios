//
//  XXXToken+SizeTests.swift
//  SparkComponentXXXTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentXXX

struct XXXTokenSizeTests {

    // MARK: - Tests

    @Test
    func mediumHeight_constant() {
        // GIVEN / WHEN
        let size = XXXToken.Size()

        // THEN
        #expect(size.mediumHeight == 32)
    }

    @Test
    func largeHeight_constant() {
        // GIVEN / WHEN
        let size = XXXToken.Size()

        // THEN
        #expect(size.largeHeight == 40)
    }

    @Test
    func iconSize_constant() {
        // GIVEN / WHEN
        let size = XXXToken.Size()

        // THEN
        #expect(size.iconSize == 16)
    }

    @Test
    func equatable_returns_true_when_sizes_are_equal() {
        // GIVEN
        let size1 = XXXToken.Size()
        let size2 = XXXToken.Size()

        // WHEN / THEN
        #expect(size1 == size2)
    }
}
