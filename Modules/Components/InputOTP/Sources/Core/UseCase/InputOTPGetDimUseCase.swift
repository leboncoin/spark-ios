//
//  InputOTPGetDimUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetDimUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat
}

struct InputOTPGetDimUseCase: InputOTPGetDimUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, isEnabled: Bool) -> CGFloat {
        return isEnabled ? theme.dims.none : theme.dims.dim3
    }
}
