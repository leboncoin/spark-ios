//
//  CircularMeterToken+Size.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension CircularMeterToken {

    /// Contains the theme-independent size values of the CircularMeter.
    struct Size: Equatable {

        // MARK: - Methods

        /// The diameter of the gauge.
        public func gaugeDiameter(for size: CircularMeterSize) -> CGFloat {
            return switch size {
            case .small: 24
            case .medium: 64
            case .large: 96
            case .xLarge: 128
            }
        }

        /// The stroke width of the gauge.
        public func gaugeStroke(for size: CircularMeterSize) -> CGFloat {
            return switch size {
            case .small: 3
            case .medium: 5
            case .large: 8
            case .xLarge: 10
            }
        }

        /// The width and height of the icon. Zero when the icon isn't displayed.
        public func icon(for size: CircularMeterSize) -> CGFloat {
            return switch size {
            case .small: .zero
            case .medium: 24
            case .large: 32
            case .xLarge: 40
            }
        }
    }
}
