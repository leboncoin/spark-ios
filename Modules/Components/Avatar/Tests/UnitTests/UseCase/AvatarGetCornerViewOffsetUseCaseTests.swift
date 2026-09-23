//
//  AvatarGetCornerViewOffsetUseCaseTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarGetCornerViewOffsetUseCaseTests {

    // MARK: - Properties

    private let sut = AvatarGetCornerViewOffsetUseCase()

    // MARK: - Tests

    @Test(
        "Execute with user content type should return circle offset",
        arguments: [
            (24.0, 8.49),
            (32.0, 11.31),
            (40.0, 14.14),
            (56.0, 19.80),
            (64.0, 22.63),
            (96.0, 33.94),
            (128.0, 45.25)
        ]
    )
    func executeWithUserContentType(
        avatarSize: CGFloat,
        expectedSize: CGFloat
    ) {
        // WHEN
        let result = self.sut.execute(
            contentType: .user,
            avatarSize: avatarSize,
            cornerViewSize: nil
        )

        // THEN
        #expect(abs(result.width - expectedSize) < 0.01)
        #expect(abs(result.height - expectedSize) < 0.01)
    }

    @Test(
        "Execute with company content type and corner view size should return rectangle offset",
        arguments: [
            (24.0, 12.0, 9.0),
            (32.0, 16.0, 12.0),
            (40.0, 20.0, 15.0),
            (56.0, 28.0, 21.0),
            (64.0, 32.0, 24.0),
            (96.0, 48.0, 36.0),
            (128.0, 64.0, 48.0)
        ]
    )
    func executeWithCompanyContentTypeAndCornerViewSize(
        avatarSize: CGFloat,
        cornerViewWidth: CGFloat,
        expectedSize: CGFloat
    ) {
        // GIVEN
        let cornerViewSize = CGSize(width: cornerViewWidth, height: cornerViewWidth)

        // WHEN
        let result = self.sut.execute(
            contentType: .company,
            avatarSize: avatarSize,
            cornerViewSize: cornerViewSize
        )

        // THEN
        #expect(result.width == expectedSize)
        #expect(result.height == expectedSize)
    }

    @Test(
        "Execute with company content type and nil corner view size should return half avatar size",
        arguments: [
            24.0, 32.0, 40.0, 56.0, 64.0, 96.0, 128.0
        ]
    )
    func executeWithCompanyContentTypeAndNilCornerViewSize(
        avatarSize: CGFloat
    ) {
        // WHEN
        let result = self.sut.execute(
            contentType: .company,
            avatarSize: avatarSize,
            cornerViewSize: nil
        )

        // THEN
        let expectedOffset = avatarSize / 2
        #expect(result.width == expectedOffset)
        #expect(result.height == expectedOffset)
    }
}
