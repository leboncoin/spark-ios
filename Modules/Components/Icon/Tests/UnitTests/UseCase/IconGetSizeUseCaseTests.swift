//
//  IconGetSizeUseCaseTests.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentIcon

@Suite("Icon Get Size Use Case Tests")
struct IconGetSizeUseCaseTests {

    // MARK: - Properties

    var sut: IconGetSizeUseCase!

    // MARK: - Setup

    init() {

        self.sut = IconGetSizeUseCase()
    }

    // MARK: - Predefined Sizes Tests

    @Test("Execute all predefined sizes")
    func executeAllPredefinedSizes() {
        // GIVEN
        let testCases: [(IconSize, CGFloat)] = [
            (.small, 16.0),
            (.medium, 24.0),
            (.large, 32.0),
            (.extraLarge, 40.0)
        ]

        // WHEN / THEN
        for (size, expectedValue) in testCases {
            let result = self.sut.execute(size: size)
            #expect(result == expectedValue, "Expected size \(size) to return \(expectedValue)")
        }
    }

    // MARK: - Custom Sizes Tests

    @Test("Execute with custom size")
    func executeWithCustomSize() {
        // GIVEN
        let customValue: CGFloat = 50.0
        let size = IconSize.custom(customValue)

        // WHEN
        let result = self.sut.execute(size: size)

        // THEN
        #expect(result == customValue)
    }

    @Test("Execute with custom zero size")
    func executeWithCustomZeroSize() {
        // GIVEN
        let size = IconSize.custom(0.0)

        // WHEN
        let result = self.sut.execute(size: size)

        // THEN
        #expect(result == 0.0)
    }

    @Test("Execute with custom negative size")
    func executeWithCustomNegativeSize() {
        // GIVEN
        let size = IconSize.custom(-10.0)

        // WHEN
        let result = self.sut.execute(size: size)

        // THEN
        #expect(result == -10.0)
    }

    @Test("Execute with custom fractional size")
    func executeWithCustomFractionalSize() {
        // GIVEN
        let size = IconSize.custom(24.5)

        // WHEN
        let result = self.sut.execute(size: size)

        // THEN
        #expect(result == 24.5)
    }
}
