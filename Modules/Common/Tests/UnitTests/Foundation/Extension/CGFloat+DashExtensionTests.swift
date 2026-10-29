//
//  CGFloat+DashExtensionTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkCommon

@Suite("CG Float Dash Extension Tests")
struct CGFloatDashExtensionTests {

    // MARK: - Tests

    @Test("To dash array with positive value")
    func toDashArrayWithPositiveValue() {
        let value: CGFloat = 5.0

        let result = value.toDashArray

        #expect(result == [5.0])
    }

    @Test("To dash array with small positive value")
    func toDashArrayWithSmallPositiveValue() {
        let value: CGFloat = 0.1

        let result = value.toDashArray

        #expect(result == [0.1])
    }

    @Test("To dash array with zero value")
    func toDashArrayWithZeroValue() {
        let value: CGFloat = 0.0

        let result = value.toDashArray

        #expect(result == [])
    }

    @Test("To dash array with negative value")
    func toDashArrayWithNegativeValue() {
        let value: CGFloat = -5.0

        let result = value.toDashArray

        #expect(result == [])
    }

    @Test("To dash array with large value")
    func toDashArrayWithLargeValue() {
        let value: CGFloat = 1000.0

        let result = value.toDashArray

        #expect(result == [1000.0])
    }
}
