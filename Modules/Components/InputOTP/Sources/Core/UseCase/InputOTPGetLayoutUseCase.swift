//
//  InputOTPGetLayoutUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> InputOTPLayout
}

struct InputOTPGetLayoutUseCase: InputOTPGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> InputOTPLayout {
        return .init(
            spacing: theme.layout.spacing.medium,
            padding: theme.layout.spacing.medium
        )
    }
}
