//
//  InputOTPGetIsSeparatorUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetIsSeparatorUseCaseable {
    func execute(digits: InputOTPDigits) -> Bool
}

struct InputOTPGetIsSeparatorUseCase: InputOTPGetIsSeparatorUseCaseable {

    // MARK: - Methods

    func execute(digits: InputOTPDigits) -> Bool {
        return switch digits {
        case .four: false
        default: true
        }
    }
}
