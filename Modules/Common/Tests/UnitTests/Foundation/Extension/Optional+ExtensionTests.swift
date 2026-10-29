//
//  Optional+ExtensionTests.swift
//  SparkCore
//
//  Created by robin.lemaire on 24/01/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) @testable import SparkCommon

@Suite("Optional Extension Tests")
struct OptionalExtensionTests {

    // MARK: - String Tests

    @Test("Nil string")
    func nilString() {
        // GIVEN
        let string: String? = nil

        // WHEN
        let isEmptyOrNil = string.isEmptyOrNil

        // THEN
        #expect(isEmptyOrNil)
    }

    @Test("Empty string")
    func emptyString() {
        // GIVEN
        let string: String? = ""

        // WHEN
        let isEmptyOrNil = string.isEmptyOrNil

        // THEN
        #expect(isEmptyOrNil)
    }

    @Test("String")
    func string() {
        // GIVEN
        let string: String? = "Hello"

        // WHEN
        let isEmptyOrNil = string.isEmptyOrNil

        // THEN
        #expect(!isEmptyOrNil)
    }

    // MARK: - Array Tests

    @Test("Nil array")
    func nilArray() {
        // GIVEN
        let array: [Int]? = nil

        // WHEN
        let isEmptyOrNil = array.isEmptyOrNil

        // THEN
        #expect(isEmptyOrNil)
    }

    @Test("Empty array")
    func emptyArray() {
        // GIVEN
        let array: [Int]? = []

        // WHEN
        let isEmptyOrNil = array.isEmptyOrNil

        // THEN
        #expect(isEmptyOrNil)
    }

    @Test("Array")
    func array() {
        // GIVEN
        let array: [Int]? = [10, 22, 3]

        // WHEN
        let isEmptyOrNil = array.isEmptyOrNil

        // THEN
        #expect(!isEmptyOrNil)
    }
}
