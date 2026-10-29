//
//  AvatarToken+ScaleEffectTests.swift
//  SparkComponentAvatarTests
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarTokenScaleEffectTests {

    // MARK: - Properties

    private let token = AvatarToken.ScaleEffect()

    // MARK: - Tests

    @Test("Value when pressed should return expected scale effect",
        arguments: [
            (AvatarSize.xs, 1.1),
            (.sm, 1.1),
            (.md, 1.1),
            (.lg, 1.1),
            (.xl, 1.07),
            (.xxl, 1.05),
            (.xxxl, 1.05)
        ]
    )
    func valueWhenPressedShouldReturnExpectedScaleEffect(
        size: AvatarSize,
        expectedScaleEffect: CGFloat
    ) {
        // GIVEN / WHEN
        let result = self.token.value(for: size, isPressed: true)

        // THEN
        #expect(result == expectedScaleEffect)
    }

    @Test("Value when not pressed should return one", arguments: AvatarSize.allCases)
    func valueWhenNotPressedShouldReturnOne(size: AvatarSize) {
        // GIVEN / WHEN
        let result = self.token.value(for: size, isPressed: false)

        // THEN
        #expect(result == 1.0)
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(AvatarToken.ScaleEffect() == AvatarToken.ScaleEffect())
    }
}
