//
//  CGSize+InitExtensionTests.swift
//  SparkCoreUnitTests
//
//  Created by robin.lemaire on 12/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing

@_spi(SI_SPI) @testable import SparkCommon

@Suite("CG Size Init Extension Tests")
struct CGSizeInitExtensionTests {

    // MARK: - Tests

    @Test("Init with single value")
    func initWithSingleValue() throws {
        // GIVEN
        let size = CGSize(value: 10.0)

        // WHEN / THEN
        #expect(size.width == 10.0, "Width should equal the provided value")
        #expect(size.height == 10.0, "Height should equal the provided value")
    }

    @Test("Init with zero")
    func initWithZero() throws {
        // GIVEN
        let size = CGSize(value: 0.0)

        // WHEN / THEN
        #expect(size.width == 0.0, "Width should be zero")
        #expect(size.height == 0.0, "Height should be zero")
    }

    @Test("Init with negative value")
    func initWithNegativeValue() throws {
        // GIVEN
        let size = CGSize(value: -5.5)

        // WHEN / THEN
        #expect(size.width == -5.5, "Width should equal the negative value")
        #expect(size.height == -5.5, "Height should equal the negative value")
    }

    @Test("Init with large value")
    func initWithLargeValue() throws {
        // GIVEN
        let size = CGSize(value: 1000.0)

        // WHEN / THEN
        #expect(size.width == 1000.0, "Width should equal the large value")
        #expect(size.height == 1000.0, "Height should equal the large value")
    }

    @Test("Init with decimal value")
    func initWithDecimalValue() throws {
        // GIVEN
        let size = CGSize(value: 3.14)

        // WHEN / THEN
        #expect(abs(size.width - (3.14)) <= 0.001, "Width should equal the decimal value")
        #expect(abs(size.height - (3.14)) <= 0.001, "Height should equal the decimal value")
    }

}
