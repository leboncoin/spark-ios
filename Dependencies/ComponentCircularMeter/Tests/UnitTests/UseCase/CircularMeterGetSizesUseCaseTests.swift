//
//  CircularMeterGetSizesUseCaseTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
import Testing

@Suite("Circular Meter Get Sizes Use Case Tests")
struct CircularMeterGetSizesUseCaseTests {

    // MARK: - Private properties

    private let sut = CircularMeterGetSizesUseCase()

    // MARK: - Tests

    @Test("Execute with small size")
    func executeWithSmallSize() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .small)

        // THEN
        #expect(result.gaugeDiameter == 24)
        #expect(result.gaugeStroke == 3)
        #expect(result.icon == 0)
    }

    @Test("Execute with medium size")
    func executeWithMediumSize() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .medium)

        // THEN
        #expect(result.gaugeDiameter == 64)
        #expect(result.gaugeStroke == 5)
        #expect(result.icon == 24)
    }

    @Test("Execute with large size")
    func executeWithLargeSize() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .large)

        // THEN
        #expect(result.gaugeDiameter == 96)
        #expect(result.gaugeStroke == 8)
        #expect(result.icon == 32)
    }

    @Test("Execute with xLarge size")
    func executeWithXLargeSize() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .xLarge)

        // THEN
        #expect(result.gaugeDiameter == 128)
        #expect(result.gaugeStroke == 10)
        #expect(result.icon == 40)
    }
}
