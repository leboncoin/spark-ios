//
//  AvatarGetCornerViewOffsetUseCase.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol AvatarGetCornerViewOffsetUseCaseable {
    func execute(
        contentType: AvatarContentType,
        avatarSize: CGFloat,
        cornerViewSize: CGSize?
    ) -> CGSize
}

struct AvatarGetCornerViewOffsetUseCase: AvatarGetCornerViewOffsetUseCaseable {

    // MARK: - Methods

    func execute(
        contentType: AvatarContentType,
        avatarSize: CGFloat,
        cornerViewSize: CGSize?
    ) -> CGSize {
        return switch contentType {
        case .user: self.getCircleOffset(avatarSize: avatarSize)
        case .company: self.getRectangleOffset(avatarSize: avatarSize, cornerViewSize: cornerViewSize)
        }
    }

    // MARK: - Getter

    private func getCircleOffset(avatarSize: CGFloat) -> CGSize {
        // For circles, position at 45 degrees on the circle edge
        // Using Pythagorean theorem: offset = radius * sqrt(2) / 2
        let radius = avatarSize / 2
        let offset = radius * (sqrt(2) / 2)
        return CGSize(width: offset, height: offset)
    }

    private func getRectangleOffset(avatarSize: CGFloat, cornerViewSize: CGSize?) -> CGSize {
        // For rectangles, position at the corner with half of the badge outside plus a percent
        let offset = avatarSize / 2 - (cornerViewSize?.width ?? 0) * 0.25
        return CGSize(width: offset, height: offset)
    }
}
