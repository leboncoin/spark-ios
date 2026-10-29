//
//  InputOTPDigits+SeparatorExtension.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension InputOTPDigits {

    // MARK: - Properties

    var isSeparator: Bool {
        return switch self {
        case .four: false
        default: true
        }
    }

    // MARK: - Methods

    func showSeparator(at index: Int) -> Bool {
        return self.isSeparator && index == self.rawValue / 2
    }
}
