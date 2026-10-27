//
//  CircularMeterToken+Content.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Content

public extension CircularMeterToken {

    /// Contains the theme-independent content values of the CircularMeter.
    struct Content: Equatable {

        // MARK: - Methods

        /// Whether the value, content, icon or image are displayed inside the gauge.
        public func isInside(size: CircularMeterSize) -> Bool {
            return switch size {
            case .small: false
            case .medium, .large, .xLarge: true
            }
        }
    }
}
