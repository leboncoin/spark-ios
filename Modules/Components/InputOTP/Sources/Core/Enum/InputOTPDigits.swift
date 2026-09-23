//
//  InputOTPDigits.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// The number of digits for the input OTP.
@frozen
public enum InputOTPDigits: Int, CaseIterable {
    case four = 4
    case six = 6
    case eight = 8

    // MARK: - Properties

    /// The default value. Equals to **.six**.
    public static let `default`: InputOTPDigits = .six
}
