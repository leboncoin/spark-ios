//
//  InputOTPGetColorsUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 03/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> InputOTPColors
}

struct InputOTPGetColorsUseCase: InputOTPGetColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> InputOTPColors {
        return .init(
            separatorColorToken: theme.colors.base.outline
        )
    }
}
