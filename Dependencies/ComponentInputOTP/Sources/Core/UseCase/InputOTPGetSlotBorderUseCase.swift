//
//  InputOTPGetSlotBorderUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetSlotBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, onError: Bool, isFocus: Bool) -> InputOTPSlotBorder
}

struct InputOTPGetSlotBorderUseCase: InputOTPGetSlotBorderUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, onError: Bool, isFocus: Bool) -> InputOTPSlotBorder {
        let width = if onError || isFocus {
            theme.border.width.medium
        } else {
            theme.border.width.small
        }

        return .init(
            width: width,
            radius: theme.border.radius.medium
        )
    }
}
