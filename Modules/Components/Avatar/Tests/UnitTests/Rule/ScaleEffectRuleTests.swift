//
//  ScaleEffectRuleTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentAvatar

// MARK: - Tests

struct ScaleEffectRuleTests {

    // MARK: - Tests

    @Test(
        arguments: [
            (AvatarSize.xs, true, 1.1),
            (.sm, true, 1.1),
            (.md, true, 1.1),
            (.lg, true, 1.1),
            (.xl, true, 1.07),
            (.xxl, true, 1.05),
            (.xxxl, true, 1.05)
        ]
    )
    func valueShouldReturnExpectedScaleEffectWhenPressed(
        size: AvatarSize,
        isPressed: Bool,
        expectedScaleEffect: CGFloat
    ) {
        // WHEN
        let result = size.scaleEffect(isPressed: isPressed)

        // THEN
        #expect(result == expectedScaleEffect)
    }

    @Test(
        arguments: AvatarSize.allCases
    )
    func valueShouldReturnOneWhenNotPressed(size: AvatarSize) {
        // WHEN
        let result = size.scaleEffect(isPressed: false)

        // THEN
        #expect(result == 1.0)
    }
}
