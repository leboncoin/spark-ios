//
//  AvatarGetBorderUseCase.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol AvatarGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        isBorder: Bool,
        size: AvatarSize,
        contentType: AvatarContentType
    ) -> AvatarBorder
}

final class AvatarGetBorderUseCase: AvatarGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        isBorder: Bool,
        size: AvatarSize,
        contentType: AvatarContentType
    ) -> AvatarBorder {
        let width = self.getWidth(
            from: theme,
            isBorder: isBorder,
            size: size
        )

        let radius = self.getRadius(
            from: theme,
            contentType: contentType
        )

        return .init(
            radius: radius,
            width: width
        )
    }

    // MARK: - Getter

    private func getWidth(
        from theme: any Theme,
        isBorder: Bool,
        size: AvatarSize
    ) -> CGFloat {
        guard isBorder else {
            return theme.border.width.none
        }

        return switch size {
        case .xs, .sm, .md: theme.border.width.small
        case .lg, .xl, .xxl, .xxxl: theme.border.width.medium
        }
    }

    private func getRadius(
        from theme: any Theme,
        contentType: AvatarContentType
    ) -> CGFloat {
        return switch contentType {
        case .user: theme.border.radius.full
        case .company: theme.border.radius.medium
        }
    }
}
