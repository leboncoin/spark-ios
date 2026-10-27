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

    @Test(
        arguments: [
            (true, 1.05),
            (false, 1.0)
        ]
    )
    func itemShouldReturnExpectedScaleEffect(isPressed: Bool, expectedScaleEffect: CGFloat) {
        #expect(self.token.item(isPressed: isPressed) == expectedScaleEffect)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableShouldReturnTrue() {
        #expect(SegmentedControlToken.ScaleEffect() == SegmentedControlToken.ScaleEffect())
    }
}
