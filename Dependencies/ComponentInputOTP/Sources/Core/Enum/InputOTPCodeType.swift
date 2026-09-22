//
//  InputOTPCodeType.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import UIKit

/// The type of code for the input OTP.
@frozen
public enum InputOTPCodeType: CaseIterable {
    case number
    case letter
    case alphanumeric

    // MARK: - Properties

    /// The default value. Equals to **.number**.
    public static let `default`: InputOTPCodeType = .number

    internal var keyboardType: UIKeyboardType {
        return switch self {
        case .number: .numberPad
        case .letter: .alphabet
        case .alphanumeric: .asciiCapable
        }
    }
}
