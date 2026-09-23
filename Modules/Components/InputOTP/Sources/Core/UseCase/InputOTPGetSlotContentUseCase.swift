//
//  InputOTPGetSlotContentUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetSlotContentUseCaseable {
    func execute(value: String?, isFocus: Bool) -> String
}

struct InputOTPGetSlotContentUseCase: InputOTPGetSlotContentUseCaseable {

    // MARK: - Methods

    func execute(value: String?, isFocus: Bool) -> String {
        if let value = value, !value.isEmpty {
            return value
        } else if isFocus {
            return InputOTPConstants.Content.focus
        } else {
            return InputOTPConstants.Content.empty
        }
    }
}
