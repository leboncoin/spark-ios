//
//  IconIntent.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// Intents of the icon.
public enum IconIntent: Equatable {
    /// Use the **accent** colors on current theme.
    case accent
    /// Use the **feedback** colors on current theme.
    case alert
    /// Use the **feedback** colors on current theme.
    case error
    /// Use the **feedback** colors on current theme.
    case info
    /// Use the **main** colors on current theme.
    case main
    /// Use the **feedback** colors on current theme.
    case neutral
    /// Use the **feedback** colors on current theme.
    case success
    /// Use the **support** colors on current theme.
    case support
    /// Use a custom color token. **Use it carefully**.
    case custom(_ colorToken: any ColorToken)

    // MARK: - Properties

    /// The default case. Equals to **.support**.
    public static let `default`: Self = .support

    // MARK: - Equatable

    public static func == (lhs: IconIntent, rhs: IconIntent) -> Bool {
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
