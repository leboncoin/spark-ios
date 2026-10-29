//
//  InputOTPToken+Colors.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Colors

public extension InputOTPToken {

    /// Contains the color token values of the InputOTP.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The color of the separator.
        public var separator: any ColorToken {
            return self.theme.colors.base.outline
        }

        // MARK: - Methods

        /// The color of the slot content.
        public func slotContent(value: String?, onError: Bool, isFocus: Bool) -> any ColorToken {
            let onSurface = self.theme.colors.base.onSurface

            guard !onError, !isFocus, value?.isEmpty ?? true else {
                return onSurface
            }

            return onSurface.opacity(self.theme.dims.dim3)
        }

        /// The border color of the slot.
        public func slotBorder(onError: Bool) -> any ColorToken {
            let colors = self.theme.colors

            return onError ? colors.feedback.error : colors.base.outline
        }

        /// The background color of the slot.
        public func slotBackground(value: String?, onError: Bool, isFocus: Bool) -> any ColorToken {
            let colors = self.theme.colors

            if onError {
                return colors.feedback.errorContainer
            } else if isFocus {
                return colors.base.surface
            } else if let value, !value.isEmpty {
                return colors.feedback.neutralContainer
            } else {
                return colors.base.surface
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
