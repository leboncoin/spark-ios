//
//  InputOTPToken+Opacity.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Opacity

public extension InputOTPToken {

    /// Contains the opacity token values of the InputOTP.
    struct Opacity: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The opacity of the input OTP.
        public func value(isEnabled: Bool) -> CGFloat {
            let dims = self.theme.dims

            return isEnabled ? dims.none : dims.dim3
        }

        // MARK: - Equatable

        public static func == (lhs: Opacity, rhs: Opacity) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
