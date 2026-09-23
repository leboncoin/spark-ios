//
//  IconSize.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// Different sizes of icon.
public enum IconSize: Equatable {
    /// Small icon with size of 16x16px
    case small

    /// Small icon with size of 24x24px
    case medium

    /// Small icon with size of 32x32px
    case large

    /// Small icon with size of 40x40px
    case extraLarge

    /// Custom icon size. **Use it carefully**.
    case custom(_ size: CGFloat)

    // MARK: - Properties

    /// The default case. Equals to **.medium**.
    public static let `default`: Self = .medium

    // MARK: - Equatable

    public static func == (lhs: IconSize, rhs: IconSize) -> Bool {
        return switch (lhs, rhs) {
        case (.small, .small): true
        case (.medium, .medium): true
        case (.large, .large): true
        case (.extraLarge, .extraLarge): true
        case (.custom(let lhsValue), .custom(let rhsValue)):
            lhsValue == rhsValue
        default: false
        }
    }
}

// MARK: - Extension
extension IconSize {
    @available(*, deprecated, message: "Not used anymore by the new SparkIcon or SparkUIIcon")
    public var value: CGFloat {
        return switch self {
        case .small: 16
        case .medium: 24
        case .large: 32
        case .extraLarge: 40
        case .custom(let size): size
        }
    }
}
