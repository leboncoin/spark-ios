//
//  IconToken+SizeTests.swift
//  SparkComponentIconTests
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentIcon

// MARK: - Tests

struct IconTokenSizeTests {

    // MARK: - Properties

    private let token = IconToken.Size()

    // MARK: - Tests

    @Test("Value should return expected size", arguments: [
        (IconSize.small, CGFloat(16)),
        (IconSize.medium, CGFloat(24)),
        (IconSize.large, CGFloat(32)),
        (IconSize.extraLarge, CGFloat(40)),
        (IconSize.custom(50), CGFloat(50)),
        (IconSize.custom(0), CGFloat(0)),
        (IconSize.custom(24.5), CGFloat(24.5))
    ])
    func valueShouldReturnExpectedSize(size: IconSize, expectedValue: CGFloat) {
        #expect(self.token.value(for: size) == expectedValue)
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(IconToken.Size() == IconToken.Size())
    }
}
