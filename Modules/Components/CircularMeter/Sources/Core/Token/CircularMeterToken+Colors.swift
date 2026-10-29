//
//  CircularMeterToken+Colors.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Colors

public extension CircularMeterToken {

    /// Contains the color token values of the CircularMeter.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The color of the content label.
        public var content: any ColorToken {
            return self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)
        }

        /// The color of the icon.
        public var icon: any ColorToken {
            return self.theme.colors.feedback.neutral
        }

        /// The color of the value label.
        public var value: any ColorToken {
            return self.theme.colors.base.onSurface
        }

        // MARK: - Methods

        /// The color of the indicator arc.
        public func indicator(intent: CircularMeterIntent) -> any ColorToken {
            let colors = self.theme.colors

            return switch intent {
            case .alert: colors.feedback.alert
            case .error: colors.feedback.error
            case .info: colors.feedback.info
            case .main: colors.main.main
            case .success: colors.feedback.success
            case .support: colors.support.support
            }
        }

        /// The color of the track circle.
        public func track(intent: CircularMeterIntent) -> any ColorToken {
            return self.indicator(intent: intent).opacity(self.theme.dims.dim4)
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
