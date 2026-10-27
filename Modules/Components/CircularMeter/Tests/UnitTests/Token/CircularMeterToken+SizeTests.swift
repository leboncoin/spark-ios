//
//  CircularMeterToken+SizeTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentCircularMeter

// MARK: - Tests

struct CircularMeterTokenSizeTests {

    // MARK: - Properties

    private let token = CircularMeterToken.Size()

    // MARK: - Tests

    @Test(arguments: [
        (CircularMeterSize.small, CGFloat(24)),
        (CircularMeterSize.medium, CGFloat(64)),
        (CircularMeterSize.large, CGFloat(96)),
        (CircularMeterSize.xLarge, CGFloat(128))
    ])
    func gaugeDiameterShouldReturnExpectedValue(size: CircularMeterSize, expectedValue: CGFloat) {
        #expect(self.token.gaugeDiameter(for: size) == expectedValue)
    }

    @Test(arguments: [
        (CircularMeterSize.small, CGFloat(3)),
        (CircularMeterSize.medium, CGFloat(5)),
        (CircularMeterSize.large, CGFloat(8)),
        (CircularMeterSize.xLarge, CGFloat(10))
    ])
    func gaugeStrokeShouldReturnExpectedValue(size: CircularMeterSize, expectedValue: CGFloat) {
        #expect(self.token.gaugeStroke(for: size) == expectedValue)
    }

    @Test(arguments: [
        (CircularMeterSize.small, CGFloat.zero),
        (CircularMeterSize.medium, CGFloat(24)),
        (CircularMeterSize.large, CGFloat(32)),
        (CircularMeterSize.xLarge, CGFloat(40))
    ])
    func iconShouldReturnExpectedValue(size: CircularMeterSize, expectedValue: CGFloat) {
        #expect(self.token.icon(for: size) == expectedValue)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableShouldReturnTrue() {
        #expect(CircularMeterToken.Size() == CircularMeterToken.Size())
    }
}
