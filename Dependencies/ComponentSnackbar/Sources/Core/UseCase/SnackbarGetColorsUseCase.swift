//
//  SnackbarGetColorsUseCase.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SnackbarGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: SnackbarIntent
    ) -> SnackbarColors
}

struct SnackbarGetColorsUseCase: SnackbarGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: SnackbarIntent
    ) -> SnackbarColors {
        let colors = theme.colors

        return switch intent {
        case .success:
            SnackbarColors(
                tintColorToken: colors.feedback.onSuccessContainer,
                backgroundColorToken: colors.feedback.successContainer,
                borderColorToken: colors.feedback.success
            )
        case .alert:
            SnackbarColors(
                tintColorToken: colors.feedback.onAlertContainer,
                backgroundColorToken: colors.feedback.alertContainer,
                borderColorToken: colors.feedback.alert
            )
        case .error:
            SnackbarColors(
                tintColorToken: colors.feedback.onErrorContainer,
                backgroundColorToken: colors.feedback.errorContainer,
                borderColorToken: colors.feedback.error
            )
        case .info:
            SnackbarColors(
                tintColorToken: colors.feedback.onInfoContainer,
                backgroundColorToken: colors.feedback.infoContainer,
                borderColorToken: colors.feedback.info
            )
        case .accent, .main, .neutral, .support, .surfaceInverse:
            // Deprecated cases - fallback to info
            SnackbarColors(
                tintColorToken: colors.feedback.onInfoContainer,
                backgroundColorToken: colors.feedback.infoContainer,
                borderColorToken: colors.feedback.info
            )
        }
    }
}
