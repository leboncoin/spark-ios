//
//  InputOTPGetValidatedValueUseCase.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol InputOTPGetValidatedValueUseCaseable {
    func execute(
        value: String,
        codeType: InputOTPCodeType,
        digits: InputOTPDigits
    ) -> InputOTPValidatedValue
}

struct InputOTPGetValidatedValueUseCase: InputOTPGetValidatedValueUseCaseable {

    // MARK: - Methods

    func execute(
        value: String,
        codeType: InputOTPCodeType,
        digits: InputOTPDigits
    ) -> InputOTPValidatedValue {
        let filtered = self.filterValue(value, codeType: codeType)
        let hadInvalidCharacters = filtered != value
        let maxLength = digits.rawValue

        // If the filtered value exceeds the max length, replace the last character
        if filtered.count > maxLength {
            let prefix = filtered.dropLast(filtered.count - maxLength + 1)
            let lastChar = filtered.last.map { String($0) } ?? ""
            let resultValue = (prefix + lastChar).uppercased()
            return InputOTPValidatedValue(
                value: resultValue,
                hadInvalidCharacters: hadInvalidCharacters
            )
        }

        let resultValue = String(filtered.prefix(maxLength)).uppercased()
        return InputOTPValidatedValue(
            value: resultValue,
            hadInvalidCharacters: hadInvalidCharacters
        )
    }

    // MARK: - Private Methods

    private func filterValue(_ value: String, codeType: InputOTPCodeType) -> String {
        return switch codeType {
        case .number:
            value.filter { $0.isNumber }
        case .letter:
            value.filter { $0.isLetter }
        case .alphanumeric:
            value.filter { $0.isLetter || $0.isNumber }
        }
    }
}
