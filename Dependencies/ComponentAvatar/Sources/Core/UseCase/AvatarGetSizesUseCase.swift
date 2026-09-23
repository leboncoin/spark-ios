//
//  AvatarGetSizesUseCase.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentBadge

// sourcery: AutoMockable, AutoMockTest
protocol AvatarGetSizesUseCaseable {
    func execute(size: AvatarSize) -> AvatarSizes
}

final class AvatarGetSizesUseCase: AvatarGetSizesUseCaseable {

    // MARK: - Methods

    func execute(size: AvatarSize) -> AvatarSizes {
        let avatarSize = self.getSize(for: size)
        let placeholderSize = self.getPlaceholderSize(for: size)
        let actionSize = self.getActionSize(for: size)
        let badgeSize = self.getBadgeSize(for: size)

        return .init(
            size: avatarSize,
            placeholderSize: placeholderSize,
            actionSize: actionSize,
            badgeSize: badgeSize
        )
    }

    // MARK: - Getter

    private func getSize(for size: AvatarSize) -> CGFloat {
        return switch size {
        case .xs: 24
        case .sm: 32
        case .md: 40
        case .lg: 56
        case .xl: 64
        case .xxl: 96
        case .xxxl: 128
        }
    }

    private func getPlaceholderSize(for size: AvatarSize) -> CGFloat {
        return switch size {
        case .xs: 16
        case .sm: 24
        case .md: 32
        case .lg: 48
        case .xl: 56
        case .xxl: 88
        case .xxxl: 120
        }
    }

    private func getActionSize(for size: AvatarSize) -> CGFloat {
        return switch size {
        case .xxl, .xxxl: 32
        default: .zero
        }
    }

    private func getBadgeSize(for size: AvatarSize) -> BadgeSize {
        return switch size {
        case .xs, .sm, .md: .small
        case .lg, .xl, .xxl, .xxxl: .medium
        }
    }
}
