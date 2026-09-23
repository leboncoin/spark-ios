//
//  InputOTPGetSlotColorsUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetSlotColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, value: String?, onError: Bool, isFocus: Bool) -> InputOTPSlotColors
}

struct InputOTPGetSlotColorsUseCase: InputOTPGetSlotColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, value: String?, onError: Bool, isFocus: Bool) -> InputOTPSlotColors {
        let contentColorToken: any ColorToken
        let borderColorToken: any ColorToken
        let backgroundColorToken: any ColorToken

        if onError {
            contentColorToken = theme.colors.base.onSurface
            borderColorToken = theme.colors.feedback.error
            backgroundColorToken = theme.colors.feedback.errorContainer
        } else if isFocus {
            contentColorToken = theme.colors.base.onSurface
            borderColorToken = theme.colors.base.outline
            backgroundColorToken = theme.colors.base.surface
        } else if let value = value, !value.isEmpty {
            contentColorToken = theme.colors.base.onSurface
            borderColorToken = theme.colors.base.outline
            backgroundColorToken = theme.colors.feedback.neutralContainer
        } else {
            contentColorToken = theme.colors.base.onSurface.opacity(theme.dims.dim3)
            borderColorToken = theme.colors.base.outline
            backgroundColorToken = theme.colors.base.surface
        }

        return .init(
            contentColorToken: contentColorToken,
            borderColorToken: borderColorToken,
            backgroundColorToken: backgroundColorToken
        )
    }
}
