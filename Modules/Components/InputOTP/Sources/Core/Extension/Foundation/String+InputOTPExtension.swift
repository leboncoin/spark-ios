//
//  String+InputOTPExtension.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Methods

    func slotValue(at index: Int) -> String? {
        guard index < self.count else { return nil }
        let characterIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[characterIndex])
    }

    func validated(codeType: InputOTPCodeType, digits: InputOTPDigits) -> InputOTPValidatedValue {
        let filtered = self.filtered(codeType: codeType)
        let hadInvalidCharacters = filtered != self
        let maxLength = digits.rawValue

        // If the filtered value exceeds the max length, replace the last character
        if filtered.count > maxLength {
            let prefix = filtered.dropLast(filtered.count - maxLength + 1)
            let lastChar = filtered.last.map { String($0) } ?? ""
            return .init(
                value: (prefix + lastChar).uppercased(),
                hadInvalidCharacters: hadInvalidCharacters
            )
        }

        return .init(
            value: String(filtered.prefix(maxLength)).uppercased(),
            hadInvalidCharacters: hadInvalidCharacters
        )
    }

    // MARK: - Private Methods

    private func filtered(codeType: InputOTPCodeType) -> String {
        return switch codeType {
        case .number: self.filter { $0.isNumber }
        case .letter: self.filter { $0.isLetter }
        case .alphanumeric: self.filter { $0.isLetter || $0.isNumber }
        }
    }
}

extension Optional where Wrapped == String {

    // MARK: - Methods

    func slotContent(isFocus: Bool) -> String {
        if let self, !self.isEmpty {
            return self
        } else if isFocus {
            return InputOTPConstants.Content.focus
        } else {
            return InputOTPConstants.Content.empty
        }
    }
}
