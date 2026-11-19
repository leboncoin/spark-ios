//
//  IconToken+Colors.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Colors

public extension IconToken {

    /// Contains the color token values of the Icon.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The tint color of the icon.
        public func tint(intent: IconIntent) -> any ColorToken {
            let colors = self.theme.colors

            return switch intent {
            case .ai: colors.ai.ai
            case .accent: colors.accent.accent
            case .alert: colors.feedback.alert
            case .error: colors.feedback.error
            case .info: colors.feedback.info
            case .main: colors.main.main
            case .neutral: colors.feedback.neutral
            case .success: colors.feedback.success
            case .support: colors.support.support
            case .custom(let colorToken): colorToken
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
