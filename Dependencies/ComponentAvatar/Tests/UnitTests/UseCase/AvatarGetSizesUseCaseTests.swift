//
//  AvatarGetSizesUseCaseTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
import SparkComponentBadge
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarGetSizesUseCaseTests {

    // MARK: - Properties

    private let sut = AvatarGetSizesUseCase()

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
    func executeShouldReturnExpectedSizes(
        size: AvatarSize,
        expectedSize: CGFloat,
        expectedPlaceholderSize: CGFloat,
        expectedActionSize: CGFloat,
        expectedBadgeSize: BadgeSize
    ) {
        // WHEN
        let result = self.sut.execute(size: size)

        let expectedSizes = AvatarSizes(
            size: expectedSize,
            placeholderSize: expectedPlaceholderSize,
            actionSize: expectedActionSize,
            badgeSize: expectedBadgeSize
        )

        // THEN
        #expect(result == expectedSizes)
    }
}
