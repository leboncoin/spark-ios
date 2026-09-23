//
//  SnackbarGetColorsUseCaseDeprecated.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 03/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
protocol SnackbarGetColorsUseCasableDeprecated {
    func execute(
        colors: any Colors,
        intent: SnackbarIntent,
        variant: SnackbarVariant
    ) -> SnackbarColorsDeprecated
}

@available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
final class SnackbarGetColorsUseCaseDeprecated: SnackbarGetColorsUseCasableDeprecated {
    func execute(
        colors: any Colors,
        intent: SnackbarIntent,
        variant: SnackbarVariant
    ) -> SnackbarColorsDeprecated {
        switch intent {
        case .success:
            return self.getSuccessColors(colors: colors, variant: variant)
        case .alert:
            return self.getAlertColors(colors: colors, variant: variant)
        case .error:
            return self.getErrorColors(colors: colors, variant: variant)
        case .info:
            return self.getInfoColors(colors: colors, variant: variant)
        case .neutral:
            return self.getNeutralColors(colors: colors, variant: variant)
        case .main:
            return self.getMainColors(colors: colors, variant: variant)
        case .support:
            return self.getSupportColors(colors: colors, variant: variant)
        case .accent:
            return self.getAccentColors(colors: colors, variant: variant)
        case .surfaceInverse:
            return self.getSurfaceInverseColors(colors: colors, variant: variant)
        }
    }

    private func getSuccessColors(colors: any Colors, variant: SnackbarVariant) -> SnackbarColorsDeprecated {
        return .init(
            background: colors.feedback.successContainer,
            foreground: colors.feedback.onSuccessContainer
        )
    }

    private func getAlertColors(colors: any Colors, variant: SnackbarVariant) -> SnackbarColorsDeprecated {
        return .init(
            background: colors.feedback.alertContainer,
            foreground: colors.feedback.onAlertContainer
        )
    }

    private func getErrorColors(colors: any Colors, variant: SnackbarVariant) -> SnackbarColorsDeprecated {
        return .init(
            background: colors.feedback.errorContainer,
            foreground: colors.feedback.onErrorContainer
        )
    }

    private func getInfoColors(colors: any Colors, variant: SnackbarVariant) -> SnackbarColorsDeprecated {
        return .init(
            background: colors.feedback.infoContainer,
            foreground: colors.feedback.onInfoContainer
        )
    }

    private func getNeutralColors(colors: any Colors, variant: SnackbarVariant) -> SnackbarColorsDeprecated {
        return .init(
            background: colors.feedback.neutralContainer,
            foreground: colors.feedback.onNeutralContainer
        )
    }

    private func getMainColors(colors: any Colors, variant: SnackbarVariant) -> SnackbarColorsDeprecated {
        return .init(
            background: colors.main.mainContainer,
            foreground: colors.main.onMainContainer
        )
    }

    private func getSupportColors(colors: any Colors, variant: SnackbarVariant) -> SnackbarColorsDeprecated {
        return .init(
            background: colors.support.supportContainer,
            foreground: colors.support.onSupportContainer
        )
    }

    private func getAccentColors(colors: any Colors, variant: SnackbarVariant) -> SnackbarColorsDeprecated {
        return .init(
            background: colors.accent.accentContainer,
            foreground: colors.accent.onAccentContainer
        )
    }

    private func getSurfaceInverseColors(colors: any Colors, variant _: SnackbarVariant) -> SnackbarColorsDeprecated {
        // Note: variant has no impact on here
        return .init(
            background: colors.base.surfaceInverse,
            foreground: colors.base.onSurfaceInverse
        )
    }
}
