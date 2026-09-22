//
//  BadgeGetSizesUseCase.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol BadgeGetSizesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        size: BadgeSize,
        isBorder: Bool,
        value: Int?
    ) -> BadgeSizes
}

final class BadgeGetSizesUseCase: BadgeGetSizesUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        size: BadgeSize,
        isBorder: Bool,
        value: Int?
    ) -> BadgeSizes {
        let border = isBorder ? theme.border.width.medium : .zero

        let content: CGFloat = switch size {
        case .small: value != nil ? 16 : 8
        case .medium: value != nil ? 24 : 16
        }

        let horizontalSpacing = switch size {
        case .small: theme.layout.spacing.small
        case .medium: theme.layout.spacing.medium
        }

        return .init(
            content: content + border * 2,
            border: border,
            horizontalSpacing: horizontalSpacing + border,
            attachHorizontalSpacing: theme.layout.spacing.small
        )
    }
}
