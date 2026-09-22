//
//  AvatarGetScaleEffectUseCaseTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarGetScaleEffectUseCaseTests {

    // MARK: - Properties

    private let sut = AvatarGetScaleEffectUseCase()

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
    func executeShouldReturnExpectedScaleEffectWhenPressed(
        size: AvatarSize,
        isPressed: Bool,
        expectedScaleEffect: CGFloat
    ) {
        // WHEN
        let result = self.sut.execute(size: size, isPressed: isPressed)

        // THEN
        #expect(result == expectedScaleEffect)
    }

    @Test(
        arguments: AvatarSize.allCases
    )
    func executeShouldReturnOneWhenNotPressed(size: AvatarSize) {
        // WHEN
        let result = self.sut.execute(size: size, isPressed: false)

        // THEN
        #expect(result == 1.0)
    }
}
