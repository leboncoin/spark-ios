//
//  CircularMeterToken+ContentTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCircularMeter

// MARK: - Tests

struct CircularMeterTokenContentTests {

    // MARK: - Properties

    private let token = CircularMeterToken.Content()

    // MARK: - Tests

    @Test("Is inside should return expected value", arguments: [
        (CircularMeterSize.small, false),
        (CircularMeterSize.medium, true),
        (CircularMeterSize.large, true),
        (CircularMeterSize.xLarge, true)
    ])
    func isInsideShouldReturnExpectedValue(size: CircularMeterSize, expectedValue: Bool) {
        #expect(self.token.isInside(size: size) == expectedValue)
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(CircularMeterToken.Content() == CircularMeterToken.Content())
    }
}
