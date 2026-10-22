//
//  SizeRuleTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 09/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
import SparkComponentBadge
@testable import SparkComponentAvatar

@Suite("Avatar Size Rule Tests")
struct SizeRuleTests {

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
        expectedPlaceholderSize: CGFloat,
        expectedActionSize: CGFloat,
        expectedBadgeSize: BadgeSize
    ) {
        // GIVEN / WHEN / THEN
        #expect(size.value == expectedValue)
        #expect(size.placeholderSize == expectedPlaceholderSize)
        #expect(size.actionSize == expectedActionSize)
        #expect(size.badgeSize == expectedBadgeSize)
    }
}
