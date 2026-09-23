//
//  SpinnerIntent.swift
//  SparkComponentSpinner
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// `SpinnerIntent` determines the color of the spinner according to the theme.
public enum SpinnerIntent: Equatable {
    case accent
    case alert
    case error
    case info
    case main
    case neutral
    case success
    case support
    /// Use a custom color token. **Use it carefully**.
    case custom(_ colorToken: any ColorToken)

    // MARK: - Properties

    /// The default case. Equals to **.support**.
    public static let `default`: Self = .support

    // MARK: - Equatable

    public static func == (lhs: SpinnerIntent, rhs: SpinnerIntent) -> Bool {
        return switch (lhs, rhs) {
        case (.accent, .accent): true
        case (.alert, .alert): true
        case (.error, .error): true
        case (.info, .info): true
        case (.main, .main): true
        case (.neutral, .neutral): true
        case (.success, .success): true
        case (.support, .support): true
        case (.custom(let lhsValue), .custom(let rhsValue)):
            lhsValue.equals(rhsValue)
        default: false
        }
    }
}
