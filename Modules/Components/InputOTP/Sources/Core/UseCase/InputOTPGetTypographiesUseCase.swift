//
//  InputOTPGetTypographiesUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> InputOTPTypographies
}

struct InputOTPGetTypographiesUseCase: InputOTPGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> InputOTPTypographies {
        return .init(
            contentFontToken: theme.typography.display3
        )
    }
}
