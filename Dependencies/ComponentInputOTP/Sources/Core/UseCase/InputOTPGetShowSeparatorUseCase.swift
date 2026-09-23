//
//  InputOTPGetShowSeparatorUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetShowSeparatorUseCaseable {
    func execute(isSeparator: Bool, index: Int, digits: InputOTPDigits) -> Bool
}

struct InputOTPGetShowSeparatorUseCase: InputOTPGetShowSeparatorUseCaseable {

    // MARK: - Methods

    func execute(isSeparator: Bool, index: Int, digits: InputOTPDigits) -> Bool {
        return isSeparator && index == digits.rawValue / 2
    }
}
