//
//  AvatarToken+AnimationTests.swift
//  SparkComponentAvatarTests
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarTokenAnimationTests {

    // MARK: - Properties

    private let token = AvatarToken.Animation()

    // MARK: - Tests

    @Test("pressed duration should return 0.15")
    func pressedDurationShouldReturnValue() {
        #expect(self.token.pressedDuration == 0.15)
    }

    @Test("pressed should return easeInOut with pressed duration")
    func pressedShouldReturnEaseInOut() {
        #expect(self.token.pressed == .easeInOut(duration: 0.15))
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(AvatarToken.Animation() == AvatarToken.Animation())
    }
}
