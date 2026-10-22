//
//  SizeRule.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 09/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentBadge

// MARK: - Properties

extension AvatarSize {

    var value: CGFloat {
        return switch self {
        case .xs: 24
        case .sm: 32
        case .md: 40
        case .lg: 56
        case .xl: 64
        case .xxl: 96
        case .xxxl: 128
        }
    }

    var placeholderSize: CGFloat {
        return switch self {
        case .xs: 16
        case .sm: 24
        case .md: 32
        case .lg: 48
        case .xl: 56
        case .xxl: 88
        case .xxxl: 120
        }
    }

    var actionSize: CGFloat {
        return switch self {
        case .xxl, .xxxl: 32
        default: .zero
        }
    }

    var badgeSize: BadgeSize {
        return switch self {
        case .xs, .sm, .md: .small
        case .lg, .xl, .xxl, .xxxl: .medium
        }
    }
}
