//
//  CGFloat+DimExtensionTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkCommon

@Suite("CG Float Dim Extension Tests")
struct CGFloatDimExtensionTests {

    // MARK: - Tests

    @Test("Show view from dim with value less than one")
    func showViewFromDimWithValueLessThanOne() {
        // GIVEN
        let value: CGFloat = 0.5

        // WHEN
        let result = value.showViewFromDim

        // THEN
        #expect(result)
    }

    @Test("Show view from dim with value equal to one")
    func showViewFromDimWithValueEqualToOne() {
        // GIVEN
        let value: CGFloat = 1.0

        // WHEN
        let result = value.showViewFromDim

        // THEN
        #expect(!result)
    }

    @Test("Show view from dim with value greater than one")
    func showViewFromDimWithValueGreaterThanOne() {
        // GIVEN
        let value: CGFloat = 2.0

        // WHEN
        let result = value.showViewFromDim

        // THEN
        #expect(!result)
    }

    @Test("Show view from dim with zero")
    func showViewFromDimWithZero() {
        // GIVEN
        let value: CGFloat = 0.0

        // WHEN
        let result = value.showViewFromDim

        // THEN
        #expect(result)
    }

    @Test("Show view from dim with negative value")
    func showViewFromDimWithNegativeValue() {
        // GIVEN
        let value: CGFloat = -0.5

        // WHEN
        let result = value.showViewFromDim

        // THEN
        #expect(result)
    }

    @Test("Show view from dim with small positive value")
    func showViewFromDimWithSmallPositiveValue() {
        // GIVEN
        let value: CGFloat = 0.1

        // WHEN
        let result = value.showViewFromDim

        // THEN
        #expect(result)
    }

    @Test("Show view from dim with very small value")
    func showViewFromDimWithVerySmallValue() {
        // GIVEN
        let value: CGFloat = 0.0001

        // WHEN
        let result = value.showViewFromDim

        // THEN
        #expect(result)
    }

    @Test("Show view from dim with large value")
    func showViewFromDimWithLargeValue() {
        // GIVEN
        let value: CGFloat = 100.0

        // WHEN
        let result = value.showViewFromDim

        // THEN
        #expect(!result)
    }
}
