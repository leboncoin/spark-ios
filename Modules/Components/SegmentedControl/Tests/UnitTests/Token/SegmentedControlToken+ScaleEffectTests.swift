//
//  SegmentedControlToken+ScaleEffectTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentSegmentedControl

// MARK: - Tests

struct SegmentedControlTokenScaleEffectTests {

    // MARK: - Properties

    private let token = SegmentedControlToken.ScaleEffect()

    // MARK: - Tests

    @Test("Item should return expected scale effect",
        arguments: [
            (true, true, 1.05),
            (true, false, 1.0),
            (false, true, 1.0),
            (false, false, 1.0)
        ]
    )
    func itemShouldReturnExpectedScaleEffect(isPressed: Bool, isEnabled: Bool, expectedScaleEffect: CGFloat) {
        #expect(self.token.item(isPressed: isPressed, isEnabled: isEnabled) == expectedScaleEffect)
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(SegmentedControlToken.ScaleEffect() == SegmentedControlToken.ScaleEffect())
    }
}
