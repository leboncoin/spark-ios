//
//  FormFieldGetColorsUseCase.swift
//  SparkComponentFormField
//
//  Created by alican.aycil on 31.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
protocol FormFieldGetColorsUseCaseable {
    func execute(from theme: any Theme, feedback state: FormFieldFeedbackState) -> FormFieldColors
}

struct FormFieldGetColorsUseCase: FormFieldGetColorsUseCaseable {

    func execute(from theme: any Theme, feedback state: FormFieldFeedbackState) -> FormFieldColors {
        let commonColor = theme.colors.base.onSurface.opacity(theme.dims.dim1)
        let helper = switch state {
        case .default: commonColor
        case .error: theme.colors.feedback.error
        }

        return .init(
            title: theme.colors.base.onSurface,
            clearButton: theme.colors.feedback.onNeutralContainer,
            require: commonColor,
            helper: helper,
            secondaryHelper: commonColor
        )
    }
}
