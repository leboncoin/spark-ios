//
//  AvatarToken+SizeTests.swift
//  SparkComponentAvatarTests
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
import SparkComponentBadge
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarTokenSizeTests {

    // MARK: - Properties

    private let token = AvatarToken.Size()

    // MARK: - Tests

    @Test(
        arguments: [
            (AvatarSize.xs, 24.0, 16.0, 0.0, BadgeSize.small),
            (.sm, 32.0, 24.0, 0.0, .small),
            (.md, 40.0, 32.0, 0.0, .small),
            (.lg, 56.0, 48.0, 0.0, .medium),
            (.xl, 64.0, 56.0, 0.0, .medium),
            (.xxl, 96.0, 88.0, 32.0, .medium),
            (.xxxl, 128.0, 120.0, 32.0, .medium)
        ]
    )
    func sizesShouldReturnExpectedValues(
        size: AvatarSize,
        expectedValue: CGFloat,
        expectedPlaceholder: CGFloat,
        expectedAction: CGFloat,
        expectedBadge: BadgeSize
    ) {
        // GIVEN / WHEN / THEN
        #expect(self.token.value(for: size) == expectedValue)
        #expect(self.token.placeholder(for: size) == expectedPlaceholder)
        #expect(self.token.action(for: size) == expectedAction)
        #expect(self.token.badge(for: size) == expectedBadge)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableShouldReturnTrue() {
        #expect(AvatarToken.Size() == AvatarToken.Size())
    }
}
