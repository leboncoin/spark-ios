//
//  AvatarGetColorsUseCase.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 29/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol AvatarGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        contentType: AvatarContentType,
        isPressed: Bool
    ) -> AvatarColors
}

final class AvatarGetColorsUseCase: AvatarGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        contentType: AvatarContentType,
        isPressed: Bool
    ) -> AvatarColors {
        let backgroundColorToken = self.getBackgroundColorToken(
            from: theme,
            contentType: contentType
        )
        let placeholderTintColorToken = self.getTintColorToken(
            from: theme,
            contentType: contentType
        )

        let actionBackgroundColorToken = self.getIconButtonBackgroundColorToken(
            from: theme,
            isPressed: isPressed
        )
        let actionTintColorToken = self.getIconButtonTintColorToken(
            from: theme,
            isPressed: isPressed
        )

        return .init(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: theme.colors.base.outline,
            placeholderTintColorToken: placeholderTintColorToken,
            actionBackgroundColorToken: actionBackgroundColorToken,
            actionTintColorToken: actionTintColorToken
        )
    }

    // MARK: - Getter

    private func getBackgroundColorToken(
        from theme: any Theme,
        contentType: AvatarContentType
    ) -> any ColorToken {
        return switch contentType {
        case .user: theme.colors.base.surfaceInverse
        case .company: theme.colors.feedback.neutralContainer
        }
    }

    private func getTintColorToken(
        from theme: any Theme,
        contentType: AvatarContentType
    ) -> any ColorToken {
        return switch contentType {
        case .user: theme.colors.base.onSurfaceInverse
        case .company: theme.colors.feedback.onNeutralContainer
        }
    }

    private func getIconButtonBackgroundColorToken(
        from theme: any Theme,
        isPressed: Bool
    ) -> any ColorToken {
        let colors = theme.colors
        return isPressed ? colors.states.surfacePressed : colors.base.surface
    }

    private func getIconButtonTintColorToken(
        from theme: any Theme,
        isPressed: Bool
    ) -> any ColorToken {
        let colors = theme.colors
        return isPressed ? colors.states.neutralPressed : colors.feedback.neutral
    }
}
