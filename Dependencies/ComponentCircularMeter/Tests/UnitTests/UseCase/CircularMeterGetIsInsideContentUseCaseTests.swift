//
//  CircularMeterGetIsInsideContentUseCaseTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 29/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
import Testing

@Suite("Circular Meter Get Is Inside Content Use Case Tests")
struct CircularMeterGetIsInsideContentUseCaseTests {

    // MARK: - Private properties

    private let sut = CircularMeterGetIsInsideContentUseCase()

    // MARK: - Tests

    @Test("Execute with small size returns false")
    func executeWithSmallSizeReturnsFalse() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .small)

        // THEN
        #expect(result == false)
    }

    @Test("Execute with medium size returns true")
    func executeWithMediumSizeReturnsTrue() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .medium)

        // THEN
        #expect(result == true)
    }

    @Test("Execute with large size returns true")
    func executeWithLargeSizeReturnsTrue() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .large)

        // THEN
        #expect(result == true)
    }

    @Test("Execute with xLarge size returns true")
    func executeWithXLargeSizeReturnsTrue() {
        // GIVEN / WHEN
        let result = self.sut.execute(size: .xLarge)

        // THEN
        #expect(result == true)
    }
}
