//
//  String+InitialExtensionTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 03/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar

// MARK: - Tests

struct StringInitialExtensionTests {

    // MARK: - Tests

    @Test
    func initialWithNonEmptyStringShouldReturnFirstCharacter() {
        // GIVEN
        let string = "Hello"

        // WHEN
        let result = string.initial

        // THEN
        #expect(result == "H")
    }

    @Test
    func initialWithSingleCharacterShouldReturnThatCharacter() {
        // GIVEN
        let string = "A"

        // WHEN
        let result = string.initial

        // THEN
        #expect(result == "A")
    }

    @Test
    func initialWithEmptyStringShouldReturnEmptyString() {
        // GIVEN
        let string = ""

        // WHEN
        let result = string.initial

        // THEN
        #expect(result == "?")
    }
}
