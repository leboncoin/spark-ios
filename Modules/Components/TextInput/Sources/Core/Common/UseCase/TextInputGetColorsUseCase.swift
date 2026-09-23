//
//  TextInputGetColorsUseCase.swift
//  SparkTextField
//
//  Created by Quentin.richard on 21/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TextInputGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: TextInputIntent,
        isFocused: Bool,
        isEnabled: Bool,
        isReadOnly: Bool
    ) -> TextInputColors
}

struct TextInputGetColorsUseCase: TextInputGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TextInputIntent,
        isFocused: Bool,
        isEnabled: Bool,
        isReadOnly: Bool
    ) -> TextInputColors {
        let text = theme.colors.base.onSurface
        let placeholder = theme.colors.base.onSurface.opacity(theme.dims.dim1)

        let border: any ColorToken
        let background: any ColorToken
        if isEnabled, !isReadOnly {
            switch intent {
            case .error:
                border = theme.colors.feedback.error
            case .alert:
                border = theme.colors.feedback.alert
            case .neutral:
                border = isFocused ? theme.colors.base.outlineHigh : theme.colors.base.outline
            case .success:
                border = theme.colors.feedback.success
            }
            background = theme.colors.base.surface
        } else {
            border = theme.colors.base.outline
            background = theme.colors.base.onSurface.opacity(theme.dims.dim5)
        }

        return .init(
            text: text,
            placeholder: placeholder,
            border: border,
            background: background
        )
    }
}
