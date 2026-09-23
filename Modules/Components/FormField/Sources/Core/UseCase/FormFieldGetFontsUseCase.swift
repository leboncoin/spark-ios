//
//  FormFieldGetFontsUseCase.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 06/05/25.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
protocol FormFieldGetFontsUseCaseable {
    func execute(from theme: any Theme) -> FormFieldFonts
}

struct FormFieldGetFontsUseCase: FormFieldGetFontsUseCaseable {

    func execute(from theme: any Theme) -> FormFieldFonts {
        let commonFont = theme.typography.caption
        return .init(
            title: theme.typography.body2,
            clearButton: theme.typography.body2,
            require: commonFont,
            helper: commonFont,
            secondaryHelper: commonFont
        )
    }
}
