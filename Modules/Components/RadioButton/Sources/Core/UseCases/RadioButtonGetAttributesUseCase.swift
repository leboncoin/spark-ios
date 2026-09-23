//
//  RadioButtonGetAttributesUseCase.swift
//  SparkRadioButton
//
//  Created by michael.zimmermann on 18.09.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

protocol RadioButtonGetAttributesUseCaseable {
    func execute(theme: any Theme,
                 intent: RadioButtonIntent,
                 state: RadioButtonStateAttribute,
                 alignment: RadioButtonLabelAlignment
    ) -> RadioButtonAttributes
}

struct RadioButtonGetAttributesUseCase: RadioButtonGetAttributesUseCaseable {
    let colorsUseCase: any RadioButtonGetColorsUseCaseable

    init(colorsUseCase: any RadioButtonGetColorsUseCaseable = RadioButtonGetColorsUseCase()) {
        self.colorsUseCase = colorsUseCase
    }
    func execute(theme: any Theme,
                 intent: RadioButtonIntent,
                 state: RadioButtonStateAttribute,
                 alignment: RadioButtonLabelAlignment
    ) -> RadioButtonAttributes {
        return RadioButtonAttributes(
            colors: self.colorsUseCase.execute(
                theme: theme,
                intent: intent,
                isSelected: state.isSelected),
            opacity: state.isEnabled ? 1 : theme.dims.dim3,
            spacing: theme.layout.spacing.medium,
            font: theme.typography.body1)
    }
}
