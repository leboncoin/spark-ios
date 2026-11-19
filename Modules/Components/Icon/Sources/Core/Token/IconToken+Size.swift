//
//  IconToken+Size.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension IconToken {

    /// Contains the theme-independent size values of the Icon.
    struct Size: Equatable {

        // MARK: - Methods

        /// The width and height of the icon.
        public func value(for size: IconSize) -> CGFloat {
            return switch size {
            case .small: 16
            case .medium: 24
            case .large: 32
            case .extraLarge: 40
            case .custom(let size): size
            }
        }
    }
}
